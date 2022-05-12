import '../data/profiledata.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class provideProfile with ChangeNotifier {
  List<profileContent> _profileitem = [];
  List<profileContent> get item {
    return [..._profileitem];
  }

  //function for adding profile:-
  void addNewUser(File? image, String name, int height, double weight,
      bool gender, int age) {
    _profileitem.add(profileContent(
        profImage: image ?? File("assets/images/exercise.png"),
        userName: name,
        userAge: age,
        IsMale: gender,
        userHeight: height,
        userWeight: weight));

    notifyListeners();
  }

  //for updating the profile:-
  void updateUser(File image, String name, int height, double weight,
      bool gender, int age) {
    _profileitem.removeAt(0);
    _profileitem.add(profileContent(
        profImage: image,
        userName: name,
        userAge: age,
        IsMale: gender,
        userHeight: height,
        userWeight: weight));
    notifyListeners();
  }
}
