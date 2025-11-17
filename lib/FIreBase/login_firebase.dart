import 'package:aunproject1/FIreBase/home_screen.dart';
import 'package:aunproject1/FIreBase/signUp.dart';
import 'package:aunproject1/Utilities/round_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'functions/sign_in.dart';

class LoginFirebase extends StatefulWidget {
  const LoginFirebase({super.key});

  @override
  State<LoginFirebase> createState() => _LoginFirebaseState();
}

class _LoginFirebaseState extends State<LoginFirebase> {
  SignIn signIn=Get.put(SignIn());
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  final formKey = GlobalKey<FormState>();
  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    print("Build");
    return Scaffold(
      appBar: AppBar(title: Text("Login"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller: emailController ,
                decoration: InputDecoration(
                  hintText: "Email",
                  labelText: "Email",
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: passwordController ?? TextEditingController(),
                decoration: InputDecoration(
                  hintText: "Password",
                  labelText: "Password",
                ),
              ),
              SizedBox(height: 30),
              Obx(()=>RoundButton(title: "Sign In", ontap: (){
                if(formKey.currentState!.validate()){
                  signIn.signIn();
                }
              })),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account?"),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignupFirebase(),
                        ),
                      );
                    },
                    child: Text(
                      "SignUp",
                      style: TextStyle(color: Colors.deepPurple),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
