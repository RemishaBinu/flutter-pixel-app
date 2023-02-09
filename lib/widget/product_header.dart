import 'dart:io';

import 'package:flutter/material.dart';
import 'package:open_file_plus/open_file_plus.dart';
import 'package:pixel_app/service/api_file_service.dart';
import 'package:pixel_app/service/local_notification_progress_service.dart';

import '../configs/httpservice_conf.dart';

class ProductHeader extends StatelessWidget {
  String imageUrl;
  String title;

  ProductHeader(
      {super.key,
      required this.imageUrl,
      required this.title});

  onDownload() async {
    print(imageUrl);
    var uri = Uri.parse(imageUrl);
    String filename = DateTime.now().toIso8601String();
    File? downloadedFile = await (ApiFileService
      .getInstance(
        LocalNotificationProgressService
          .getInstance()
      ))
      .download(uri, filename);

      if(downloadedFile != null){
        OpenFile.open(downloadedFile.path);
      }
  }

  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
    ));
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 4,
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Text(
                    title,
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 17),
                    textAlign: TextAlign.start,
                  ),
                )
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: InkWell(
              onTap: () {
                onDownload()
                  .then((_){
                    showSnackBar(context, "File downloaded");
                  });
              },
              child: const Icon(Icons.download)
            )
          ),
        ],
      ),
    );
  }
}
