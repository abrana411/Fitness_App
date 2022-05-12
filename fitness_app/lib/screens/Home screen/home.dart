import 'package:fitness_app/data/profiledata.dart';
import 'package:fitness_app/providers/profileProvider.dart';
import 'package:fitness_app/screens/add_profile/add_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Home screen/widgets/workouthome.dart';
import './widgets/drawerhome.dart';

final GlobalKey<ScaffoldState> _key = GlobalKey(); //creating a global key

class Homescr extends StatelessWidget {
  const Homescr({Key? key}) : super(key: key);

  // ignore: non_constant_identifier_names
  SizedBox getHorizontalLine(double Width) {
    return SizedBox(
        width: Width,
        child: const Divider(height: 4, thickness: 1, color: Colors.white));
  }

  // ignore: non_constant_identifier_names
  Stack getHoriProgressBar(double Width) {
    return Stack(
      children: [
        Container(
          color: Colors.grey,
          width: 100,
          height: 3,
        ),
        Positioned(
            child: Container(
          color: Colors.red,
          width: Width,
          height: 3,
        ))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    List<profileContent> usersDetails =
        Provider.of<provideProfile>(context).item;
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      key:
          _key, //assigning global key as key property of this scaffold so that we can know of this scaffold from that key
      drawer: HomeDrawer(),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(
          backgroundColor: const Color(0XFF22314F),
        ),
      ),
      body: SafeArea(
          child: Container(
        height: screenheight,
        color: const Color(0XFF22314F),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  //container for the drawer's button wrapped inside gesure detector

                  GestureDetector(
                    onTap: (() {
                      _key.currentState!.openDrawer();
                    }),
                    child: Container(
                      color: Colors.transparent,
                      height: 50,
                      margin: const EdgeInsets.only(top: 30, left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          getHorizontalLine(60),
                          getHorizontalLine(40),
                          getHorizontalLine(30)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              //container for welcoming user and also the profile image of user
              SizedBox(
                width: screenwidth * 0.9,
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: screenwidth * 0.07),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Welcome Back",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold)),
                          usersDetails.isEmpty
                              ? Container()
                              : Text(usersDetails[0].userName,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 8, top: 8, bottom: 8),
                      child: Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40)),
                        child: usersDetails.isEmpty
                            ? Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(40),
                                    child: Image.asset(
                                      'assets/images/profile_image.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Positioned(
                                      bottom: -10,
                                      child: TextButton(
                                          onPressed: () => Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const AddProfileScreen())),
                                          child: Container(
                                            padding: const EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                                color: Colors.orange[700]),
                                            child: const Text(
                                              "ADD PROFILE",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 7,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          )))
                                ],
                              )
                            : ClipRRect(
                                borderRadius: BorderRadius.circular(40),
                                child: Image.file(usersDetails[0].profImage!,
                                    fit: BoxFit.cover, errorBuilder:
                                        (BuildContext context, Object exception,
                                            StackTrace? stackTrace) {
                                  return Image.asset(
                                    'assets/images/exercise.png',
                                    fit: BoxFit.cover,
                                  );
                                }),
                              ),
                      ),
                    ),
                  ],
                ),
              ),

              //containers for today's goal and date
              Container(
                margin: EdgeInsets.only(left: screenwidth * 0.1, top: 20),
                width: screenwidth * 0.9,
                child: Row(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color(0XFF0C1B38),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          Text("Monday",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold)),
                          Text("13",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                              ))
                        ],
                      ),
                    ),
                    const Spacer(),
                    Container(
                      margin: EdgeInsets.only(right: screenwidth * 0.1),
                      width: 150,
                      height: 120,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color(0XFF0C1B38),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text("Daily Goals",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold)),
                          getHorizontalLine(double.infinity),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const [
                              Text("Steps",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 11,
                                  )),
                            ],
                          ),
                          Row(
                            children: [
                              getHoriProgressBar(60),
                              const Spacer(),
                              const Text("60 %",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 11,
                                  ))
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const [
                              Text("Heart Points",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 11,
                                  )),
                            ],
                          ),
                          Row(
                            children: [
                              getHoriProgressBar(80),
                              const Spacer(),
                              const Text("80 %",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 11,
                                  ))
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),

              //container's for today's activity
              Container(
                margin: EdgeInsets.only(left: screenwidth * 0.1, top: 20),
                width: screenwidth * 0.9,
                child: Row(
                  children: [
                    const Text("Today's Activity",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.bold)),
                    const Spacer(),
                    Padding(
                      padding: EdgeInsets.only(right: screenwidth * 0.12),
                      child: const Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: const Color(0XFF0C1B38),
                    borderRadius: BorderRadius.circular(20)),
                padding: const EdgeInsets.all(20),
                margin: EdgeInsets.only(
                    top: 10, left: screenwidth * 0.1, right: screenwidth * 0.1),
                width: screenwidth * 0.9,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(right: 10),
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: const Color(0XFFC4C4C4)),
                              child: const Icon(
                                Icons.fireplace_sharp,
                                color: Colors.red,
                              ),
                            ),
                            const Text("600 cal",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold))
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(right: 10),
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: const Color(0XFFC4C4C4)),
                              child: const Icon(
                                Icons.timer,
                                color: Colors.black,
                              ),
                            ),
                            const Text("2 hours",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold))
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(right: 10),
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: const Color(0XFFC4C4C4)),
                                child: const Icon(
                                  Icons.do_not_step_outlined,
                                  color: Colors.black,
                                ),
                              ),
                              const Text("1000 steps",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold))
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 17),
                            child: Row(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(right: 10),
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: const Color(0XFFC4C4C4)),
                                  child: const Icon(
                                    Icons.map,
                                    color: Colors.black,
                                  ),
                                ),
                                const Text("2 km",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold))
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),

              const Padding(
                padding: EdgeInsets.only(top: 10),
                child: workoutChartHome(),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
