import 'dart:io';

import 'package:pixel_app/model/file_upload_response_model.dart';

abstract class IFileActionService {
  Future<FileUploadResponse> upload(File file, Uri uri);
  Future<File> download(Uri uri, String fileName);
}