import 'package:flutter/material.dart';

import 'random_data.dart';

class Activity extends StatefulWidget {
  final DateTime selectedDay;

  const Activity(this.selectedDay);

  @override
  _ActivityState createState() => _ActivityState();
}

class _ActivityState extends State<Activity> {
  @override
  void initState() {
    // TODO: implement initState
    randomData;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;
    final _chosenMapData = randomData[widget.selectedDay];
    return Container(
      decoration: BoxDecoration(
          color: const Color(0XFF0C1B38),
          borderRadius: BorderRadius.circular(20)),
      padding: const EdgeInsets.all(20),
      margin: EdgeInsets.only(
        top: 10,
        left: screenwidth * 0.1,
        right: screenwidth * 0.1,
      ),
      width: screenwidth * 0.9,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 10),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: const Color(0XFFC4C4C4),
                    ),
                    child: const Icon(
                      Icons.fireplace_sharp,
                      color: Colors.red,
                    ),
                  ),
                  Text(
                    _chosenMapData[0] ?? 50,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 10),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: const Color(0XFFC4C4C4),
                    ),
                    child: const Icon(
                      Icons.timer,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    _chosenMapData[1] ?? 10,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 10),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: const Color(0XFFC4C4C4),
                      ),
                      child: const Icon(
                        Icons.do_not_step_outlined,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      _chosenMapData[2] ?? 50,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 17),
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 10),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: const Color(0XFFC4C4C4),
                        ),
                        child: const Icon(
                          Icons.map,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        _chosenMapData[3] ?? 50,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
