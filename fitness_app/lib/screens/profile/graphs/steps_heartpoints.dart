import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class DataSeries {
  String day;
  int count;

  DataSeries({required this.day, required this.count});
}

class StepHeartPoint extends StatefulWidget {
  const StepHeartPoint({Key? key}) : super(key: key);

  @override
  State<StepHeartPoint> createState() => _StepHeartPointState();
}

class _StepHeartPointState extends State<StepHeartPoint> {
  bool _stepSelected = true; // If true then show steps else show heart points

  TextButton _createButton(
    String title,
    bool condition,
    Color primary,
    Color secondary,
  ) {
    return TextButton(
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
      style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          const EdgeInsets.all(10),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(
          _stepSelected ? primary : secondary,
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: const BorderSide(color: Colors.white, width: 0.5),
          ),
        ),
      ),
      onPressed: () {
        setState(() {
          _stepSelected = condition;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    List<charts.Series<DataSeries, String>> series = [
      charts.Series(
        id: "Data",
        data: [
          DataSeries(day: "Sun", count: _stepSelected ? 500 : 30),
          DataSeries(day: "Mon", count: _stepSelected ? 4832 : 69),
          DataSeries(day: "Tue", count: _stepSelected ? 10832 : 80),
          DataSeries(day: "Wed", count: _stepSelected ? 432 : 10),
          DataSeries(day: "Thu", count: _stepSelected ? 8080 : 30),
          DataSeries(day: "Fri", count: _stepSelected ? 50 : 50),
          DataSeries(day: "Sat", count: _stepSelected ? 8000 : 26),
        ],
        domainFn: (DataSeries series, _) => series.day,
        measureFn: (DataSeries series, _) => series.count,
        labelAccessorFn: (DataSeries series, _) => "${series.count}",
        fillColorFn: (_, __) => _stepSelected
            ? charts.MaterialPalette.blue.shadeDefault
            : charts.MaterialPalette.teal.shadeDefault,
        // domainFormatterFn: (StepSeries series, _) => ,
      )
    ];

    return Container(
      padding: const EdgeInsets.all(20),
      height: 300,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              _createButton("Steps", true, Theme.of(context).primaryColor,
                  Colors.transparent),
              _createButton("Heart Points", false, Colors.transparent,
                  Theme.of(context).primaryColor),
            ],
          ),
          Expanded(
            child: charts.BarChart(
              series,
              animate: true,
              animationDuration: const Duration(milliseconds: 500),
            ),
          ),
        ],
      ),
    );
  }
}
