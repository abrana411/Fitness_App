import 'package:fitness_app/data/exerciseItem.dart';

class Workout {
  // ignore: non_constant_identifier_names
  String Name;
  // ignore: non_constant_identifier_names
  int NumberOfExercises;
  List<ExerciseItem> AllExer;
  int durationInMin;
  List<int> iswhichDay;

  Workout(
      // ignore: non_constant_identifier_names
      {required this.Name,
      // ignore: non_constant_identifier_names
      required this.NumberOfExercises,
      required this.AllExer,
      required this.durationInMin,
      required this.iswhichDay});
}

List<dynamic> days = ["S", "M", "T", "W", "T", "F", "S"];
