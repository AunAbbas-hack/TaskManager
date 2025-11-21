import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class FireStoreController extends ChangeNotifier{
final fireStoreRef=FirebaseFirestore.instance.collection("Student");
///add Student
void addStudent(
    {
      required String title,
      required String className,
    }
    ){
  final String id =DateTime.now().millisecondsSinceEpoch.toString();
  fireStoreRef.doc(id).set(
    {
      'id':id,
      "title":title,
      "class":className
    }
  );
}
///update Student
void updateStudent({
  required String id,
  required String title,
}){
  fireStoreRef.doc(id).update(
    {
      'title':title,
    }
  );
}
///From where the Data can be readable for UI
Stream<QuerySnapshot> get readStudentStream{
  return fireStoreRef.snapshots();
}
///delete Student
void deleteStudent(String id){
  fireStoreRef.doc(id).delete();
}

}