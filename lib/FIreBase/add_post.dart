import 'package:aunproject1/Utilities/round_button.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class AddPost extends StatefulWidget {
  const AddPost({super.key});

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  TextEditingController postController=TextEditingController();
  final postRef=FirebaseDatabase.instance.ref("Post");   //database reference//Post is the table name
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Post"),centerTitle: true,),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28.0),
        child: SafeArea(
          child: Column(
            children: [
              TextFormField(
                maxLines: 4,
                controller: postController,
                decoration: InputDecoration(
                  hintText: "What is in your mind?",
                  // labelText: "Post",
                  border:OutlineInputBorder()
                ),
              ),
              SizedBox(height: 30,),
              RoundButton(title: "Add", ontap: ()

              {
                String id = DateTime.now().millisecondsSinceEpoch.toString();
                postRef.child(id).set({
                  'title':postController.text.toString(),
                  'id':id

                });
                // Navigator.pop(context);
               })
            ],
          ),
        ),
      ),
    );
  }
}
