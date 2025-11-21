import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'adding_notes.dart';

class EditAndAddNotes extends ChangeNotifier {
  final addingNotes = AddingNotes();
  final editingController = TextEditingController();

  Future<void> upDateNotes({
    required String id,
    required String notes}) async {
    await addingNotes.notesRef.child(id).update({'note': notes});

    notifyListeners();
  }

  void addNote({
    required String? notes,
    required String? firstName,
    required String? lastName,
    required String? phoneNumber,
    required String? address,
  }) {
    String id = DateTime.now().millisecondsSinceEpoch.toString();


      addingNotes.notesRef.child(id).set({
        'id': id,
        'firstName': firstName,
        'lastName': lastName,
        'phoneNumber': phoneNumber,
        'address': address,
        'note': notes,
      }).then((val){

      }).catchError((error){
      });
      notifyListeners();
    }

}
