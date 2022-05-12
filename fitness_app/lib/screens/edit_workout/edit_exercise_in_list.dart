import 'dart:io';

import 'package:fitness_app/data/exerciseItem.dart';
import 'package:fitness_app/providers/exercises.dart';
import 'package:fitness_app/providers/forrebuilding.dart';
import 'package:fitness_app/screens/add_workout/listToShowWhileAdding.dart';
import 'package:fitness_app/screens/edit_workout/list_to_show_edit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './edit_workout_screen.dart';

class EditExerciseInList extends StatefulWidget {
  EditExerciseInList({
    Key? key,
  }) : super(key: key);

  @override
  State<EditExerciseInList> createState() => _EditExerciseInListState();
}

class _EditExerciseInListState extends State<EditExerciseInList> {
  List<int> _selectedExercises = [];
  List<ExerciseItem> extraList = [];
  List<ExerciseItem> exerciseList = [];

  @override
  void initState() {
    exerciseList = Provider.of<Exercises>(context, listen: false).item;
    extraList = Provider.of<Exercises>(context, listen: false).item;
    for (int i = 0; i < exerciseList.length; i++) {
      _selectedExercises.add(0);
    }
    super.initState();
  }

  void addToTheList() {
    for (int i = 0; i < _selectedExercises.length; i++) {
      if (_selectedExercises[i] == 1) {
        toAddExercises2.add(exerciseList[i]);
      }
    }

    Provider.of<Exercises>(context, listen: false).setList(extraList);
  }

  @override
  Widget build(BuildContext context) {
    return exerciseList.isEmpty
        ? const Center(child: Text("Add Exercise to show them here"))
        : SizedBox(
            height: 300,
            child: Column(
              children: [
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                      itemCount: exerciseList.length,
                      itemBuilder: (context, index) {
                        ExerciseItem thisitem = exerciseList[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              if (_selectedExercises[index] == 0) {
                                _selectedExercises[index] = 1;

                                extraList.remove(thisitem);
                              } else {
                                _selectedExercises[index] = 0;

                                extraList.add(thisitem);
                              }

                              setState(() {});
                            },
                            child: Card(
                              color: Theme.of(context).accentColor,
                              child: ListTile(
                                  title: Text(exerciseList[index].ExName),
                                  leading: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(50),
                                      child: Image.file(
                                          exerciseList[index].ExImage,
                                          fit: BoxFit.cover, errorBuilder:
                                              (BuildContext context,
                                                  Object exception,
                                                  StackTrace? stackTrace) {
                                        return Image.asset(
                                          'assets/images/exercise.png',
                                          fit: BoxFit.cover,
                                          width: 40,
                                          height: 40,
                                        );
                                      }),
                                    ),
                                  ),
                                  trailing: Icon(
                                    Icons.circle_outlined,
                                    color: _selectedExercises[index] == 0
                                        ? Colors.black
                                        : Colors.yellow,
                                    size: 30,
                                  )),
                            ),
                          ),
                        );
                      }),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 30),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.orange[900]),
                  child: IconButton(
                      onPressed: () {
                        addToTheList();
                        Provider.of<Rebuildd>(context, listen: false)
                            .notifyForRebuild();
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.add,
                        size: 30,
                        color: Colors.black,
                      )),
                )
              ],
            ),
          );
  }
}
