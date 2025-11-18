import 'package:aunproject1/Utilities/round_button.dart';
import 'package:flutter/material.dart';

import '../Customs/constants.dart';
import '../Customs/customs.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Uihelper.noteText(text: "Sign up. ", styleText: headingStyle),
          SizedBox(height: 50),
          Uihelper.customTextField(
            controller: emailController,
            hintText: "Email",
          ),
          SizedBox(height: 20),
          Uihelper.customTextField(
            controller: passwordController,
            hintText: "Password",
          ),
          SizedBox(height: 20),
          Uihelper.customTextField(
            controller: confirmPasswordController,
            hintText: "Confirm Password",
          ),
          SizedBox(height: 30),
          RoundButton(title: "Sign Up", ontap: (){})
        ],
      ),
    );
  }
}
