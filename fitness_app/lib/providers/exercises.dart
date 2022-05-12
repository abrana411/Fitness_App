import 'dart:io';

import 'package:fitness_app/data/exerciseItem.dart';
import 'package:flutter/cupertino.dart';

class Exercises with ChangeNotifier {
  //for workout one:-
  List<ExerciseItem> _ToshowAddExer = [];

  List<ExerciseItem> get item {
    return [..._ToshowAddExer];
  }

  List<ExerciseItem> _allItems = [];

  List<ExerciseItem> get items {
    return [..._allItems];
  }

  void setList(List<ExerciseItem> mylist) {
    _ToshowAddExer = mylist;
  }

  void addThisItem(ExerciseItem anItem) {
    _ToshowAddExer.add(anItem);
  }

  bool addExercise(String name, int RestTime, int SetTime, int nSets, int nReps,
      File? Eximage) {
    for (int i = 0; i < _allItems.length; i++) {
      if (_allItems[i].ExName == name) {
        return false;
      }
    }
    _allItems.add(ExerciseItem(
        //adding new exercise to the map
        ExImage: Eximage ?? File("assets/images/exercise.png"),
        ExName: name,
        RestTime: RestTime,
        SetTime: SetTime,
        NReps: nReps,
        NSets: nSets));
    _ToshowAddExer = _allItems;

    notifyListeners();

    return true;
  }

  void updateExercise(String name, int RestTime, int SetTime, int nSets,
      int nReps, File? Eximage, int index) {
    _allItems.removeAt(index);
    _allItems.insert(
        index,
        ExerciseItem(
            ExImage: Eximage!,
            ExName: name,
            NSets: nSets,
            NReps: nReps,
            SetTime: SetTime,
            RestTime: RestTime));
    _ToshowAddExer = _allItems;
    notifyListeners();
  }

  void deleteExercise(int index) {
    _allItems.removeAt(index);
    _ToshowAddExer = _allItems;
    notifyListeners();
  }
}
