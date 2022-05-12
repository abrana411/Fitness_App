import 'dart:io';

import 'package:fitness_app/data/exerciseItem.dart';
import 'package:fitness_app/providers/exercises.dart';
import 'package:fitness_app/screens/add_workout/add_exercise_in_list.dart';
import 'package:fitness_app/screens/edit_exercise/edit_exercise_image.dart';
import 'package:fitness_app/screens/exercise%20screen/exercises.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:provider/provider.dart';
// import './edit_exercise_image.dart';

class EditExerciseFormCard extends StatefulWidget {
  int index;
  String exName;
  int nSets;
  int nReps;
  int setTime;
  int restTime;
  EditExerciseFormCard(
      {Key? key,
      required this.index,
      required this.exName,
      required this.nSets,
      required this.nReps,
      required this.setTime,
      required this.restTime})
      : super(key: key);

  @override
  State<EditExerciseFormCard> createState() => _EditExerciseFormCardState();
}

class _EditExerciseFormCardState extends State<EditExerciseFormCard> {
  // File? ExImg = File("assets/images/exercise.png");
  int _setCount = 0;
  int _repCount = 0;

  Duration _setDuration = const Duration();
  Duration _restDuration = const Duration();
  TextEditingController nameController = TextEditingController();
  @override
  void initState() {
    nameController = TextEditingController(text: widget.exName);
    _setCount = widget.nSets;
    _repCount = widget.nReps;
    int setmins = widget.setTime ~/ 60;
    _setDuration =
        Duration(minutes: setmins, seconds: widget.setTime - setmins * 60);
    int restmins = widget.setTime ~/ 60;
    _restDuration =
        Duration(minutes: restmins, seconds: widget.restTime - restmins * 60);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: <Widget>[
        Container(
          height: 490,
          width: deviceSize.width * 0.9,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Form(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  // Add Name
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    width: deviceSize.width * 0.8,
                    child: TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(
                        hintText: "Name",
                        hintStyle: const TextStyle(color: Colors.white),
                        fillColor: Theme.of(context).accentColor,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                  // No. of Sets
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    width: deviceSize.width * 0.8,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width * 0.35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Theme.of(context).accentColor,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              const Text(
                                "Sets",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                              Row(
                                children: <Widget>[
                                  NumberPicker(
                                    minValue: 1,
                                    maxValue: 99,
                                    itemWidth: 30,
                                    value: _setCount,
                                    textStyle:
                                        const TextStyle(color: Colors.white),
                                    selectedTextStyle: const TextStyle(
                                      fontSize: 18,
                                      color: Color(0XFFF95C04),
                                    ),
                                    onChanged: (value) {
                                      setState(() {
                                        _setCount = value;
                                      });
                                    },
                                  ),
                                  const Text(
                                    "x",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        // No. of Reps
                        Container(
                          width: MediaQuery.of(context).size.width * 0.35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Theme.of(context).accentColor,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              const Text(
                                "Reps",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                              Row(
                                children: <Widget>[
                                  NumberPicker(
                                    minValue: 1,
                                    maxValue: 99,
                                    itemWidth: 30,
                                    value: _repCount,
                                    textStyle:
                                        const TextStyle(color: Colors.white),
                                    selectedTextStyle: const TextStyle(
                                      fontSize: 18,
                                      color: Color(0XFFF95C04),
                                    ),
                                    onChanged: (value) {
                                      setState(() {
                                        _repCount = value;
                                      });
                                    },
                                  ),
                                  const Text(
                                    "x",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Duration of Set
                  Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 5,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          width: 170,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Theme.of(context).accentColor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          alignment: Alignment.center,
                          child: const Padding(
                            padding: EdgeInsets.all(8),
                            child: Text(
                              "Duration of Set",
                            ),
                          ),
                        ),
                        Stack(
                          clipBehavior: Clip.none,
                          alignment: Alignment.center,
                          children: <Widget>[
                            TextButton(
                              child: Container(
                                height: 50,
                                width: MediaQuery.of(context).size.width * 0.4,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).accentColor,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                alignment: Alignment.center,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Text(
                                      _setDuration.inMinutes.toString(),
                                      style: const TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.normal,
                                        color: Color(0XFFF95C04),
                                      ),
                                    ),
                                    const Text(
                                      ":",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      (_setDuration.inSeconds -
                                              _setDuration.inMinutes * 60)
                                          .toString(),
                                      style: const TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.normal,
                                        color: Color(0XFFF95C04),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              onPressed: () {
                                showModalBottomSheet(
                                  constraints: BoxConstraints.tight(
                                    const Size.fromHeight(250),
                                  ),
                                  context: context,
                                  backgroundColor:
                                      Theme.of(context).backgroundColor,
                                  builder: (_) {
                                    return CupertinoTheme(
                                      data: const CupertinoThemeData(
                                          brightness: Brightness.dark),
                                      child: CupertinoTimerPicker(
                                        mode: CupertinoTimerPickerMode.ms,
                                        initialTimerDuration: _setDuration,
                                        onTimerDurationChanged: (newDuration) =>
                                            setState(() {
                                          _setDuration = newDuration;
                                        }),
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                            const Positioned(
                              top: -17.5,
                              child: Icon(
                                Icons.access_time,
                                size: 35,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  // Rest between Sets
                  Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 5,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          width: 170,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Theme.of(context).accentColor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          alignment: Alignment.center,
                          child: const Padding(
                            padding: EdgeInsets.all(8),
                            child: Text(
                              "Rest between Sets",
                            ),
                          ),
                        ),
                        Stack(
                          clipBehavior: Clip.none,
                          alignment: Alignment.center,
                          children: <Widget>[
                            TextButton(
                              child: Container(
                                height: 50,
                                width: MediaQuery.of(context).size.width * 0.4,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).accentColor,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                alignment: Alignment.center,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Text(
                                      _restDuration.inMinutes.toString(),
                                      style: const TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.normal,
                                        color: Color(0XFFF95C04),
                                      ),
                                    ),
                                    const Text(
                                      ":",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      (_restDuration.inSeconds -
                                              _restDuration.inMinutes * 60)
                                          .toString(),
                                      style: const TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.normal,
                                        color: Color(0XFFF95C04),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              onPressed: () {
                                showModalBottomSheet(
                                  constraints: BoxConstraints.tight(
                                    const Size.fromHeight(250),
                                  ),
                                  context: context,
                                  backgroundColor:
                                      Theme.of(context).backgroundColor,
                                  builder: (_) {
                                    return CupertinoTheme(
                                      data: const CupertinoThemeData(
                                          brightness: Brightness.dark),
                                      child: CupertinoTimerPicker(
                                        mode: CupertinoTimerPickerMode.ms,
                                        initialTimerDuration: _restDuration,
                                        onTimerDurationChanged: (newDuration) =>
                                            setState(() {
                                          _restDuration = newDuration;
                                        }),
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                            const Positioned(
                              top: -17.5,
                              child: Icon(
                                Icons.timer,
                                size: 35,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          bottom: -25,
          child: TextButton(
              style: TextButton.styleFrom(
                padding: const EdgeInsets.all(0),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.orange[700]),
                    child: const Text(
                      "UPDATE",
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
              onPressed: () {
                if (nameController.text.isEmpty) {
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text(
                    "Please enter your name ...",
                    style: TextStyle(color: Colors.red),
                  )));
                } else {
                  Provider.of<Exercises>(context, listen: false).updateExercise(
                      nameController.text,
                      _restDuration.inSeconds,
                      _setDuration.inSeconds,
                      _setCount,
                      _repCount,
                      storedImage4,
                      widget.index);

                  Navigator.pop(context);
                }
              }),
        ),
      ],
    );
  }
}
