import 'dart:io';
import 'package:flutter/material.dart';

class profileContent {
  File? profImage;
  String userName;
  int userAge;
  bool IsMale;
  int userHeight;
  double userWeight;

  profileContent(
      {required this.profImage,
      required this.userName,
      required this.userAge,
      required this.IsMale,
      required this.userHeight,
      required this.userWeight});
}
