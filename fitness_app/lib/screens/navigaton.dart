import 'package:fitness_app/providers/exercises.dart';
import 'package:fitness_app/screens/exercise%20screen/exercises.dart';
import 'package:fitness_app/screens/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:provider/provider.dart';
import './Home screen/home.dart';
import './workout screen/workout.dart';

import 'calendar/calendar_screen.dart';

// ignore: camel_case_types
class navigationScreen extends StatefulWidget {
  const navigationScreen({Key? key}) : super(key: key);

  @override
  State<navigationScreen> createState() => _navigationScreenState();
}

// ignore: camel_case_types
class _navigationScreenState extends State<navigationScreen> {
  int currentIndex = 2; //current index is of the home page ie 2
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomBar(),
      body: ShowScreen(),
    );
  }

  // ignore: non_constant_identifier_names
  Widget BottomBar() {
    return BottomNavyBar(
        iconSize: 30,
        containerHeight: 70,
        backgroundColor: const Color(0XFF241818),
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
              icon: const Icon(Icons.timer),
              title: const Text(
                "StopWatch",
                style: TextStyle(fontWeight: FontWeight.bold),
              ), //what will be shown when this is selected
              activeColor: Colors
                  .white, //the active color when this particular item is selected
              inactiveColor:
                  Colors.white54, //inactive color ie when this is not selected
              textAlign: TextAlign.center),
          BottomNavyBarItem(
              icon: const Icon(Icons.calendar_month),
              title: const Text("Report",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              activeColor: Colors.white,
              inactiveColor: Colors.white54,
              textAlign: TextAlign.center),
          BottomNavyBarItem(
              icon: const Icon(Icons.home),
              title: const Text("Home",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              activeColor: Colors.white,
              inactiveColor: Colors.white54,
              textAlign: TextAlign.center),
          BottomNavyBarItem(
              icon: const Icon(Icons.directions_run_outlined),
              title: const Text("Workouts",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              activeColor: Colors.white,
              inactiveColor: Colors.white54,
              textAlign: TextAlign.center),
          BottomNavyBarItem(
              icon: const Icon(Icons.person),
              title: const Text("Profile",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              activeColor: Colors.white,
              inactiveColor: Colors.white54,
              textAlign: TextAlign.center),
        ],
        selectedIndex:
            currentIndex, //this is the current page which is active ...index is an integer which defines it...and the first item in the items parameter will have index as 0 and so on the index will be assigned to different pages
        onItemSelected: (index) {
          //changing the index to the one in which we have tapped
          setState(() {
            currentIndex = index;
          });
        });
  }

  // ignore: non_constant_identifier_names
  Widget ShowScreen() {
    //based on the current index ...displaying that particular screen
    switch (currentIndex) {
      case 0:
        //return const stopWtchScreen();
        return ExercisesScreen(
          myexerList: [],
          toShowAll: true,
        ); //all the exercises
      case 1:
        return const CalendarScreen();
      case 2:
        return const Homescr();
      case 3:
        return const workoutScreen();
      // return const ExercisesScreen();
      case 4:
        return const ProfileScreen();
      default:
        return const Homescr();
    }
  }
}
