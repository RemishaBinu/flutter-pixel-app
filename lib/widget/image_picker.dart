import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pixel_app/model/file_upload_response_model.dart';
import 'package:pixel_app/service/api_file_service.dart';
import 'package:pixel_app/service/local_notification_progress_service.dart';

import '../configs/httpservice_conf.dart';

class ImagePickerWidget extends StatefulWidget {
  final ApiFileService fileService = ApiFileService.getInstance(
    LocalNotificationProgressService
      .getInstance()
  );

  final Function(FileUploadResponse fileData) onUploaded;
  String title;
   ImagePickerWidget({required this.title, required this.onUploaded, super.key});

  @override
  State<ImagePickerWidget> createState() => ImagePickerWidgetState();
}

class ImagePickerWidgetState extends State<ImagePickerWidget>  {
  XFile? galleryImage;

  selectFromCamera() async {
    ImagePicker imagePicker = ImagePicker();
    var image = (await imagePicker.pickImage(source: ImageSource.gallery));
    setState(() {
      galleryImage = image;
    });

    var uri = HttpServiceConfig.getApiUri('files/upload');
    FileUploadResponse response = await widget.fileService.upload( File(galleryImage!.path), uri );
    widget.onUploaded(response);
  
  }

  getImage() {
    return galleryImage == null 
      ? AssetImage('assets/images/avatar.jfif')
      : Image.file(File(galleryImage!.path)).image;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Stack(
          children: [
            Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(80),
                  color: const Color.fromARGB(255, 234, 234, 234),
                ),
                child: CircleAvatar(
                    radius: 60,
                    backgroundImage: getImage()

                )
            ),
            Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(80),
                ),
                child: Image.asset(
                  "assets/images/cam.png",
                  alignment: const Alignment(1, 1),
                )),
          ],
        ),
        InkWell(
          onTap: () {
                
              },
          child: ElevatedButton(
            onPressed: selectFromCamera,
            child:  Text(widget.title),
          ),
        ),
        

      ],
    );
  }
}
