import 'dart:io';

import 'package:fitness_app/data/profiledata.dart';
import 'package:fitness_app/providers/profileProvider.dart';
import 'package:fitness_app/screens/add_profile/add_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeDrawer extends StatelessWidget {
  HomeDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<profileContent> usersDetails2 =
        Provider.of<provideProfile>(context).item;
    return Drawer(
      child: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Container(
                  alignment: Alignment.centerLeft,
                  height: 250,
                  width: double.infinity,
                  color: Colors.red,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, top: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40)),
                          child: usersDetails2.isEmpty
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
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            )))
                                  ],
                                )
                              : ClipRRect(
                                  borderRadius: BorderRadius.circular(40),
                                  child: Image.file(usersDetails2[0].profImage!,
                                      fit: BoxFit.cover, errorBuilder:
                                          (BuildContext context,
                                              Object exception,
                                              StackTrace? stackTrace) {
                                    return Image.asset(
                                      'assets/images/exercise.png',
                                      fit: BoxFit.cover,
                                    );
                                  }),
                                ),
                        ),

                        usersDetails2.isEmpty
                            ? Container()
                            : Text(usersDetails2[0].userName,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold)),
                        const SizedBox(
                          height: 4,
                        ),
                        // const Text("AB@!23",
                        //     style: TextStyle(
                        //       color: Colors.white,
                        //       fontSize: 11,
                        //     ))
                      ],
                    ),
                  )),
              Expanded(
                child: Container(
                  color: const Color(0XFF131D31),
                  child: Column(
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, index) {
                          return Container(
                            margin: const EdgeInsets.all(10),
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(40)),
                            width: double.infinity,
                            child: IntrinsicHeight(
                              child: Row(
                                children: const [
                                  Icon(Icons.calendar_today_rounded),
                                  Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: VerticalDivider(
                                      width: 2,
                                      color: Colors.black,
                                      thickness: 1,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 20),
                                    child: Text("Reports",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 13,
                                        )),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                        itemCount: 7,
                      ),
                      const SizedBox(
                        width: double.infinity,
                        child: Divider(
                          color: Colors.white,
                          height: 2,
                        ),
                      ),
                      GestureDetector(
                        onTap: null,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15, top: 15),
                          child: Row(
                            children: const [
                              Icon(
                                Icons.logout,
                                color: Colors.white,
                                size: 25,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text("Log Out",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold))
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: null,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15, top: 15),
                          child: Row(
                            children: const [
                              Icon(
                                Icons.info,
                                color: Colors.white,
                                size: 25,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text("FAQ's",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold))
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
