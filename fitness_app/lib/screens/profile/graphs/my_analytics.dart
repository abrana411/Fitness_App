import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'workout_cardio_duration.dart';
import 'steps_heartpoints.dart';

class MyAnalytics extends StatefulWidget {
  const MyAnalytics({Key? key}) : super(key: key);

  @override
  State<MyAnalytics> createState() => _MyAnalyticsState();
}

class _MyAnalyticsState extends State<MyAnalytics> {
  bool _toggleChart = true; // If true show duration else steps & heart points
  int _selectedIndex = 0;
  final PageController _controller = PageController(
    initialPage: 0,
    keepPage: true,
  );

  void _changePage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onButtonTap(int index) {
    setState(() {
      _selectedIndex = index;
      _controller.animateToPage(
        index,
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1.2,
      color: const Color(0XFF152646),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(top: 8, left: 8),
                padding: const EdgeInsets.all(8),
                child: const Text(
                  "My Analytics",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Spacer(),
              Row(
                children: <Widget>[
                  IconButton(
                    icon: const FaIcon(FontAwesomeIcons.chevronCircleLeft),
                    color: _toggleChart ? Colors.blueGrey : Colors.white,
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    onPressed: () {
                      _toggleChart ? null : _onButtonTap(0);
                    },
                  ),
                  IconButton(
                    icon: const FaIcon(FontAwesomeIcons.chevronCircleRight),
                    color: _toggleChart ? Colors.white : Colors.blueGrey,
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    onPressed: () {
                      _toggleChart ? _onButtonTap(1) : null;
                    },
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 300,
            width: double.infinity,
            child: PageView(
              controller: _controller,
              children: const <Widget>[
                WorkoutCardioDuration(),
                StepHeartPoint(),
              ],
              onPageChanged: (index) {
                _changePage(index);
                setState(() {
                  _toggleChart = !_toggleChart;
                });
              },
            ),
          )
        ],
      ),
    );
  }
}
