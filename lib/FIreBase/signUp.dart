import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Utilities/round_button.dart';

class SignupFirebase extends StatefulWidget {
  const SignupFirebase({super.key});

  @override
  State<SignupFirebase> createState() => _SignupFirebaseState();
}

class _SignupFirebaseState extends State<SignupFirebase> {
  bool loading = false;
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  final formKey = GlobalKey<FormState>();
  FirebaseAuth _auth = FirebaseAuth.instance;
  void Login() {
    setState(() {
      loading = true;
    });
    _auth
        .createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text ,
        )
        .then((value) {
          setState(() {
            loading = false;
          });
          Navigator.pop(context);
    })
        .onError((error, stackTrace) {
          setState(() {
            loading = false;
          });
          print("Error ${error.toString()}");
        });
  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
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
                controller: emailController ,
                decoration: InputDecoration(
                  hintText: "Email",
                  labelText: "Email",
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: passwordController ,
                decoration: InputDecoration(
                  hintText: "Password",
                  labelText: "Password",
                ),
              ),
              SizedBox(height: 30),
              RoundButton(
                loading: false,
                title: "Sign In",
                ontap: () {
                  setState(() {
                    loading = false;
                  });
                  if (formKey.currentState!.validate()) {
                    {
                      Login();
                    }
                    ;
                  }
                },
              ),
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
