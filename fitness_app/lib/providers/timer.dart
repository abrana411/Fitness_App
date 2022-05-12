import 'dart:async';
import 'package:flutter/material.dart';

import '../screens/startExercise Screen/startexercise.dart';

class TimerModel with ChangeNotifier {
  int setMin = 0;
  //int restMin = 0;
  int setSec = 0;
  int restSec = 0;
  bool isrest = false;
  bool ispaused = false;
  // bool exit = false; //this will be true when we exit from a exercise

  int setNum = 0;
  // ignore: non_constant_identifier_names
  int Totalsets = 0;

  void changePause() {
    ispaused = !ispaused;
  }

  // ignore: non_constant_identifier_names
  void ResetEverything() {
    setMin = 0;
    setSec = 0;
    restSec = 0;
    isrest = false;
    // exit = true;
    ispaused = false;
    setNum = 0;
  }

  // ignore: non_constant_identifier_names
  void setSets(int Tsets) {
    if (Totalsets == 0) {
      Totalsets = Tsets;
    }
    setNum++;
  }

  // ignore: non_constant_identifier_names
  MyTimer(int SetTime, int restTime, int perSetReps, String nameOfExercise,
      BuildContext context) async {
    setMin = (SetTime / 60).floor();
    //restMin = (restTime / 60).floor();
    restSec = restTime;

    //if want to apply min concept to the rest time too
    // if (setMin != 0 && restMin != 0) {
    //   setSec = SetTime - setMin * 60;
    //   restSec = restTime - restMin * 60;
    // } else if (restMin == 0 && SetTime != 0) {
    //   setSec = SetTime - setMin * 60;
    //   restSec = restTime;
    // } else if (setMin == 0 && restMin != 0) {
    //   setSec = SetTime;
    //   restSec = restTime - restMin * 60;
    // } else {
    //   setSec = SetTime;
    //   restSec = restTime;
    // }
    if (setMin != 0) {
      setSec = SetTime - setMin * 60;
    } else {
      setSec = SetTime;
    }

    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (setNum == 0) {
        timer.cancel();
      }
      //this function will run ever second
      if (setSec > 0 && !ispaused) {
        setSec--;
      }
      if (setSec == 0) {
        if (setMin == 0) {
          if (setNum == Totalsets) {
            timer.cancel();
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => StartExercise(
                          nameOfExercise: nameOfExercise,
                          RestTime: restTime,
                          perSetreps: perSetReps,
                          timeForSet: SetTime,
                          totalSets: Totalsets,
                          iscompleted: true,
                        )));
          } else if (restSec != 0) {
            //this will be 0 only when i click on exit button
            //if exit is false only then
            isrest = true;
            if (!ispaused) {
              restSec--;
            }
            // Timer.periodic(const Duration(seconds: 1), (timer2) {
            //   rest--;
            // if (rest == 0) {
            //     isrest = false;
            //     // Navigator.push(context,
            //     //     MaterialPageRoute(builder: (context) =>StartExercise()));
            //   }
            //   notifyListeners(); //for inner timer change
            // });
            if (restSec == 0) {
              isrest = false;
              timer.cancel();
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => StartExercise(
                            nameOfExercise: nameOfExercise,
                            RestTime: restTime,
                            perSetreps: perSetReps,
                            timeForSet: SetTime,
                            totalSets: Totalsets,
                            iscompleted: false,
                          )));
            }
          }
        } else {
          setMin--;
          setSec = 59;
        }
      }
      notifyListeners();
    });
  }
}
