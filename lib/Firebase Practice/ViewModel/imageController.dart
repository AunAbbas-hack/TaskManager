import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImageController extends GetxController{

Rx<File?> image=Rx<File?>(null);
final picker=ImagePicker();
Future<void> pickImage(ImageSource source)async{
  try{
    final XFile? imagePath=await picker.pickImage(source: source);
    if(imagePath!=null){
      image.value=File(imagePath.path);
      Get.snackbar("Success", "Successfully added file",backgroundColor: Colors.green);
    }
    else
      Get.snackbar("Try Again", "No file selected",backgroundColor: Colors.red);
  }catch(e){
    Get.snackbar("Error", "Something went wrong");
  }
}
}