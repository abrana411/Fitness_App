import 'package:fitness_app/data/exerciseItem.dart';
import 'package:fitness_app/screens/add_exercise/add_exercise_screen.dart';
import 'package:fitness_app/screens/navigaton.dart';
import 'package:flutter/material.dart';

import '../exercise screen/widges/listexercises.dart';
import '../add_exercise/add_exercise_image.dart';

// ignore: camel_case_types
class ExercisesScreen extends StatelessWidget {
  List<ExerciseItem> myexerList;
  bool toShowAll;
  ExercisesScreen({Key? key, required this.myexerList, required this.toShowAll})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // double statusbarheight = MediaQuery.of(context).padding.top;
    // print(statusbarheight);
    double screensize = MediaQuery.of(context).size.height;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            storedImage = null;
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const AddExerciseScreen()));
          },
          child: Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
                color: const Color(0XFFF95C04),
                borderRadius: BorderRadius.circular(50)),
            child: Container(
              decoration: BoxDecoration(
                  color: const Color(0XFF364E7D),
                  borderRadius: BorderRadius.circular(50)),
              child: const IconButton(
                  onPressed: null,
                  icon: Icon(
                    Icons.add,
                    color: Color(0XFFF95C04),
                    size: 28,
                  )),
            ),
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      //.centerFloat, //using scaffold property to set location of this button
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(
          backgroundColor: const Color(0XFF22314F),
        ),
      ),
      body: SafeArea(
        child: Container(
          height: screensize,
          color: const Color(0XFF22314F),
          child: Column(
            children: [
              // SizedBox(
              //   height: 30,
              //   child: Row(
              //     children: [
              //       IconButton(
              //           onPressed: () {
              //             Navigator.push(
              //                 context,
              //                 MaterialPageRoute(
              //                     builder: (context) =>
              //                         const navigationScreen()));
              //           },
              //           icon: const Icon(
              //             Icons.arrow_back_ios,
              //             color: Colors.white,
              //             size: 30,
              //           )),
              //     ],
              //   ),
              // ),
              SizedBox(
                height: 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "Exercises",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(top: 20),
                  padding: const EdgeInsets.only(
                      top: 40, bottom: 20, left: 20, right: 20),
                  decoration: const BoxDecoration(
                      color: Color(0XFF0C1B38),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  child: ExercisesList(
                    MyExercises: myexerList,
                    allExer: toShowAll,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
