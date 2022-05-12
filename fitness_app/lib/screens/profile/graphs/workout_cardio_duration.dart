import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class DurationSeries {
  DateTime day;
  int duration;

  DurationSeries({required this.day, required this.duration});
}

class WorkoutCardioDuration extends StatelessWidget {
  const WorkoutCardioDuration({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime today = DateTime.now();
    var currentDay = today.weekday;
    List<charts.Series<DurationSeries, DateTime>> seriesList = [
      charts.Series(
        id: "Workout",
        data: [
          DurationSeries(
            day: today.subtract(Duration(days: currentDay)),
            duration: 50,
          ),
          if (currentDay - 1 >= 0)
            DurationSeries(
              day: today.subtract(Duration(days: currentDay - 1)),
              duration: 40,
            ),
          if (currentDay - 2 >= 0)
            DurationSeries(
              day: today.subtract(Duration(days: currentDay - 2)),
              duration: 20,
            ),
          if (currentDay - 3 >= 0)
            DurationSeries(
              day: today.subtract(Duration(days: currentDay - 3)),
              duration: 40,
            ),
          if (currentDay - 4 >= 0)
            DurationSeries(
              day: today.subtract(Duration(days: currentDay - 4)),
              duration: 56,
            ),
          if (currentDay - 5 >= 0)
            DurationSeries(
              day: today.subtract(Duration(days: currentDay - 5)),
              duration: 28,
            ),
          if (currentDay - 6 >= 0)
            DurationSeries(
              day: today.subtract(Duration(days: currentDay - 6)),
              duration: 10,
            ),
        ],
        domainFn: (DurationSeries series, _) => series.day,
        measureFn: (DurationSeries series, _) => series.duration,
        fillColorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
      ),
      charts.Series(
        id: "Cardio",
        data: [
          DurationSeries(
            day: today.subtract(Duration(days: currentDay)),
            duration: 20,
          ),
          if (currentDay - 1 >= 0)
            DurationSeries(
              day: today.subtract(Duration(days: currentDay - 1)),
              duration: 20,
            ),
          if (currentDay - 2 >= 0)
            DurationSeries(
              day: today.subtract(Duration(days: currentDay - 2)),
              duration: 20,
            ),
          if (currentDay - 3 >= 0)
            DurationSeries(
              day: today.subtract(Duration(days: currentDay - 3)),
              duration: 20,
            ),
          if (currentDay - 4 >= 0)
            DurationSeries(
              day: today.subtract(Duration(days: currentDay - 4)),
              duration: 20,
            ),
          if (currentDay - 5 >= 0)
            DurationSeries(
              day: today.subtract(Duration(days: currentDay - 5)),
              duration: 20,
            ),
          if (currentDay - 6 >= 0)
            DurationSeries(
              day: today.subtract(Duration(days: currentDay - 6)),
              duration: 20,
            ),
        ],
        domainFn: (DurationSeries series, _) => series.day,
        measureFn: (DurationSeries series, _) => series.duration,
        fillColorFn: (_, __) => charts.MaterialPalette.yellow.shadeDefault,
      ),
    ];

    return Container(
      padding: const EdgeInsets.all(10),
      height: 300,
      child: Column(
        children: <Widget>[
          Expanded(
            child: charts.TimeSeriesChart(
              seriesList,
              domainAxis: const charts.DateTimeAxisSpec(
                tickFormatterSpec: charts.AutoDateTimeTickFormatterSpec(
                  day: charts.TimeFormatterSpec(
                    format: 'EEE',
                    transitionFormat: 'EEE',
                  ),
                ),
              ),
              animate: true,
              animationDuration: const Duration(milliseconds: 500),
            ),
          ),
        ],
      ),
    );
  }
}
