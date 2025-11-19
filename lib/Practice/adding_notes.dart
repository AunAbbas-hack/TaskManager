import 'package:firebase_database/firebase_database.dart';
import "package:get/get.dart";

import '../functions/add_notes.dart';

class AddingNotes{
  final notesRef = FirebaseDatabase.instance.ref("Notes");
  AddNotes addNotes = Get.put(AddNotes());
  void addingNote() {
    String id = DateTime.now().millisecondsSinceEpoch.toString();
    String noteText=addNotes.noteController.value.text;
    if(noteText.isNotEmpty){
      notesRef.child(id).set({
        'note':noteText,
        'id':id,
        'subTitle':noteText
      });
      addNotes.noteController.value.clear();
    }
  }
}