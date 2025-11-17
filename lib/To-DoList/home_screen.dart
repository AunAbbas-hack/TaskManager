import 'package:aunproject1/Customs/constants.dart';
import 'package:aunproject1/To-DoList/searchBar.dart';
import 'package:aunproject1/To-DoList/todo_item.dart';
import 'package:flutter/material.dart';

import 'todoList.dart';

class TodoHome extends StatefulWidget {
  const TodoHome({super.key});

  @override
  State<TodoHome> createState() => _TodoHomeState();
}

class _TodoHomeState extends State<TodoHome> {
  final todoList = Todo.todoList();
  final searchController = TextEditingController();
  List<Todo> findTodo = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    findTodo = todoList;
  }

  void search(String query) {
    List<Todo> results = [];

    if (query.isEmpty) {
      setState(() {
        findTodo = todoList;
      });
    } else {
      setState(() {
        results = todoList
            .where(
              (element) =>
          element.task?.toLowerCase().contains(query.toLowerCase()) ??
              false,
        )
            .toList();

        findTodo = results;
      });
    }
  }


  final newTaskCOntroller = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    newTaskCOntroller.dispose();
  }


  void _deleteTask(String id) {
    setState(() {
      findTodo.removeWhere((item) => item.id.toString() == id);
    });
  }

  void _checkBox(int id, bool isChecked) {
    setState(() {
      findTodo[id].isDone = isChecked;
    });
  }

  void AddTask(String task) {
    setState(() {
      findTodo.add(
        Todo(
          id: DateTime.now().millisecondsSinceEpoch,
          task: task,
          isDone: false,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      drawer: Drawer(),
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: CircleAvatar(radius: 40, backgroundImage: null),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Stack(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TextField(
                      onChanged: (value){
                        return search(value);
                      },
                      controller: searchController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Search',
                        prefixIcon: Icon(Icons.search),
                        prefixIconConstraints: BoxConstraints(
                          maxHeight: 30,
                          minHeight: 20,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 40.0, bottom: 20),
                    child: ListView(
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 20),
                          child: Text("All ToDos", style: headingStyle),
                        ),
                        for (Todo todo in findTodo)
                          TodoItem(
                            todo: todo,
                            onDeleteItem: _deleteTask,
                            onChanged: _checkBox,
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Container(
                      height: 70,
                      width: 30,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 10,
                            offset: Offset(0, 0),
                            spreadRadius: 10,
                          ),
                        ],
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      margin: EdgeInsets.only(left: 20, right: 10, bottom: 20),
                      child: TextField(
                        controller: newTaskCOntroller,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Add a new ToDo Item",
                          hintStyle: textStyle,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 70,
                    width: 70,
                    margin: EdgeInsets.only(left: 30, bottom: 20),
                    decoration: BoxDecoration(
                      color: Colors.blue[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: IconButton(
                        onPressed: () {
                          AddTask(newTaskCOntroller.text);
                          newTaskCOntroller.clear();
                        },
                        icon: Icon(Icons.add, color: Colors.white, size: 30),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
