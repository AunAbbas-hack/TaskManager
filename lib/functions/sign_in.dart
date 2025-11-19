
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SignIn extends GetxController{
  final emailController= TextEditingController().obs;
  final passwordController= TextEditingController().obs;

  void signIn(){
    FirebaseAuth _auth=FirebaseAuth.instance;
    _auth
        .signInWithEmailAndPassword(
      email: emailController.value.text,
      password: passwordController.value.text ,
    )
        .then((value) {
      Get.snackbar("Success", "Login Successfully");



    })
        .onError((error, stackTrace) {
      Get.snackbar("Error", "Something went wrong");

    });
  }
  }