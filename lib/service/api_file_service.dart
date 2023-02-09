import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pixel_app/abstractions/Ifile_action_service.dart';
import 'package:pixel_app/abstractions/iprogressing_service.dart';
import 'package:pixel_app/model/file_upload_response_model.dart';
import 'package:pixel_app/service/base_api_service.dart';
import 'package:pixel_app/service/local_notification_progress_service.dart';

class ApiFileService extends BaseApiService implements IFileActionService {
  final IProgressingService progressService;
  ApiFileService({required this.progressService});

  // singleton
  static ApiFileService? instance;

  static ApiFileService getInstance(LocalNotificationProgressService nps){
    instance ??= ApiFileService(progressService: nps);
    return instance!;
  }

  @override
  Future<File> download(Uri uri, String fileName) async {

    final request = await httpClient.getUrl(uri);

    request.headers.add(HttpHeaders.contentTypeHeader, "application/octet-stream");

    var httpResponse = await request.close();

    int byteCount = 0;
    int totalBytes = httpResponse.contentLength;

    Directory appDocDir = await getApplicationDocumentsDirectory();
    String appDocPath = appDocDir.path;

    File file = File("$appDocPath/$fileName.jpg");

    var raf = file.openSync(mode: FileMode.write);

    Completer completer = new Completer<String>();

    progressService.onStart("Download file $fileName");

    httpResponse.listen(
      (data) {
        byteCount += data.length;

        raf.writeFromSync(data);

        int progress = 0;
        if(totalBytes > 1){
          progress = ((byteCount * 100) / totalBytes).round();
        } else 
        {
          progress = 100;
        }
        
        progressService.onProgress("Downloaded", progress);
      },
      onDone: () {
        raf.closeSync();
        print("Done : ${file.path}");
        completer.complete(file.path);
        progressService.onFinished();
      },
      onError: (e) {
        print("err : ${file.path} = $e");
        raf.closeSync();
        file.deleteSync();
        completer.completeError(e);
        progressService.onError();
      },
      cancelOnError: true,
    );

    await completer.future;
    return file;
  }

  @override
  Future<FileUploadResponse> upload(File file, Uri uri) async {
    final request = await httpClient.postUrl(uri);

    int byteCount = 0;

    var multipart =
        await MultipartFile.fromPath("file", file.path);

    var requestMultipart = MultipartRequest("post", Uri.parse("uri"));

    requestMultipart.files.add(multipart);

    var msStream = requestMultipart.finalize();

    var totalByteLength = requestMultipart.contentLength;

    request.contentLength = totalByteLength;

    request.headers.set(HttpHeaders.contentTypeHeader,
        requestMultipart.headers[HttpHeaders.contentTypeHeader]!);

    progressService.onStart("Uploding image");

    Stream<List<int>> streamUpload = msStream.transform(
      StreamTransformer.fromHandlers(
        handleData: (data, sink) {
          sink.add(data);

          byteCount += data.length;

          int progress = ((byteCount * 100) / totalByteLength).round();

          progressService.onProgress("Uploaded", progress);
        },
        handleError: (error, stack, sink) {
          progressService.onError();
        },
        handleDone: (sink) {
          sink.close();
          progressService.onFinished();
        },
      ),
    );

    await request.addStream(streamUpload);

    final httpResponse = await request.close();

    var statusCode = httpResponse.statusCode;

    if (statusCode ~/ 100 != 2) {
      progressService.onError();
      throw Exception(
          'Error uploading file, Status code: ${httpResponse.statusCode}');
    } else {
      progressService.onFinished();
      // convert from httpResponse -> string -> parseJson -> Map<strng, dnmk> -> Object
      return FileUploadResponse.fromMap(
        jsonDecode(
          await readResponseAsString(httpResponse)
        )
      );
    }
    
  }

  static Future<String> readResponseAsString(HttpClientResponse response) {
    var completer = Completer<String>();
    var contents = StringBuffer();
    response.transform(utf8.decoder).listen((String data) {
      contents.write(data);
    }, onDone: () => completer.complete(contents.toString()));
    return completer.future;
  }
}
