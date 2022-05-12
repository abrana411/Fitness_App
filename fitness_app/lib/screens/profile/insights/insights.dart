import 'package:flutter/material.dart';

import 'bmi.dart';
import 'body_fat.dart';

class Insights extends StatelessWidget {
  const Insights({Key? key}) : super(key: key);

  Container _buildContainer(
    BuildContext ctx,
    String heading,
    int idx,
  ) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0XFF172A4F),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(heading),
          TextButton(
            child: const Text(
              "Calculate",
              style: TextStyle(
                color: Color(0XFFFEF2E0),
              ),
            ),
            style: TextButton.styleFrom(
              backgroundColor: const Color(0XFFF95C04),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed: () => showModalBottomSheet(
              backgroundColor: Theme.of(ctx).primaryColor,
              isScrollControlled: true,
              context: ctx,
              builder: (_) => Padding(
                padding: MediaQuery.of(ctx).viewInsets,
                child: idx == 0 ? const BMI() : const BodyFat(),
              ),
            ),
          ),
        ],
      ),
    );
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
          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.only(top: 8, left: 8),
            padding: const EdgeInsets.all(8),
            child: const Text(
              "Insights",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          _buildContainer(context, "BMI", 0),
          _buildContainer(context, "Body Fat %", 1),
        ],
      ),
    );
  }
}
