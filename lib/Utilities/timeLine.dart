import 'package:aunproject1/Customs/constants.dart';
import 'package:aunproject1/Customs/customs.dart';
import 'package:flutter/material.dart';

class Timeline extends StatelessWidget {
  final String year;
  final String description;

  const Timeline({super.key, required this.year, required this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18.0),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 90),
            height: 10,
            width: 10,
            decoration: BoxDecoration(color: textColor, shape: BoxShape.circle),
          ),

          const SizedBox(width: 10),
          Expanded(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Uihelper.customText(
                    text: year,
                    size: 10,
                    color: textColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 10),
                Uihelper.customText(
                  text: description,
                  size: 12,
                  color: textColor,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
