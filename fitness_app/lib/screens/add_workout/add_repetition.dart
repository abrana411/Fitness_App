import 'package:flutter/material.dart';

// var _daysMap = {
//   'Sunday': false,
//   'Monday': false,
//   'Tuesday': false,
//   'Wednesday': false,
//   'Thursday': false,
//   'Friday': false,
//   'Saturday': false,
// };

var daysList = [0, 0, 0, 0, 0, 0, 0];

class AddRepetition extends StatefulWidget {
  const AddRepetition({Key? key}) : super(key: key);

  @override
  _AddRepetitionState createState() => _AddRepetitionState();
}

class _AddRepetitionState extends State<AddRepetition> {
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
        backgroundColor: daysList[weekDay] == 1
            ? Theme.of(ctx).accentColor
            : Colors.transparent,
      ),
      onPressed: () {
        setState(() {
          daysList[weekDay] == 1
              ? daysList[weekDay] = 0
              : daysList[weekDay] = 1;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        // _buildDaysButton(context, "S", "Sunday"),
        // _buildDaysButton(context, "M", "Monday"),
        // _buildDaysButton(context, "T", "Tuesday"),
        // _buildDaysButton(context, "W", "Wednesday"),
        // _buildDaysButton(context, "T", "Thursday"),
        // _buildDaysButton(context, "F", "Friday"),
        // _buildDaysButton(context, "S", "Saturday"),
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
