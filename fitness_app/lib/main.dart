import 'package:fitness_app/providers/exercises.dart';
import 'package:fitness_app/providers/forrebuilding.dart';
import 'package:fitness_app/providers/profileProvider.dart';
import 'package:fitness_app/providers/workoutProvider.dart';
import 'package:fitness_app/screens/login/login_screen.dart';
import 'package:fitness_app/screens/signup/signup_screen.dart';
import 'package:flutter/material.dart';

// import './screens/workout screen/workout.dart';
// import './screens/exercise screen/exercises.dart';
//import './screens/stopWatch Screen/stpwtch.dart';
// import './screens/About us screen/about.dart';
//import './screens/Home screen/home.dart';
//import './screens/startExercise Screen/startexercise.dart';
import './screens/navigaton.dart';
import 'package:provider/provider.dart';
import './providers/timer.dart';

void main() {
  runApp(MultiProvider(
          providers: [
        ChangeNotifierProvider(
          create: (ctx) => TimerModel(),
        ),
        ChangeNotifierProvider(create: (ctx) => Exercises()),
        ChangeNotifierProvider(create: (ctx) => workoutprovider()),
        ChangeNotifierProvider(create: (ctx) => Rebuildd()),
        ChangeNotifierProvider(create: (ctx) => provideProfile()),
      ],
          child: MaterialApp(
              theme: ThemeData(
                backgroundColor: const Color(0XFF22314F),
                primaryColor: const Color(0XFF0C1B38),
                accentColor: const Color(0XFF364E7D),
                textTheme: const TextTheme(
                  bodyText1: TextStyle(color: Colors.white),
                  bodyText2: TextStyle(color: Colors.white),
                  button: TextStyle(color: Colors.white),
                  caption: TextStyle(color: Colors.white),
                  headline1: TextStyle(color: Colors.white),
                  headline2: TextStyle(color: Colors.white),
                  headline3: TextStyle(color: Colors.white),
                  headline4: TextStyle(color: Colors.white),
                  headline5: TextStyle(color: Colors.white),
                  headline6: TextStyle(color: Colors.white),
                  headlineLarge: TextStyle(color: Colors.white),
                  labelMedium: TextStyle(color: Colors.white),
                  overline: TextStyle(color: Colors.white),
                  subtitle1: TextStyle(color: Colors.white),
                  subtitle2: TextStyle(color: Colors.white),
                ),
                iconTheme: const IconThemeData(color: Colors.white),
              ),
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',

              // home: const workoutScreen()));
              //home: const ExercisesScreen()))
              //home: const stopWtchScreen()))
              // home: const navigationScreen())),
              home: const LogInScreen()))
      //home: const AboutScreen()));
      //home: const Homescr()))
      );
}
