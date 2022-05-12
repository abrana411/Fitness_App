import 'package:flutter/material.dart';
import 'dart:async';

// ignore: camel_case_types
class stopWtchScreen extends StatefulWidget {
  const stopWtchScreen({Key? key}) : super(key: key);

  @override
  _stopWtchScreenState createState() => _stopWtchScreenState();
}

// ignore: camel_case_types
class _stopWtchScreenState extends State<stopWtchScreen> {
  //defining variables needed for this
  int sec = 0, min = 0, hour = 0;
  String digitSec = "00", digitMin = "00", digitHour = "00";
  Timer? timer;
  bool isStarted = false;
  bool isStopped = false;
  List<String> laps = [];

  //various functions needed for the timer functionality

  //reset function
  void reset() {
    timer!.cancel();
    laps.clear();
    setState(() {
      //will restart the page build after setting the variables to default markings
      sec = 0;
      min = 0;
      hour = 0;
      digitHour = "00";
      digitMin = "00";
      digitSec = "00";

      isStarted = false;
      isStopped = false;
    });
  }

  //stop function
  void stopTimer() {
    // timer!.cancel();
    setState(() {
      isStopped = true;
    });
  }

  //resume Function
  void resumetime() {
    setState(() {
      isStopped = false;
    });
  }

  //add lap function
  void addLap() {
    String newLap =
        "$digitHour:$digitMin:$digitSec"; //will add this string to the laps list
    setState(() {
      laps.add(newLap);
    });
  }

  //start timer method(function)
  void startTimer() {
    isStarted = true;
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (isStopped) {
        return;
      }
      int secloc = sec + 1;
      int minloc = min;
      int hourloc = hour;

      if (secloc > 59) {
        if (minloc > 59) {
          hourloc++;
          minloc = 0;
          secloc = 0;
        } else {
          minloc++;
          secloc = 0;
        }
      }

      setState(() {
        sec = secloc;
        min = minloc;
        hour = hourloc;

        digitSec = secloc >= 10 ? "$secloc" : "0$secloc";
        digitMin = minloc >= 10 ? "$minloc" : "0$minloc";
        digitHour = hourloc >= 10 ? "$hourloc" : "0$hourloc";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0XFF22314F),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(digitHour,
                  style: const TextStyle(
                      color: Colors.yellow,
                      fontSize: 40,
                      fontWeight: FontWeight.bold)),
              const Text(".",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold)),
              Text(digitMin,
                  style: const TextStyle(
                      color: Colors.yellow,
                      fontSize: 40,
                      fontWeight: FontWeight.bold)),
              const Text(".",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold)),
              Text(digitSec,
                  style: const TextStyle(
                      color: Colors.white54,
                      fontSize: 40,
                      fontWeight: FontWeight.bold)),
            ],
          ),
          laps.isNotEmpty
              ? Column(
                  children: [
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            SizedBox(
                              width: 20,
                            ),
                            Text("Laps",
                                style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(
                              width: 10,
                            ),
                            Text("Lapped Time",
                                style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(
                              width: 20,
                            ),
                          ],
                        ),
                        Container(
                          width: screenWidth * 0.7,
                          margin: const EdgeInsets.only(top: 15, bottom: 20),
                          decoration: const BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      width: 2, color: Colors.white))),
                        )
                      ],
                    ),
                    Container(
                      height: 200,
                      color: Colors.transparent,
                      child: ListView.builder(
                          itemCount: laps.length,
                          itemBuilder: ((context, index) {
                            return Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text((index + 1).toString(),
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold)),
                                    Text(laps[index],
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                )
                              ],
                            );
                          })),
                    )
                  ],
                )
              : Container(),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                  style: TextButton.styleFrom(
                    splashFactory: NoSplash.splashFactory,
                  ),
                  onPressed: () {
                    isStarted
                        ? isStopped
                            ? resumetime()
                            : stopTimer()
                        : startTimer();
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    width: screenWidth * 0.4,
                    decoration: BoxDecoration(
                        color: Colors.black38,
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                        isStarted
                            ? isStopped
                                ? "Resume"
                                : "Stop"
                            : "Start",
                        style: TextStyle(
                            color: isStarted
                                ? isStopped
                                    ? Colors.lightGreen
                                    : Colors.redAccent
                                : Colors.greenAccent,
                            fontSize: 25,
                            fontWeight: FontWeight.bold)),
                  )),
              TextButton(
                  style: TextButton.styleFrom(
                    splashFactory: NoSplash.splashFactory,
                  ),
                  onPressed: () {
                    isStarted
                        ? isStopped
                            ? reset()
                            : addLap()
                        : null;
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    width: screenWidth * 0.4,
                    decoration: BoxDecoration(
                        color: Colors.black38,
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                        isStarted
                            ? isStopped
                                ? "Reset"
                                : "Lap"
                            : "Lap",
                        style: TextStyle(
                            color: !isStarted ? Colors.white60 : Colors.blue,
                            fontSize: 25,
                            fontWeight: FontWeight.bold)),
                  ))
            ],
          )
        ],
      )),
    );
  }
}
