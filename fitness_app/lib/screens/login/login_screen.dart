import 'package:fitness_app/screens/About%20us%20screen/about.dart';
import 'package:fitness_app/screens/navigaton.dart';
import 'package:fitness_app/screens/signup/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'password_login.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: ListView(
          children: <Widget>[
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(0),
                ),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    "Skip for now",
                  ),
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const navigationScreen()));
                },
              ),
            ),
            const SizedBox(
              height: 150,
            ),
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: <Widget>[
                Container(
                  width: deviceSize.width * 0.9,
                  height: 340,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Form(
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.all(10),
                          child: Container(
                            margin: const EdgeInsets.only(top: 45, bottom: 10),
                            padding: const EdgeInsets.symmetric(
                              vertical: 8,
                              horizontal: 5,
                            ),
                            child: TextFormField(
                              decoration: InputDecoration(
                                prefixIcon: const Icon(
                                  Icons.account_circle,
                                  color: Colors.white,
                                ),
                                hintText: "Username",
                                hintStyle: const TextStyle(
                                  color: Color.fromRGBO(255, 255, 255, 0.5),
                                ),
                                fillColor: Theme.of(context).accentColor,
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
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                            top: 10,
                            right: 10,
                            left: 10,
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 5,
                          ),
                          child: const PasswordLogIn(),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 10,
                          ),
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              padding: const EdgeInsets.all(0),
                            ),
                            child: const Text(
                              "Forgot Password?",
                              style: TextStyle(
                                color: Color(0XFFF5FA10),
                              ),
                            ),
                            onPressed: () {
                              // Navigator.pushReplacement(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) =>  //forgot pass screen));
                              null;
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: -20,
                  child: Container(
                    height: 40,
                    width: 110,
                    padding: const EdgeInsets.all(10),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: const Color(0XFFF95C04),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: GestureDetector(
                      onTap: () => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const navigationScreen())),
                      child: const SizedBox(
                        child: Text(
                          "LOG IN",
                          style: TextStyle(
                            color: Color(0XFFFEF2E0),
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Container(
              margin: const EdgeInsets.only(
                top: 25,
                bottom: 8,
              ),
              padding: const EdgeInsets.all(10),
              alignment: Alignment.center,
              child: const Text(
                "OR",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            Align(
              child: Container(
                height: 40,
                width: 150,
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: const Color(0XFFFEF2E0),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const <Widget>[
                    Text(
                      "Log In with",
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                    FaIcon(
                      FontAwesomeIcons.google,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            ),
            Align(
              child: Container(
                width: 350,
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: <Widget>[
                    const Text(
                      "New to Fitness App?",
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.all(0),
                      ),
                      child: const Text(
                        "Create Account",
                        style: TextStyle(
                          color: Color(0XFFF5FA10),
                          fontSize: 15,
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUpScreen()));
                      },
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
