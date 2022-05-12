import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyStats extends StatelessWidget {
  const MyStats({Key? key}) : super(key: key);

  Column _buildMyStatsDetail(
    IconData icon,
    String heading1,
    String heading2,
    int value,
  ) {
    return Column(
      children: <Widget>[
        FaIcon(icon),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text(
            heading1,
            style: const TextStyle(
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(
            heading2,
            style: const TextStyle(
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
        Text(
          value.toString(),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Card(
      elevation: 1.2,
      color: const Color(0XFF152646),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.only(top: 8, left: 8),
            padding: const EdgeInsets.all(8),
            child: const Text(
              "My Stats",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(8),
            child: const FaIcon(
              FontAwesomeIcons.crown,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const <Widget>[
                Text(
                  "CURRENT STREAK",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "21",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: deviceSize.width * 0.8,
            margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                _buildMyStatsDetail(
                  FontAwesomeIcons.trophy,
                  "LONGEST",
                  "STREAK",
                  69,
                ),
                _buildMyStatsDetail(
                  FontAwesomeIcons.seedling,
                  "TOTAL",
                  "SESSIONS",
                  7,
                ),
                _buildMyStatsDetail(
                  FontAwesomeIcons.wind,
                  "TOTAL",
                  "EXERCISES",
                  84,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
