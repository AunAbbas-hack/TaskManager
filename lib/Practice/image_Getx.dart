import 'package:aunproject1/Practice/imageController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImagePick extends StatefulWidget {
  const ImagePick({super.key});

  @override
  State<ImagePick> createState() => _ImagePickState();
}

class _ImagePickState extends State<ImagePick> {
  @override
  Widget build(BuildContext context) {

    final ImageController imageController=Get.put(ImageController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Image Picker"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
       Obx((){
         return CircleAvatar(
           radius: 80,
           backgroundImage: imageController.image.value!=null?FileImage(imageController.image.value!):null,
         );
       })  ,
          SizedBox(
            height: 50,
          ),
          ElevatedButton(onPressed: (){
            imageController.pickImage(ImageSource.gallery);
          }, child: Text("Image"))
        ],
      ),
    );
  }
}
