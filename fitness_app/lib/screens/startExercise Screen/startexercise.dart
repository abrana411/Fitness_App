import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/timer.dart';

// ignore: camel_case_types, must_be_immutable
class StartExercise extends StatefulWidget {
  int timeForSet;
  int totalSets;
  // ignore: non_constant_identifier_names
  int RestTime;
  bool iscompleted;
  int perSetreps;
  String nameOfExercise;
  StartExercise(
      {Key? key,
      required this.iscompleted,
      required this.totalSets,
      required this.perSetreps,
      required this.timeForSet,
      // ignore: non_constant_identifier_names
      required this.RestTime,
      required this.nameOfExercise})
      : super(key: key);

  @override
  State<StartExercise> createState() => _StartExerciseState();
}

class _StartExerciseState extends State<StartExercise> {
  @override
  void initState() {
    if (!widget.iscompleted) {
      Provider.of<TimerModel>(context, listen: false).setSets(widget.totalSets);
      Provider.of<TimerModel>(context, listen: false).MyTimer(widget.timeForSet,
          widget.RestTime, widget.perSetreps, widget.nameOfExercise, context);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int currentSetNum = Provider.of<TimerModel>(context, listen: false).setNum;
    // double statusbarheight = MediaQuery.of(context).padding.top;
    // print(statusbarheight);
    double screensize = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
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
          child: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    SizedBox(
                      height: 350,
                      width: screensize,
                      child: Image.asset(
                        "assets/images/try.png",
                        color: Colors.white.withOpacity(0.7),
                        colorBlendMode: BlendMode
                            .modulate, //this will change the color blend mode and will not super impose the white over the image rather the opacity will be super imposed on the image like this
                        height: double.infinity,
                        fit: BoxFit.fill,
                        width: double.infinity,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                Provider.of<TimerModel>(context, listen: false)
                                    .ResetEverything(); //Resetting everything
                                Navigator.pop(context);
                              },
                              icon: const Icon(
                                Icons.arrow_back_ios,
                                size: 30,
                                color: Colors.black,
                              )),
                        ],
                      ),
                    ),
                    Positioned(
                        bottom: 30,
                        left: 30,
                        child: Container(
                          padding: const EdgeInsets.all(7),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.5),
                            border: Border.all(color: Colors.grey, width: 2),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Text(widget.nameOfExercise,
                              style: TextStyle(
                                  color: Colors.white.withOpacity(0.8),
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold)),
                        )),
                  ],
                ),
                widget.iscompleted
                    ? Container(
                        margin: const EdgeInsets.only(top: 170),
                        child: Column(
                          children: const [
                            Text("COMPLETED",
                                style: TextStyle(
                                    color: Colors.pink,
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold)),
                            Text("Procede to next exercise",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                )),
                          ],
                        ),
                      )
                    : Container(
                        margin: const EdgeInsets.only(top: 50),
                        width: screenwidth,
                        height: MediaQuery.of(context).size.height * 0.25,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Consumer<TimerModel>(
                                builder: (context, myModel, child) {
                              return !myModel.isrest
                                  ? Column(
                                      children: [
                                        Text(
                                            "$currentSetNum / ${widget.totalSets} set",
                                            style: const TextStyle(
                                                color: Colors.yellowAccent,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold)),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(myModel.setMin.toString(),
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 40,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            const Text(" : ",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 40,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            Text(myModel.setSec.toString(),
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 40,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ],
                                        ),
                                      ],
                                    )
                                  : Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                            "$currentSetNum / ${widget.totalSets} set",
                                            style: const TextStyle(
                                                color: Colors.yellowAccent,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold)),
                                        const SizedBox(
                                          height: 30,
                                        ),
                                        const Text("next set will start in ",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold)),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child:
                                              Text(myModel.restSec.toString(),
                                                  style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20,
                                                  )),
                                        )
                                      ],
                                    );
                            }),
                            const SizedBox(
                              width: 200,
                              child: Divider(
                                color: Colors.white,
                                height: 2,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(widget.perSetreps.toString(),
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                      )),
                                  const Text(" X ",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                      )),
                                  const Text("Reps",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                      )),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                Container(
                  height: 100,
                ),
                !widget.iscompleted
                    ? Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: const Color.fromARGB(255, 80, 80, 76)),
                        child: IconButton(
                          onPressed: (() {
                            // if (Provider.of<TimerModel>(context, listen: false)
                            //     .isrest) {
                            //   null;
                            // } else {
                            Provider.of<TimerModel>(context, listen: false)
                                .changePause();
                            setState(() {});
                            //}
                          }),
                          icon: Provider.of<TimerModel>(context, listen: false)
                                  .ispaused
                              ? const Icon(
                                  Icons.play_arrow,
                                  color: Colors.white,
                                )
                              : const Icon(
                                  Icons.pause,
                                  color: Colors.white,
                                ),
                          iconSize: 40,
                        ),
                      )
                    : Container(
                        width: 100,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color(0XFF152646)),
                        child: const Text("Next",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            )),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
