import 'package:flutter/material.dart';

class BMI extends StatefulWidget {
  const BMI({Key? key}) : super(key: key);

  @override
  State<BMI> createState() => _BMIState();
}

class _BMIState extends State<BMI> {
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();

  Container _buildInputs(
    BuildContext ctx,
    String heading,
    String unit,
    TextEditingController controller,
  ) {
    return Container(
      margin: const EdgeInsets.all(10),
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

  double _calculateBMI() {
    var height = double.tryParse(_heightController.text) == null
        ? 0
        : double.parse(_heightController.text);
    height = height / 100;
    final weight = double.tryParse(_weightController.text) == null
        ? 0
        : double.parse(_weightController.text);
    if (height <= 0 || weight <= 0) return 0.0;
    return (weight / (height * height));
  }

  Text _showResult(double bmi) {
    if (bmi <= 18.0) {
      return const Text(
        "Underweight",
        style: TextStyle(
          color: Colors.lightBlueAccent,
        ),
      );
    } else if (bmi >= 25.0) {
      return const Text(
        "Overweight",
        style: TextStyle(
          color: Colors.redAccent,
        ),
      );
    }
    return const Text(
      "Normal",
      style: TextStyle(
        color: Colors.green,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Form(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              _buildInputs(
                context,
                "Height",
                "cm",
                _heightController,
              ),
              _buildInputs(
                context,
                "Weight",
                "kg",
                _weightController,
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
                      alignment: Alignment.center,
                      backgroundColor: Theme.of(context).accentColor,
                      content: SingleChildScrollView(
                        child: Row(
                          children: <Widget>[
                            Container(
                              margin: const EdgeInsets.all(10),
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                _calculateBMI().toStringAsFixed(2),
                                style: const TextStyle(
                                  fontSize: 24,
                                ),
                              ),
                            ),
                            Column(
                              children: <Widget>[
                                const Text(
                                  "BMI",
                                  style: TextStyle(
                                    color: Color(0XFFFEF2E0),
                                    fontSize: 16,
                                  ),
                                ),
                                _showResult(
                                  _calculateBMI(),
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
      ),
    );
  }
}
