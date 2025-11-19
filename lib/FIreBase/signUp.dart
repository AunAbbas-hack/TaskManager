
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Utilities/round_button.dart';
import '../functions/sign_up.dart';


class SignupFirebase extends StatefulWidget {
  const SignupFirebase({super.key});

  @override
  State<SignupFirebase> createState() => _SignupFirebaseState();
}

class _SignupFirebaseState extends State<SignupFirebase> {
  SignUp1 signup=Get.put(SignUp1());
  bool loading = false;
  final formKey = GlobalKey<FormState>();
  void SignUp() {
    if (formKey.currentState!.validate()) {
      {
        signup.signUp();
      };
    }

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("SignUp"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: signup.emailController.value ,
                decoration: InputDecoration(
                  hintText: "Email",
                  labelText: "Email",
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: signup.passwordController.value ,
                decoration: InputDecoration(
                  hintText: "Password",
                  labelText: "Password",
                ),
              ),
              SizedBox(height: 30),
              Obx(()=>RoundButton(
                loading: false,
                title: "Sign In",
                ontap: () {
                  setState(() {
                    loading = false;
                  });
                  SignUp();
                },
              ),),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account?"),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Login",
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
