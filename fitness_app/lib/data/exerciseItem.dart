import 'dart:io';

class ExerciseItem {
  File ExImage;
  String ExName;
  int NSets;
  int NReps;
  int SetTime;
  int RestTime;

  ExerciseItem(
      {required this.ExImage,
      required this.ExName,
      required this.NSets,
      required this.NReps,
      required this.SetTime,
      required this.RestTime});
  // ExerciseItem.fromJson(Map<String, dynamic> json)
  //     : ExImage = json['i'],
  //       ExName = json['n'],
  //       NSets = json['s'],
  //       NReps = json['r'],
  //       SetTime = json['st'],
  //       RestTime = json['rt'];

  // Map<String, dynamic> toJson() {
  //   return {
  //     'i': ExImage,
  //     'n': ExName,
  //     's': NSets,
  //     'r': NReps,
  //     "st": SetTime,
  //     "rt": RestTime
  //   };
  //}
}
