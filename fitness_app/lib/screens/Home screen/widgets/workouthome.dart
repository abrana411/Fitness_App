import 'package:fitness_app/data/workout.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../providers/workoutProvider.dart';

// ignore: camel_case_types
class workoutChartHome extends StatefulWidget {
  const workoutChartHome({Key? key}) : super(key: key);

  @override
  _workoutChartHomeState createState() => _workoutChartHomeState();
}

// ignore: camel_case_types
class _workoutChartHomeState extends State<workoutChartHome> {
  int index = 0;
  //to get the days done as a row
  Widget getdaysListItem() {
    List<Widget> wlist = [];
    List<Workout> allwork =
        Provider.of<workoutprovider>(context, listen: false).items;
    if (allwork.isNotEmpty) {
      for (int i = 0; i < days.length; i++) {
        wlist.add(allwork[index].iswhichDay[i] == 0
            ? //if this day is not for this workout
            Text(
                days[i],
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
              )
            : Text(
                days[i],
                style: const TextStyle(
                    color: Colors.orange,
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
              ));
      }
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: wlist,
    );
  }

  @override
  Widget build(BuildContext context) {
    List myWorkouts =
        Provider.of<workoutprovider>(context, listen: false).items;
    double screenwidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(left: screenwidth * 0.1),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("My Workouts",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
              Container(
                margin: EdgeInsets.only(right: screenwidth * 0.1),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          if (myWorkouts.isEmpty) {
                            null;
                          } else {
                            //assigning next value to index
                            if (index == 0) {
                              null;
                            } else {
                              index--;
                              setState(() {});
                            }
                          }
                        },
                        icon: const Icon(
                          Icons.arrow_back_outlined,
                          color: Colors.white,
                        )),
                    IconButton(
                        onPressed: () {
                          if (myWorkouts.isEmpty) {
                            null;
                          } else {
                            //assigning next value to index
                            if (index == myWorkouts.length - 1) {
                              null;
                            } else {
                              index++;
                              setState(() {});
                            }
                          }
                        },
                        icon: const Icon(
                          Icons.arrow_forward_outlined,
                          color: Colors.white,
                        ))
                  ],
                ),
              )
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(
              left: screenwidth * 0.1, right: screenwidth * 0.1),
          width: screenwidth * 0.9,
          height: 190,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color(0XFF0C1B38)),
          child: myWorkouts.isEmpty
              ? const Center(
                  child: Text(
                    "No Workouts Yet",
                    style: TextStyle(fontSize: 20),
                  ),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(myWorkouts[index].Name,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold)),
                          getdaysListItem()
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 8, right: 8, bottom: 8),
                      child: Divider(
                        height: 2,
                        color: Colors.white,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8, top: 20),
                      child: Row(
                        children: [
                          const Text("Total Exercises",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold)),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(myWorkouts[index].NumberOfExercises.toString(),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold))
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(12),
                          margin: EdgeInsets.only(right: screenwidth * 0.1),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color.fromARGB(255, 231, 163, 16)),
                          child: const Text("START",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Row(
                        children: [
                          const Text("Duration(in mins)",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold)),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(myWorkouts[index].durationInMin.toString(),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold))
                        ],
                      ),
                    ),
                  ],
                ),
        )
      ],
    );
  }
}
