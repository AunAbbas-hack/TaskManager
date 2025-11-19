import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUp1 extends GetxController {
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.value.dispose();
    passwordController.value.dispose();
  }

  void signUp() {
    FirebaseAuth _auth = FirebaseAuth.instance;
    _auth
        .createUserWithEmailAndPassword(
          email: emailController.value.text,
          password: passwordController.value.text,
        )
        .then((value) => Get.snackbar("Success", "SignUp Successfully"))
        .onError(
          (error, StackTrace) => Get.snackbar("Error", "Something went wrong"),
        );
  }
}
