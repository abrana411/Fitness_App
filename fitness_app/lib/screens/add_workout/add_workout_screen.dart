import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/providers/workoutProvider.dart';
import '/screens/add_workout/listToShowWhileAdding.dart';
import '/providers/exercises.dart';
import '/providers/forrebuilding.dart';
import 'add_repetition.dart';
import 'add_exercise_in_list.dart';

// List<ExerciseItem> NottoBeRemoved = [];

class AddWorkoutScreen extends StatelessWidget {
  AddWorkoutScreen({Key? key}) : super(key: key);

  final _workoutName = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var isRepeatitionMarked = false;
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () {
                if (_workoutName.text.isEmpty) {
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text(
                    "give a name for this workout",
                    style: TextStyle(color: Colors.red),
                  )));
                } else {
                  for (int i = 0; i < daysList.length; i++) {
                    if (daysList[i] == 1) {
                      isRepeatitionMarked = true;
                      break;
                    }
                  }

                  if (isRepeatitionMarked) {
                    if (toAddExercises.length == 0) {
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text(
                          "Add atleast one exercise to workout",
                          style: TextStyle(color: Colors.red),
                        )),
                      );
                    } else {
                      int durationOfAllExercise = 0;
                      for (int i = 0; i < toAddExercises.length; i++) {
                        durationOfAllExercise += toAddExercises[i].RestTime *
                                (toAddExercises[i].NSets - 1) +
                            toAddExercises[i].SetTime * toAddExercises[i].NSets;
                      }
                      bool canBeAdded =
                          Provider.of<workoutprovider>(context, listen: false)
                              .addworkout(
                                  _workoutName.text,
                                  toAddExercises.length,
                                  toAddExercises,
                                  durationOfAllExercise,
                                  daysList);
                      if (canBeAdded) {
                        Navigator.pop(context);
                      } else {
                        ScaffoldMessenger.of(context).hideCurrentSnackBar();

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text(
                            "Workout with same name already exists",
                            style: TextStyle(color: Colors.red),
                          )),
                        );
                      }
                    }
                  } else {
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text(
                        "Select atleast a day for this workout",
                        style: TextStyle(color: Colors.red),
                      )),
                    );
                  }
                }
              },
              child: const Text(
                "ADD",
                style: TextStyle(
                    color: Colors.white70,
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              ))
        ],
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Row(
          children: <Widget>[
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                  icon: const Icon(
                    Icons.chevron_left,
                    size: 40,
                  ),
                  onPressed: () => Navigator.pop(context)),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              child: const Text(
                "New Workout",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(top: 20),
                padding: const EdgeInsets.symmetric(
                  vertical: 30,
                  horizontal: 20,
                ),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      width: deviceSize.width * 0.8,
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "Add Label",
                          icon: const Icon(
                            Icons.text_snippet_rounded,
                            color: Colors.white,
                          ),
                          hintStyle: const TextStyle(color: Colors.white),
                          fillColor: Theme.of(context).accentColor,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        controller: _workoutName,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      alignment: Alignment.center,
                      child: const Text(
                        "Repeat",
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    const AddRepetition(),
                    const SizedBox(height: 20),
                    //const AddExerciseInList(),
                    Consumer<Rebuildd>(builder: (context, data, _) {
                      return ExerciseWorkoutAdd();
                    })
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(0),
              height: 50,
              width: double.infinity,
              child: TextButton(
                child: const Text(
                  "Add Exercise",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                style: TextButton.styleFrom(
                  backgroundColor: const Color(0XFFF95C04),
                ),
                onPressed: () {
                  showModalBottomSheet(
                    backgroundColor: Theme.of(context).primaryColor,
                    isScrollControlled: true,
                    context: context,
                    builder: (_) => Padding(
                        padding: MediaQuery.of(context).viewInsets,
                        child: AddExerciseInList()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
