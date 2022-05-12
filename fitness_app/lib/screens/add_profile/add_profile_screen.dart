import 'package:flutter/material.dart';

import 'add_profile_image_input.dart';
import 'add_profile_form_card.dart';

class AddProfileScreen extends StatelessWidget {
  const AddProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: ListView(
          children: const <Widget>[
            SizedBox(height: 50),
            Align(
              child: ProfileImageInput(),
            ),
            SizedBox(height: 60),
            Align(
              child: ProfileFormCard(),
            ),
          ],
        ),
      ),
    );
  }
}
