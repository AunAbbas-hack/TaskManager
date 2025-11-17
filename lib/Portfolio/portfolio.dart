import 'package:aunproject1/Customs/constants.dart';
import 'package:aunproject1/Customs/customs.dart';
import 'package:aunproject1/FIreBase/functions/resume_link.dart';
import 'package:aunproject1/Utilities/timeLine.dart';
import 'package:aunproject1/Utilities/work_card.dart';
import 'package:flutter/material.dart';

import 'about.dart';

class Portfolio extends StatefulWidget {
  const Portfolio({super.key});

  @override
  State<Portfolio> createState() => _PortfolioState();
}

class _PortfolioState extends State<Portfolio> {
  final String description =
      "Lorem ipsum dolor sit amet, consectetur"
      " adipiscing elit. Amet vulputate tristique quam felis. Id phasellus dui orci "
      "vulputate consequat nulla proin. Id sit scelerisque neque, proin bibendum diam.";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Stack(
              children: [
                Positioned(
                    top: 100,
                    right: 20,
                    child: Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(image: AssetImage("assets/images/work1.png"),fit: BoxFit.fill)
                      ),
                    ),

                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Uihelper.customText(
                          text: "Aun Abbas",
                          size: 14,
                          color: Color(0xff03045E),
                          fontWeight: FontWeight.w600,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: Uihelper.customText(
                                text: "Home",
                                size: 8,
                                color: Color(0xff03045E),
                                fontWeight: FontWeight.w400,
                              ),
                            ),

                            TextButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>About()));
                              },
                              child: Uihelper.customText(
                                text: "About",
                                size: 8,
                                color: Color(0xff03045E),
                                fontWeight: FontWeight.w400,
                              ),
                            ),

                            TextButton(
                              onPressed: () {},
                              child: Uihelper.customText(
                                text: "Work",
                                size: 8,
                                color: Color(0xff03045E),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        IconButton(onPressed: () {
                          FaceBookLink();
                        }, icon: Icon(Icons.facebook)),
                      ],
                    ),

                    ///APP BAR
                    SizedBox(height: 40),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Uihelper.customText(
                        text: "Hello I'm Aun Abbas",
                        size: 14,
                        color: textColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    Align(
                      alignment: Alignment.topLeft,
                      child: Uihelper.customText(
                        text: "Flutter\n Developer",
                        size: 20,
                        color: textColor,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Uihelper.customText(
                        text: "based in Pakistan.",
                        size: 14,
                        color: textColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 30),

                    Align(
                      alignment: Alignment.topLeft,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: buttonColor,

                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0),
                          ),
                          side: BorderSide(color: Colors.black),
                        ),
                        onPressed: () {
                          ResumeLink();
                        },
                        child: Text("Resume"),
                      ),
                    ),
                    SizedBox(height: 40),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Uihelper.customText(
                        text: "about.",
                        size: 30,
                        color: headingColor,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    SizedBox(height: 20),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Uihelper.customText(
                        text: description,
                        size: 12,
                        color: textColor,
                        fontWeight: FontWeight.w500,
                        textAligh: TextAlign.justify,
                      ),
                    ),
                    SizedBox(height: 40),
                    Timeline(year: "2016-2018", description: description),
                    SizedBox(height: 20),
                    Timeline(year: "2016-2018", description: description),
                    SizedBox(height: 20),
                    Timeline(year: "2016-2018", description: description),
                    SizedBox(height: 50),

                    Align(
                      alignment: Alignment.topLeft,
                      child: Uihelper.customText(
                        text: "work.",
                        size: 30,
                        color: headingColor,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    SizedBox(height: 20),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Uihelper.customText(
                        text: description,
                        size: 12,
                        color: textColor,
                        fontWeight: FontWeight.w500,
                        textAligh: TextAlign.justify,
                      ),
                    ),
                    SizedBox(height: 40),
                    WorkCard(
                      image: "assets/images/work1.png",
                      date: "November 24, 2019",
                      title: "Some Case Study",
                      description: description,
                    ),
                    WorkCard(
                      image: "assets/images/work2.png",
                      date: "November 24, 2019",
                      title: "Some Case Study",
                      description: description,
                    ),
                    SizedBox(height: 50),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Uihelper.customText(
                        text: "Contact",
                        size: 30,
                        color: headingColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Uihelper.customText(
                        text: description,
                        size: 10,
                        color: textColor,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ]
            )
          ),
        ),
      ),
    );
  }
}
