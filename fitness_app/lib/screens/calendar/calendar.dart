import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      color: Theme.of(context).primaryColor,
      child: TableCalendar(
        firstDay: DateTime.utc(2021, 1),
        lastDay: DateTime.now(),
        focusedDay: _focusedDay,
        weekendDays: const [DateTime.sunday],
        selectedDayPredicate: (DateTime date) {
          return isSameDay(_selectedDay, date);
        },
        onDaySelected: (selectedDay, focusedDay) {
          if (!isSameDay(_selectedDay, selectedDay)) {
            setState(() {
              _selectedDay = selectedDay;
              _focusedDay = focusedDay;
            });
          }
        },
        onPageChanged: (focusedDay) {
          _focusedDay = focusedDay;
        },

        // Decoration Part
        calendarStyle: const CalendarStyle(
          cellPadding: EdgeInsets.all(10),
          weekendTextStyle: TextStyle(
            color: Colors.blueGrey,
          ),
          disabledTextStyle: TextStyle(
            color: Colors.grey,
          ),
          todayTextStyle: TextStyle(fontSize: 14),
          todayDecoration: BoxDecoration(
            color: Colors.deepPurple,
            shape: BoxShape.circle,
          ),
          selectedTextStyle: TextStyle(fontSize: 14),
          selectedDecoration: BoxDecoration(
            color: Color(0XFFF95C04),
            shape: BoxShape.circle,
          ),
        ),
        headerStyle: const HeaderStyle(
          titleCentered: true,
          formatButtonVisible: false,
        ),
        daysOfWeekStyle: const DaysOfWeekStyle(
          weekdayStyle: TextStyle(
            color: Colors.cyan,
            fontSize: 13,
          ),
          weekendStyle: TextStyle(
            color: Colors.cyan,
            fontSize: 13,
          ),
        ),
      ),
    );
  }
}
