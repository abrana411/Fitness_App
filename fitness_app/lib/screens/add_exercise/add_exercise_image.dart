import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';

class AddExerciseImage extends StatefulWidget {
  const AddExerciseImage({Key? key}) : super(key: key);

  @override
  _AddExerciseImageState createState() => _AddExerciseImageState();
}

File? storedImage;

class _AddExerciseImageState extends State<AddExerciseImage> {
  _choosePicture(ImageSource src) async {
    final imageFile = await ImagePicker().pickImage(
      source: src,
      maxWidth: 600,
    );
    final croppedImage = imageFile == null
        ? File("assets/images/exercise.png")
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
      storedImage = croppedImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
            ),
            child: storedImage == null
                ? Image.asset(
                    'assets/images/exercise.png',
                    fit: BoxFit.cover,
                  )
                : Image.file(
                    storedImage!,
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
