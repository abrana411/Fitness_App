import 'dart:io';

import 'package:fitness_app/providers/forrebuilding.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:provider/provider.dart';

class EditProfileImageInput extends StatefulWidget {
  // const EditProfileImageInput({Key? key}) : super(key: key);

  File initImage;
  EditProfileImageInput(this.initImage);

  @override
  State<EditProfileImageInput> createState() => _EditProfileImageInputState();
}

File? storedImage3;

class _EditProfileImageInputState extends State<EditProfileImageInput> {
  _choosePicture(ImageSource src) async {
    final imageFile = await ImagePicker().pickImage(
      source: src,
      maxWidth: 600,
    );
    final croppedImage = await ImageCropper().cropImage(
      sourcePath: imageFile!.path,
      aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
      androidUiSettings: AndroidUiSettings(
        backgroundColor: Theme.of(context).backgroundColor,
        toolbarColor: Theme.of(context).primaryColor,
        toolbarWidgetColor: Colors.white,
      ),
    );
    setState(() {
      storedImage3 = croppedImage;
      Provider.of<Rebuildd>(context, listen: false).notifyForRebuild();
    });
  }

  @override
  void initState() {
    storedImage3 = widget.initImage;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: <Widget>[
        ClipOval(
          child: Container(
              width: 150,
              height: 150,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.amber,
              ),
              child: Image.file(widget.initImage, fit: BoxFit.cover,
                  errorBuilder: (BuildContext context, Object exception,
                      StackTrace? stackTrace) {
                return Image.asset(
                  'assets/images/exercise.png',
                  fit: BoxFit.cover,
                );
              })),
        ),
        Positioned(
          bottom: -25,
          child: Row(
            children: <Widget>[
              Container(
                height: 45,
                width: 55,
                decoration: const BoxDecoration(
                  color: Color(0XFFF95C05),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5),
                    bottomLeft: Radius.circular(5),
                  ),
                ),
                child: IconButton(
                  icon: const Icon(Icons.camera_alt),
                  iconSize: 30,
                  onPressed: () {
                    _choosePicture(ImageSource.camera);
                  },
                ),
              ),
              Container(
                width: 2,
                height: 45,
                color: Colors.white,
              ),
              Container(
                height: 45,
                width: 55,
                decoration: const BoxDecoration(
                  color: Color(0XFFF95C05),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(5),
                    bottomRight: Radius.circular(5),
                  ),
                ),
                child: IconButton(
                  icon: const Icon(Icons.image),
                  iconSize: 30,
                  onPressed: () {
                    _choosePicture(ImageSource.gallery);
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
