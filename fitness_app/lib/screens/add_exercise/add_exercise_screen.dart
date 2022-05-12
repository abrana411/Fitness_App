import 'package:fitness_app/screens/exercise%20screen/exercises.dart';
import 'package:flutter/material.dart';

import 'add_exercise_image.dart';
import 'add_exercise_form_card.dart';

class AddExerciseScreen extends StatelessWidget {
  const AddExerciseScreen({Key? key}) : super(key: key);

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
                child: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.chevron_left,
                      size: 40,
                    ))),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: const <Widget>[
              Center(
                child: Text(
                  "New Exercise",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 20),
              AddExerciseImage(),
              SizedBox(height: 50),
              AddExerciseFormCard(),
            ],
          ),
        ),
      ),
    );
  }
}
