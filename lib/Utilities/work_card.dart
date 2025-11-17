import 'package:aunproject1/Customs/constants.dart';
import 'package:aunproject1/Customs/customs.dart';
import 'package:flutter/material.dart';

class WorkCard extends StatelessWidget {
  final String image;
  final String date, title, description;
  const WorkCard({
    super.key,
    required this.image,
    required this.date,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [


          Uihelper.customText(
            text: title,
            size: 12,
            color: textColor,
            fontWeight: FontWeight.bold,
          ),
          SizedBox(height: 5),
          Uihelper.customText(
            text: description,
            size: 8,
            color: textColor,
            fontWeight: FontWeight.normal,
          ),
          SizedBox(height: 10),
          Center(
            child: Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Center(
            child: Uihelper.customText(
              text: date,
              size: 8,
              color: textColor,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
