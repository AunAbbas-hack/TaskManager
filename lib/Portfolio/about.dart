import 'package:flutter/material.dart';
import '../Customs/constants.dart';
import '../Customs/customs.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Uihelper.customText(
                  text: "About",
                  size: 30,
                  color: headingColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text("Information", style: headingStyle),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Phone",style: textStyle,)
                  ,Text("+923239295312",style: textStyle,)
                ],
              ),
              Divider(),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Email",style: textStyle,)
                  ,Text("aaun9794@gmail.com",style: textStyle,)
                ],
              ),
              Divider(),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Address",style: textStyle,)
                  ,Text("Pandori Tehsil Muridke\nDistrict Sheikhupura",style: textStyle,textAlign: TextAlign.end,)
                ],
              ),
              Divider(),
              SizedBox(height: 20,)
            ],
          ),
        ),
      ),
    );
  }
}
