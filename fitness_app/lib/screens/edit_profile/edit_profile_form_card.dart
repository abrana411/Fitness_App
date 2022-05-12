import 'package:fitness_app/providers/profileProvider.dart';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:provider/provider.dart';
import './edit_profile_image_input.dart';

class EditProfileFormCard extends StatefulWidget {
  // const EditProfileFormCard({Key? key}) : super(key: key);

  String name;
  int age;
  bool gender;
  int height;
  double weight;

  EditProfileFormCard(
      this.name, this.age, this.gender, this.height, this.weight);

  @override
  State<EditProfileFormCard> createState() => _EditProfileFormCardState();
}

Container _buildHeightWeight(BuildContext context, String heading,
    TextEditingController thisController) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
    child: TextFormField(
      controller: thisController,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        hintText: heading,
        hintStyle: const TextStyle(
          color: Color.fromRGBO(255, 255, 255, 0.5),
        ),
        fillColor: Theme.of(context).accentColor,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
  );
}

class _EditProfileFormCardState extends State<EditProfileFormCard> {
  late int _currentValue;
  late bool _maleSelected;
  TextEditingController _username = TextEditingController();
  TextEditingController _heightcontroller = TextEditingController();
  TextEditingController _weightController = TextEditingController();

  @override
  void initState() {
    _username = TextEditingController(text: widget.name);
    _heightcontroller = TextEditingController(text: widget.height.toString());
    _weightController = TextEditingController(text: widget.weight.toString());
    _currentValue = widget.age;
    _maleSelected = widget.gender;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Container(
      height: 480,
      width: deviceSize.width * 0.9,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(
                top: 15,
                right: 5,
                bottom: 5,
                left: 5,
              ),
              child: TextFormField(
                controller: _username,
                //initialValue: widget.name,
                decoration: InputDecoration(
                  hintText: "Name",
                  hintStyle: const TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 0.5),
                  ),
                  fillColor: Theme.of(context).accentColor,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                vertical: 15,
                horizontal: 8,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Text(
                    "Age",
                    style: TextStyle(fontSize: 16),
                  ),
                  NumberPicker(
                    axis: Axis.horizontal,
                    minValue: 1,
                    maxValue: 100,
                    value: _currentValue,
                    itemWidth: 60,
                    selectedTextStyle: const TextStyle(
                      color: Colors.deepOrangeAccent,
                      fontSize: 20,
                    ),
                    onChanged: (value) {
                      setState(() {
                        _currentValue = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                vertical: 15,
                horizontal: 8,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Text(
                    "Gender",
                    style: TextStyle(fontSize: 16),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      TextButton(
                        child: Row(
                          children: <Widget>[
                            Icon(
                              _maleSelected
                                  ? Icons.circle_rounded
                                  : Icons.circle_outlined,
                            ),
                            Container(
                              margin: const EdgeInsets.all(5),
                              padding: const EdgeInsets.all(10),
                              child: const Text(
                                "Male",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        onPressed: () {
                          setState(() {
                            _maleSelected = true;
                          });
                        },
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.all(5),
                          backgroundColor: _maleSelected
                              ? const Color(0XFF172A4F)
                              : const Color(0XFF616382),
                        ),
                      ),
                      const SizedBox(width: 20),
                      TextButton(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Icon(
                              _maleSelected
                                  ? Icons.circle_outlined
                                  : Icons.circle_rounded,
                            ),
                            Container(
                              margin: const EdgeInsets.all(5),
                              padding: const EdgeInsets.all(10),
                              child: const Text(
                                "Female",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        onPressed: () {
                          setState(() {
                            _maleSelected = false;
                          });
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: _maleSelected
                              ? const Color(0XFF616382)
                              : const Color(0XFF172A4F),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            _buildHeightWeight(context, "Height (in cm)", _heightcontroller),
            _buildHeightWeight(context, "Weight (in kg)", _weightController),
            Container(
              height: 40,
              width: 100,
              decoration: BoxDecoration(
                color: const Color(0XFFF95C04),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextButton(
                child: const Text(
                  "UPDATE",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  if (_username.text.isEmpty ||
                      _heightcontroller.text.isEmpty ||
                      _weightController.text.isEmpty) {
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text(
                      "Please fill all the fields ...",
                      style: TextStyle(color: Colors.red),
                    )));
                  } else {
                    Provider.of<provideProfile>(context, listen: false)
                        .updateUser(
                            storedImage3!,
                            _username.text,
                            int.parse(_heightcontroller.text),
                            double.parse(_weightController.text),
                            _maleSelected,
                            _currentValue);

                    Navigator.pop(context);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
