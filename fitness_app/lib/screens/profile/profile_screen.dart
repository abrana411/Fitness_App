import 'package:fitness_app/data/profiledata.dart';
import 'package:fitness_app/providers/profileProvider.dart';
import 'package:fitness_app/screens/add_profile/add_profile_screen.dart';
import 'package:fitness_app/screens/edit_profile/edit_profile_image_input.dart';
import 'package:fitness_app/screens/edit_profile/edit_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'my_stats.dart';
import 'graphs/my_analytics.dart';
import 'insights/insights.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

// Function to create Basic Details Row (Age, Weight, Height)
  Container _buildBasicDetail(double value, String heading) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
      child: Column(
        children: <Widget>[
          Text(
            value.toString(),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 5),
            child: Text(
              heading,
              style: const TextStyle(
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<profileContent> userDetails =
        Provider.of<provideProfile>(context).item;
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: Provider.of<provideProfile>(context).item.isEmpty
          ? null
          : AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              title: Row(
                children: <Widget>[
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Icon(
                      Icons.filter_list_outlined,
                      size: 30,
                    ),
                  ),
                  const Spacer(),
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {
                        storedImage3 = userDetails[0]
                            .profImage!; //setting to the current one
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const EditProfileScreen()));
                      },
                      child: const Icon(
                        Icons.edit,
                        size: 30,
                      ),
                    ),
                  ),
                ],
              ),
            ),
      body: SafeArea(
        child: Provider.of<provideProfile>(context).item.isEmpty
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Add your profile now",
                        style: TextStyle(fontSize: 24),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextButton(
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AddProfileScreen())),
                      child: Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.orange[700]),
                        child: const Text(
                          "ADD PROFILE",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ))
                ],
              )
            : Column(
                children: <Widget>[
                  Container(
                    width: 130,
                    height: 130,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(154, 143, 143, 100),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: Container(
                          width: 150,
                          height: 150,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.amber,
                          ),
                          child: Image.file(userDetails[0].profImage!,
                              fit: BoxFit.cover, errorBuilder:
                                  (BuildContext context, Object exception,
                                      StackTrace? stackTrace) {
                            return Image.asset(
                              'assets/images/exercise.png',
                              fit: BoxFit.cover,
                            );
                          })),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(20),
                    child: Text(userDetails[0].userName),
                  ),
                  Expanded(
                    child: Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.center,
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.only(top: 30),
                          width: deviceSize.width,
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                            ),
                          ),
                          child: ListView(
                            children: <Widget>[
                              Align(
                                child: Container(
                                  margin: const EdgeInsets.only(top: 70),
                                  padding: const EdgeInsets.all(8),
                                  width: deviceSize.width * 0.95,
                                  child: const MyStats(),
                                ),
                              ),
                              Align(
                                child: Container(
                                  margin: const EdgeInsets.all(10),
                                  padding: const EdgeInsets.all(8),
                                  width: deviceSize.width * 0.95,
                                  child: const MyAnalytics(),
                                ),
                              ),
                              Align(
                                child: Container(
                                  margin: const EdgeInsets.all(10),
                                  padding: const EdgeInsets.all(8),
                                  width: deviceSize.width * 0.95,
                                  child: const Insights(),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          top: -15,
                          child: Container(
                            margin: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: const Color(0XFF162A48),
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: IntrinsicHeight(
                              child: Row(
                                children: <Widget>[
                                  _buildBasicDetail(
                                      userDetails[0].userAge.toDouble(), "AGE"),
                                  const VerticalDivider(
                                    color: Colors.white,
                                    thickness: 1,
                                    indent: 15,
                                    endIndent: 15,
                                  ),
                                  _buildBasicDetail(
                                      userDetails[0].userWeight, "WEIGHT"),
                                  const VerticalDivider(
                                    color: Colors.white,
                                    thickness: 1,
                                    indent: 15,
                                    endIndent: 15,
                                  ),
                                  _buildBasicDetail(
                                      userDetails[0].userHeight.toDouble(),
                                      "HEIGHT"),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
