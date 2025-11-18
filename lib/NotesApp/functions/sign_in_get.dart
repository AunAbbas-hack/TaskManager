import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInGet extends GetxController{
  final emailController=TextEditingController().obs;
  final passwordController=TextEditingController().obs;
  SignInGet(){
    FirebaseAuth _auth=FirebaseAuth.instance;
    _auth.signInWithEmailAndPassword(email: emailController.value.text, password: passwordController.value.text);

  }
}