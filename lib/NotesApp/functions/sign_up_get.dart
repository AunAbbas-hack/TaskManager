import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpGet extends GetxController{
  final emailController=TextEditingController().obs;
  final passwordController=TextEditingController().obs;
  SignUpGet(){
    FirebaseAuth _auth=FirebaseAuth.instance;
    _auth.createUserWithEmailAndPassword(email: emailController.value.text, password: passwordController.value.text);

  }
}