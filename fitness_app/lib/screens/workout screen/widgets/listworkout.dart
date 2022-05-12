import 'package:fitness_app/screens/edit_workout/edit_workout_screen.dart';
import 'package:fitness_app/screens/exercise%20screen/exercises.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

import '../../../data/workout.dart';
import '../../../providers/workoutProvider.dart';

// ignore: camel_case_types, must_be_immutable
class workoutsList extends StatelessWidget {
  workoutsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Workout> workouts = Provider.of<workoutprovider>(context).items;

    //below method will return the list of days as children of a row
    Widget getdaysListItem(int index) {
      List<Widget> wlist = [];

      if (workouts.isNotEmpty) {
        for (int i = 0; i < days.length; i++) {
          wlist.add(workouts[index].iswhichDay[i] == 0
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

    return workouts.isEmpty
        ? const Center(
            child: Text(
              "No Workouts yet..try adding some",
            ),
          )
        : ListView.builder(
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => ExercisesScreen(
                                myexerList: workouts[index].AllExer,
                                toShowAll: false,
                              ))));
                },
                child: Slidable(
                  key: const ValueKey(1),
                  endActionPane: ActionPane(
                    motion: const ScrollMotion(),
                    children: [
                      SlidableAction(
                        // An action can be bigger than the others.
                        onPressed: ((context) =>
                            Provider.of<workoutprovider>(context, listen: false)
                                .deleteWorkout(index)),
                        backgroundColor: const Color.fromARGB(255, 242, 73, 1),
                        foregroundColor: Colors.white,
                        icon: Icons.archive,
                        label: 'Delete',
                      ),
                      SlidableAction(
                        onPressed: (context) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => EditWorkoutScreen(
                                        index: index,
                                      ))));
                        },
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
                      child: ListTile(
                        leading: SizedBox(
                          width: 80,
                          child: Column(
                            children: [
                              workouts[index].Name.length <= 8
                                  ? Text(workouts[index].Name,
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white))
                                  : Text(workouts[index].Name,
                                      style: const TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white)),
                              const SizedBox(
                                height: 15,
                              ),
                              getdaysListItem(index)
                            ],
                          ),
                        ),
                        title: Container(
                          margin: const EdgeInsets.only(top: 10),
                          child: Column(
                            children: [
                              const Icon(
                                Icons.blur_circular_sharp,
                                color: Colors.white,
                              ),
                              const Text(
                                "Total Exercises",
                                style: TextStyle(
                                    fontSize: 12, color: Colors.white),
                              ),
                              Text(workouts[index].NumberOfExercises.toString(),
                                  style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold))
                            ],
                          ),
                        ),
                        trailing: Column(
                          children: [
                            const Icon(
                              Icons.timer,
                              color: Colors.white,
                            ),
                            const Text("Duration",
                                style: TextStyle(
                                    fontSize: 12, color: Colors.white)),
                            const SizedBox(
                              height: 2,
                            ),
                            Text(workouts[index].durationInMin.toString(),
                                style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold))
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
            itemCount: workouts.length);
  }
}
