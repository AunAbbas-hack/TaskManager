import 'package:flutter/material.dart';

class MoreButton extends StatefulWidget {

     const MoreButton({super.key,});

  @override
  State<MoreButton> createState() => _MoreButtonState();
}

class _MoreButtonState extends State<MoreButton> {

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: Icon(Icons.more_vert),
      itemBuilder: (context) => [
        PopupMenuItem(
          onTap: (){
            showMyDialog();
          },
          child: ListTile(title: Text("Edit"), leading: Icon(Icons.edit)),
          value: "Edit",
        ),
        PopupMenuItem(
          onTap: (){
            Navigator.pop(context);
          },
          child: ListTile(title: Text("Delete"), leading: Icon(Icons.delete)),
          value: "Delete",
        ),
      ],
    );
  }
  Future<void> showMyDialog()async{
    return showDialog(context:  context, builder: (BuildContext context){
      return AlertDialog(
        title: Text("Add Post"),
        content: TextFormField(
          maxLines: 4,
          decoration: InputDecoration(
              hintText: "What is in your mind?",
              // labelText: "Post",
              border:OutlineInputBorder()
          ),
        ),
        actions: [
          TextButton(onPressed: (){
            Navigator.pop(context);
          }, child: Text("Cancel")),
          TextButton(onPressed: (){
            Navigator.pop(context);
          }, child: Text("Edit")),
        ],
      );
    });
  }

}
