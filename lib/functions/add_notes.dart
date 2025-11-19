import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddNotes extends GetxController{
  final noteController= TextEditingController().obs;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    noteController.value.dispose();

  }
}