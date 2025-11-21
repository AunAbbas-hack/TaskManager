import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';



class AddingNotes{
  final notesRef = FirebaseDatabase.instance.ref("Notes");
  final firstNameController=TextEditingController();
  final lastNameController=TextEditingController();
  final phoneNumberController=TextEditingController();
  final addressController=TextEditingController();


  final noteController = TextEditingController();
  void addingNote() {
    String id = DateTime.now().millisecondsSinceEpoch.toString();
    String noteText=noteController.text;
    if(noteText.isNotEmpty){
      notesRef.child(id).set({
        'note':noteText,
        'id':id,
        'subTitle':noteText
      });

    }
  }
}