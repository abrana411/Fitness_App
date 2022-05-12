import 'dart:io';
import 'package:fitness_app/providers/forrebuilding.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/profileProvider.dart';
import '../../data/profiledata.dart';

import 'edit_profile_image_input.dart';
import 'edit_profile_form_card.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  List<profileContent> _initialValues = [];
  @override
  void initState() {
    _initialValues = Provider.of<provideProfile>(context, listen: false).item;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Row(
          children: <Widget>[
            Align(
              alignment: Alignment.centerLeft,
              child: GestureDetector(
                onTap: () {
                  // storedImage3 = _initialValues[0]
                  //     .profImage!; //if we haven't updated the profile and going back..then move this back to storedImage3 as it will be shown below
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.chevron_left,
                  size: 40,
                ),
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            const SizedBox(height: 20),
            Consumer<Rebuildd>(builder: (context, data, _) {
              return Align(
                child: EditProfileImageInput(storedImage3 == null
                    ? _initialValues[0].profImage!
                    : storedImage3!),
              );
            }),
            const SizedBox(height: 80),
            Align(
              child: EditProfileFormCard(
                _initialValues[0].userName,
                _initialValues[0].userAge,
                _initialValues[0].IsMale,
                _initialValues[0].userHeight,
                _initialValues[0].userWeight.toDouble(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
