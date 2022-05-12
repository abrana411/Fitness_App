import 'dart:io';
import 'package:fitness_app/providers/forrebuilding.dart';
import 'package:fitness_app/screens/edit_exercise/edit_exercise_screen.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:image_picker/image_picker.dart';

import 'package:fitness_app/data/exerciseItem.dart';
import 'package:fitness_app/providers/exercises.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../startExercise Screen/startexercise.dart';

// ignore: camel_case_types, must_be_immutable
class ExercisesList extends StatelessWidget {
  List<ExerciseItem> MyExercises;
  bool allExer;
  ExercisesList({Key? key, required this.MyExercises, required this.allExer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print("Drawn again");
    List<ExerciseItem> _MyExercises;
    if (allExer) {
      _MyExercises = Provider.of<Exercises>(context).items;
    } else {
      _MyExercises = MyExercises;
    }

    var screenWidth = MediaQuery.of(context).size.width;
    return _MyExercises.isEmpty
        ? const SizedBox(
            child: Center(
              child: Text("No Exercises to display"),
            ),
          )
        : ListView.builder(
            itemBuilder: (context, index) {
              String name = _MyExercises[index].ExName;
              int Nsets = _MyExercises[index].NSets;
              int Nreps = _MyExercises[index].NReps;
              File Eximg = _MyExercises[index].ExImage;
              int RTime = _MyExercises[index].RestTime;
              int Stime = _MyExercises[index].SetTime;
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => StartExercise(
                                iscompleted: false,
                                timeForSet: Stime,
                                perSetreps: Nreps,
                                totalSets: Nsets,
                                RestTime: RTime,
                                nameOfExercise: name,
                              )));
                },
                child: Slidable(
                  key: const ValueKey(1),
                  endActionPane: ActionPane(
                    motion: const ScrollMotion(),
                    children: [
                      SlidableAction(
                        // An action can be bigger than the others.
                        onPressed: ((context) =>
                            Provider.of<Exercises>(context, listen: false)
                                .deleteExercise(index)),
                        backgroundColor: const Color.fromARGB(255, 242, 73, 1),
                        foregroundColor: Colors.white,
                        icon: Icons.archive,
                        label: 'Delete',
                      ),
                      SlidableAction(
                        onPressed: ((context) => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => EditExerciseScreen(
                                      index: index,
                                    ))))),
                        backgroundColor: const Color(0xFF0392CF),
                        foregroundColor: Colors.white,
                        icon: Icons.edit,
                        label: 'Edit',
                      ),
                    ],
                  ),
                  child: Container(
                    height: 100,
                    margin: const EdgeInsets.only(bottom: 17),
                    child: Card(
                      color: const Color(0XFF152646),
                      elevation: 5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: SizedBox(
                              width: screenWidth * 0.3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  name.length <= 15
                                      ? Text(name,
                                          style: const TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white))
                                      : Text(name,
                                          style: const TextStyle(
                                              fontSize: 11,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white)),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text("Set     " + Nsets.toString() + "x",
                                      style: const TextStyle(
                                          fontSize: 12,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold)),
                                  Text("Reps     " + Nreps.toString() + "x",
                                      style: const TextStyle(
                                          fontSize: 12,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold))
                                ],
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(right: 20),
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(width: 2, color: Colors.yellow),
                                borderRadius: BorderRadius.circular(20)),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(18),
                                child:
                                    //  Image.network(
                                    //    "blah blah",
                                    //    height: double.infinity,
                                    //    fit: BoxFit.fitHeight,
                                    //    errorBuilder: (BuildContext context, Object exception,
                                    //        StackTrace? stackTrace) {
                                    //      return

                                    Image.file(Eximg, fit: BoxFit.cover,
                                        errorBuilder: (BuildContext context,
                                            Object exception,
                                            StackTrace? stackTrace) {
                                  return Image.asset(
                                    'assets/images/exercise.png',
                                    fit: BoxFit.cover,
                                  );
                                })),
                          ),
                          //     Image.asset(
                          //   "assets/images/try.png",
                          //   height: double.infinity,
                          //   fit: BoxFit.fill,
                          //   width: double.infinity,
                          // ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
            itemCount: _MyExercises.length);
  }
}
