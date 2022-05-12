import 'dart:convert';

import 'package:fitness_app/data/exerciseItem.dart';
import 'package:flutter/cupertino.dart';

import '../data/workout.dart';

class workoutprovider with ChangeNotifier {
// ignore: non_constant_identifier_names
  List<Workout> _AllWorkouts = [];
  List<Workout> get items {
    return [..._AllWorkouts];
    //return json.decode(json.encode(_AllWorkouts));
  }

  bool addworkout(String name, int NExercise, List<ExerciseItem> allexer,
      int duration, List<int> exerDays) {
    for (int i = 0; i < _AllWorkouts.length; i++) {
      if (_AllWorkouts[i].Name == name) {
        return false; //will show a snackbar
      }
    }

    //else add
    _AllWorkouts.add(Workout(
        Name: name,
        NumberOfExercises: NExercise,
        AllExer: allexer,
        durationInMin: duration,
        iswhichDay: exerDays));
    notifyListeners();
    return true;
  }

  void editWorkout(int index, String name, int NExercise,
      List<ExerciseItem> allexer, int duration, List<int> exerDays) {
    _AllWorkouts.removeAt(index);
    _AllWorkouts.insert(
        index,
        Workout(
            Name: name,
            NumberOfExercises: NExercise,
            AllExer: allexer,
            durationInMin: duration,
            iswhichDay: exerDays));
  }

  void deleteWorkout(int index) {
    _AllWorkouts.removeAt(index);
    notifyListeners();
  }
}
