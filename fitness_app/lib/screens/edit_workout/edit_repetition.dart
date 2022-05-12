import 'package:flutter/material.dart';

var daysList2 = [0, 0, 0, 0, 0, 0, 0];

class EditRepetition extends StatefulWidget {
  const EditRepetition({Key? key}) : super(key: key);

  @override
  _EditRepetitionState createState() => _EditRepetitionState();
}

class _EditRepetitionState extends State<EditRepetition> {
  // Function to build each day
  TextButton _buildDaysButton(BuildContext ctx, String day, int weekDay) {
    return TextButton(
      child: Text(
        day,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
      style: TextButton.styleFrom(
        padding: const EdgeInsets.all(10),
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: const CircleBorder(),
        backgroundColor: daysList2[weekDay] == 1
            ? Theme.of(ctx).accentColor
            : Colors.transparent,
      ),
      onPressed: () {
        setState(() {
          daysList2[weekDay] == 1
              ? daysList2[weekDay] = 0
              : daysList2[weekDay] = 1;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _buildDaysButton(context, "S", 0),
        _buildDaysButton(context, "M", 1),
        _buildDaysButton(context, "T", 2),
        _buildDaysButton(context, "W", 3),
        _buildDaysButton(context, "T", 4),
        _buildDaysButton(context, "F", 5),
        _buildDaysButton(context, "S", 6),
      ],
    );
  }
}
