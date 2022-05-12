import 'package:fitness_app/data/workout.dart';
import 'package:fitness_app/providers/exercises.dart';
import 'package:fitness_app/providers/forrebuilding.dart';
import 'package:fitness_app/providers/workoutProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './../../data/exerciseItem.dart';
import './edit_workout_screen.dart';

List<ExerciseItem> toAddExercises2 = [];

class ExerciseWorkoutEdit extends StatelessWidget {
  ExerciseWorkoutEdit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return toAddExercises2.isEmpty
        ? Container()
        : Container(
            height: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.blueGrey[800],
            ),
            child: ListView.builder(
                itemCount: toAddExercises2.length,
                itemBuilder: (context, index) {
                  ExerciseItem thisItem = toAddExercises2[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      color: Colors.blueGrey,
                      child: ListTile(
                        title: Text(
                          toAddExercises2[index].ExName,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        leading: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.file(toAddExercises2[index].ExImage,
                                fit: BoxFit.cover, errorBuilder:
                                    (BuildContext context, Object exception,
                                        StackTrace? stackTrace) {
                              return Image.asset(
                                'assets/images/exercise.png',
                                fit: BoxFit.cover,
                                width: 40,
                                height: 40,
                              );
                            }),
                          ),
                        ),
                        trailing: IconButton(
                          onPressed: () {
                            toAddExercises2
                                .removeAt(index); //removing from here
                            Provider.of<Exercises>(context, listen: false)
                                .addThisItem(thisItem);

                            // listOfAddedItems.add(
                            //     thisItem); //adding this item back to the main list showing all exercises

                            Provider.of<Rebuildd>(context, listen: false)
                                .notifyForRebuild(); //so that the deleted list item will be shown
                          },
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          );
  }
}
