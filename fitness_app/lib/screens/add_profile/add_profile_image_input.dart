import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';

class ProfileImageInput extends StatefulWidget {
  const ProfileImageInput({Key? key}) : super(key: key);

  @override
  State<ProfileImageInput> createState() => _ProfileImageInputState();
}

File? storedImage2;

class _ProfileImageInputState extends State<ProfileImageInput> {
  _choosePicture(ImageSource src) async {
    final imageFile = await ImagePicker().pickImage(
      source: src,
      maxWidth: 600,
    );
    final croppedImage = imageFile == null
        ? File("assets/images/profile_image.png")
        : await ImageCropper().cropImage(
            sourcePath: imageFile.path,
            aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
            androidUiSettings: AndroidUiSettings(
              backgroundColor: Theme.of(context).backgroundColor,
              toolbarColor: Theme.of(context).primaryColor,
              toolbarWidgetColor: Colors.white,
            ),
          );
    setState(() {
      storedImage2 = croppedImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: <Widget>[
        ClipOval(
          child: Container(
            width: 180,
            height: 180,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.amber,
            ),
            child: storedImage2 == null
                ? Image.asset(
                    'assets/images/profile_image.png',
                    fit: BoxFit.cover,
                  )
                : Image.file(
                    storedImage2!,
                    fit: BoxFit.cover,
                  ),
          ),
        ),
        Positioned(
          bottom: -25,
          child: Row(
            children: <Widget>[
              TextButton(
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(0),
                  minimumSize: const Size(0, 0),
                ),
                child: Container(
                  height: 45,
                  width: 58,
                  decoration: const BoxDecoration(
                    color: Color(0XFFF95C05),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      bottomLeft: Radius.circular(5),
                    ),
                  ),
                  child: const Icon(
                    Icons.camera_alt,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  _choosePicture(ImageSource.camera);
                },
              ),
              Container(
                width: 2,
                height: 45,
                color: Colors.white,
              ),
              TextButton(
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(0),
                  minimumSize: const Size(0, 0),
                ),
                child: Container(
                  height: 45,
                  width: 58,
                  decoration: const BoxDecoration(
                    color: Color(0XFFF95C05),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(5),
                      bottomRight: Radius.circular(5),
                    ),
                  ),
                  child: const Icon(
                    Icons.image,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  _choosePicture(ImageSource.gallery);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
