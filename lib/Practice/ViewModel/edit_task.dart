import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'adding_notes.dart';

class EditAndAddNotes extends ChangeNotifier {
  final addingNotes = AddingNotes();
  final editingController = TextEditingController();
  final addNotesController = TextEditingController();
  Future<void> upDateNotes({required String id, required String notes}) async {
    await addingNotes.notesRef.child(id).update({
      'note': notes,
    });

    notifyListeners();
  }

  void addNotes({required String notes}) {
    String id = DateTime.now().millisecondsSinceEpoch.toString();
    addingNotes.notesRef.child(id).set({'note': notes, 'id': id});
    notifyListeners();
  }
}
