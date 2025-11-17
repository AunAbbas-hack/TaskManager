import 'package:aunproject1/Customs/constants.dart';
import 'package:aunproject1/Customs/customs.dart';
import 'package:aunproject1/To-DoList/todoList.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TodoItem extends StatefulWidget {
  final Todo todo;
  final Function(String) onDeleteItem;
  final Function(int,bool)onChanged;
  const TodoItem({super.key,
    required this.todo,
    required this.onDeleteItem,
    required this.onChanged});

  @override
  State<TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {

  bool checked = false;
  String? title;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: (){
          print("ToDo Item");
        },
        contentPadding: EdgeInsets.symmetric(horizontal: 10),
        tileColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        leading: IconButton(onPressed: (){
          setState(() {
            checked=!checked;
          });
        }, icon: checked?Icon(Icons.check_box):Icon(Icons.check_box_outline_blank)),
        title: Uihelper.customText(
          text: widget.todo.task??"Todo",
          size: 14,
          color: textColor,
          fontWeight: FontWeight.w600,
          textDecoration: checked==true?TextDecoration.lineThrough:TextDecoration.none,
        ),
        trailing: Container(
          height: 35,
          width: 35,
          margin: EdgeInsets.only(right: 10),
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Center(
            child: IconButton(onPressed: () {
              print("Delete");
              setState(() {
                print(widget.todo.id);
                widget.onDeleteItem(widget.todo.id.toString());

              });

            }, icon: Icon(Icons.delete,),
            color: Colors.white,
              iconSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
