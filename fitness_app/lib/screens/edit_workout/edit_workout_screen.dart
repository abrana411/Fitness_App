import 'dart:convert';

import 'package:fitness_app/data/exerciseItem.dart';
import 'package:fitness_app/data/workout.dart';
import 'package:fitness_app/screens/edit_workout/list_to_show_edit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/providers/workoutProvider.dart';
import '/screens/add_workout/listToShowWhileAdding.dart';
import '/providers/exercises.dart';
import '/providers/forrebuilding.dart';
import './edit_repetition.dart';
import '../add_workout/add_exercise_in_list.dart';

// List<ExerciseItem> NottoBeRemoved = [];

class EditWorkoutScreen extends StatefulWidget {
  int index;
  EditWorkoutScreen({Key? key, required this.index}) : super(key: key);

  @override
  State<EditWorkoutScreen> createState() => _EditWorkoutScreenState();
}

class _EditWorkoutScreenState extends State<EditWorkoutScreen> {
  TextEditingController _workoutName = TextEditingController();
  List<Workout> allWorkouts = [];
  @override
  void initState() {
    allWorkouts = Provider.of<workoutprovider>(context, listen: false).items;
    _workoutName = TextEditingController(text: allWorkouts[widget.index].Name);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    toAddExercises2 = allWorkouts[widget.index].AllExer;
    // toAddExercises2 = [...allWorkouts[index].AllExer];
    // toAddExercises2 = List.from(allWorkouts[index].AllExer);
    // toAddExercises2 =
    //     json.decode(json.encode(allWorkouts[widget.index].AllExer))
    //         as List<ExerciseItem>;
    // toAddExercises2 = []..addAll(allWorkouts[index].AllExer);
    List<ExerciseItem> toShowCanBeAdded =
        Provider.of<Exercises>(context, listen: false).item;
    List<ExerciseItem> remainingExer = List.from(toShowCanBeAdded.where(
        (value) => !toAddExercises2.contains(
            value))); //will store those that i want to have after removing those that are there in this workout
    Provider.of<Exercises>(context, listen: false).setList(
        remainingExer); //putting the remaining back into the list responsible for the exercise to select from
    var isRepeatitionMarked = false;
    final deviceSize = MediaQuery.of(context).size;
    daysList2 = allWorkouts[widget.index].iswhichDay;

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
                  for (int i = 0; i < daysList2.length; i++) {
                    if (daysList2[i] == 1) {
                      isRepeatitionMarked = true;
                      break;
                    }
                  }

                  if (isRepeatitionMarked) {
                    if (toAddExercises2.length == 0) {
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
                      for (int i = 0; i < toAddExercises2.length; i++) {
                        durationOfAllExercise += toAddExercises2[i].RestTime *
                                (toAddExercises2[i].NSets - 1) +
                            toAddExercises2[i].SetTime *
                                toAddExercises2[i].NSets;
                      }
                      //update function
                      Provider.of<workoutprovider>(context, listen: false)
                          .editWorkout(
                              widget.index,
                              _workoutName.text,
                              toAddExercises2.length,
                              toAddExercises2,
                              durationOfAllExercise,
                              daysList2);
                      Navigator.pop(context);
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
                "SAVE",
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
                "Edit Workout",
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
                    const EditRepetition(),
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
