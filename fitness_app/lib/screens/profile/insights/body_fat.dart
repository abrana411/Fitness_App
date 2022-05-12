import 'dart:math';

import 'package:flutter/material.dart';

class BodyFat extends StatefulWidget {
  const BodyFat({Key? key}) : super(key: key);

  @override
  State<BodyFat> createState() => _BodyFatState();
}

class _BodyFatState extends State<BodyFat> {
  final _ageController = TextEditingController();
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();
  final _neckController = TextEditingController();
  final _waistController = TextEditingController();
  final _hipController = TextEditingController();

  int _gender = 0;

  Container _buildInputs(
    BuildContext ctx,
    String heading,
    String unit,
    TextEditingController controller,
  ) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Text("$heading:"),
          Expanded(
            child: Container(),
          ),
          SizedBox(
            height: 50,
            width: 220,
            child: TextFormField(
              keyboardType: TextInputType.number,
              controller: controller,
              // validator: (value) {
              //   if (value.isEmpty) {
              //     return "Can't be empty";
              //   }
              //   if (value.contains('-')) {
              //     return "Only +ve input allowed";
              //   }
              //   return null;
              // },
              decoration: InputDecoration(
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(unit),
                ),
                fillColor: Theme.of(ctx).accentColor,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  double _calculateBodyFat(int gender) {
    final age = int.tryParse(_ageController.text) == null
        ? 0
        : int.parse(_ageController.text);
    final weight = double.tryParse(_weightController.text) == null
        ? 0
        : double.parse(_weightController.text);
    final height = int.tryParse(_heightController.text) == null
        ? 0
        : int.parse(_heightController.text);
    final neck = int.tryParse(_neckController.text) == null
        ? 0
        : int.parse(_neckController.text);
    final waist = int.tryParse(_waistController.text) == null
        ? 0
        : int.parse(_waistController.text);
    if (age <= 0 || weight <= 0 || height <= 0 || neck <= 0 || waist <= 0) {
      return 0.0;
    }
    if (gender == 1) {
      final hip = int.tryParse(_hipController.text) == null
          ? 0
          : int.parse(_hipController.text);
      if (hip <= 0) return 0.0;
      return (495 /
              (1.29579 -
                  0.35004 * (log(waist + hip - neck) / log(10)) +
                  0.22100 * (log(height) / log(10))) -
          450);
    }
    return (495 /
            (1.0324 -
                0.19077 * (log(waist - neck) / log(10)) +
                0.15456 * (log(height) / log(10))) -
        450);
  }

  Text _showResult(double bf) {
    if (bf <= 2.0) {
      return const Text(
        "Extreme",
        style: TextStyle(
          color: Colors.red,
        ),
      );
    } else if (bf > 2.0 && bf <= 6.0) {
      return const Text(
        "Essential",
        style: TextStyle(
          color: Color(0xFFAFAF02),
        ),
      );
    } else if (bf > 6.0 && bf <= 14.0) {
      return const Text(
        "Athlete",
        style: TextStyle(
          color: Colors.lightGreen,
        ),
      );
    } else if (bf > 14.0 && bf <= 18.0) {
      return const Text(
        "Fitness",
        style: TextStyle(
          color: Colors.green,
        ),
      );
    } else if (bf > 18.0 && bf <= 25.0) {
      return const Text(
        "Average",
        style: TextStyle(
          color: Colors.yellow,
        ),
      );
    }
    return const Text(
      "Obese",
      style: TextStyle(
        color: Colors.red,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.all(5),
                  child: const Text(
                    "Gender:",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Row(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        _gender == 0
                            ? Icons.circle_rounded
                            : Icons.circle_outlined,
                      ),
                      onPressed: () {
                        setState(() {
                          _gender = 0;
                        });
                      },
                    ),
                    const Text("Male"),
                  ],
                ),
                Row(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        _gender == 1
                            ? Icons.circle_rounded
                            : Icons.circle_outlined,
                      ),
                      onPressed: () {
                        setState(() {
                          _gender = 1;
                        });
                      },
                    ),
                    const Text("Female"),
                  ],
                ),
              ],
            ),
            _buildInputs(
              context,
              "Age",
              "",
              _ageController,
            ),
            _buildInputs(
              context,
              "Weight",
              "kg",
              _weightController,
            ),
            _buildInputs(
              context,
              "Height",
              "cm",
              _heightController,
            ),
            _buildInputs(
              context,
              "Neck",
              "cm",
              _neckController,
            ),
            _buildInputs(
              context,
              "Waist",
              "cm",
              _waistController,
            ),
            if (_gender == 1)
              _buildInputs(
                context,
                "Hip",
                "cm",
                _hipController,
              ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              height: 50,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0XFFF95C04),
              ),
              child: TextButton(
                child: const Text(
                  "CALCULATE",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: () => showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    backgroundColor: Theme.of(context).accentColor,
                    content: SingleChildScrollView(
                      child: Row(
                        children: <Widget>[
                          Container(
                            margin: const EdgeInsets.all(10),
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              _calculateBodyFat(_gender).toStringAsFixed(2),
                              style: const TextStyle(
                                fontSize: 24,
                              ),
                            ),
                          ),
                          Column(
                            children: <Widget>[
                              const Text(
                                "%",
                                style: TextStyle(
                                  color: Color(0XFFFEF2E0),
                                  fontSize: 18,
                                ),
                              ),
                              _showResult(
                                _calculateBodyFat(_gender),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
