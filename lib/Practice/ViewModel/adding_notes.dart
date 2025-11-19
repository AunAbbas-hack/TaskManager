import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import "package:get/get.dart";

import '../../functions/add_notes.dart';


class AddingNotes{
  final notesRef = FirebaseDatabase.instance.ref("Notes");

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