import 'package:aunproject1/Customs/constants.dart';
import 'package:aunproject1/Customs/customs.dart';
import 'package:flutter/material.dart';

import '../Utilities/round_button.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
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
          SizedBox(height: 30),
          RoundButton(title: "Sign Up", ontap: (){})
        ],
      ),
    );
  }
}
