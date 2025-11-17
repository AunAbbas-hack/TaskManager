import 'package:flutter/material.dart';

void main() {
  final todo=Todo(
    id: 1,
    task: "Task 1",
    isDone: true,
  );
  todo.id=2;
  todo.task="Task 2";
  todo.isDone=true;
  todo.Print();
}
class Todo{
  int? id;
  String? task;
  bool? isDone;
  Todo(
      {
        required this.id,
        required this.task,
        this.isDone,
      }
      );
 static List<Todo> todoList(){
    return [
      Todo(id: 1, task: "Task"),
      Todo(id: 2, task: "Flutter"),
      Todo(id: 3, task: "Dart"),
    ];
  }
  void Print(){
    return print("$id $task $isDone");
  }
}