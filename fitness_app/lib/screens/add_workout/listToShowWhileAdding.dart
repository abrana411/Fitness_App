import 'package:fitness_app/providers/exercises.dart';
import 'package:fitness_app/providers/forrebuilding.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './../../data/exerciseItem.dart';
import './add_workout_screen.dart';

List<ExerciseItem> toAddExercises = [];

class ExerciseWorkoutAdd extends StatelessWidget {
  // List<ExerciseItem> listOfAddedItems;
  ExerciseWorkoutAdd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return toAddExercises.isEmpty
        ? Container()
        : Container(
            height: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.blueGrey[800],
            ),
            child: ListView.builder(
                itemCount: toAddExercises.length,
                itemBuilder: (context, index) {
                  ExerciseItem thisItem = toAddExercises[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      color: Colors.blueGrey,
                      child: ListTile(
                        title: Text(
                          toAddExercises[index].ExName,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        leading: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.file(toAddExercises[index].ExImage,
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
                            toAddExercises.removeAt(index); //removing from here
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
