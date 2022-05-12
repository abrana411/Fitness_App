import 'package:fitness_app/data/exerciseItem.dart';
import 'package:fitness_app/providers/exercises.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'edit_exercise_form_card.dart';
import './edit_exercise_image.dart';

class EditExerciseScreen extends StatelessWidget {
  int index;
  EditExerciseScreen({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<ExerciseItem> userExercise =
        Provider.of<Exercises>(context, listen: false).items;
    storedImage4 = userExercise[index].ExImage;
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
            children: <Widget>[
              const Center(
                child: Text(
                  "Edit Exercise",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const EditExerciseImage(),
              const SizedBox(height: 50),
              EditExerciseFormCard(
                  index: index,
                  exName: userExercise[index].ExName,
                  nSets: userExercise[index].NSets,
                  nReps: userExercise[index].NReps,
                  setTime: userExercise[index].SetTime,
                  restTime: userExercise[index].RestTime),
            ],
          ),
        ),
      ),
    );
  }
}
