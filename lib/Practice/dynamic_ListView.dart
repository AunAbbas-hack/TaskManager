import 'package:aunproject1/Customs/customs.dart';
import 'package:aunproject1/Practice/adding_notes.dart';
import 'package:aunproject1/functions/add_notes.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListviewBuilder1 extends StatefulWidget {
  const ListviewBuilder1({super.key});

  @override
  State<ListviewBuilder1> createState() => _ListviewBuilder1State();
}

class _ListviewBuilder1State extends State<ListviewBuilder1> {
  AddingNotes addingNotes=AddingNotes();

  void edit(){
    final editingController=TextEditingController();
    showDialog(context: context, builder: (context){
      return AlertDialog(
        title: Text("Edit Note"),
        content: TextField(
          controller: editingController,
          decoration: InputDecoration(
            hintText: "Edit Note",
            border: OutlineInputBorder(),
          ),

        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              addingNotes.notesRef.child("id").set(
                {
                  'note':editingController.text.toString(),
                  'id':"id",
                  'subTitle':editingController.text.toString()
                }
              );
              Navigator.pop(context);
            },
            child: Text("Save"),
          ),
        ],
      );
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Listview Builder"), centerTitle: true,elevation: 2,),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Uihelper.customText(
                text: "TO DO List.",
                size: 20,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              Obx(()=>TextField(
                controller: addingNotes.addNotes.noteController.value,
                decoration: InputDecoration(
                  hintText: "Add List",
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.search),
                ),
              ),),
             SizedBox(height: 10,),
             ElevatedButton(
                onPressed: () {
                  addingNotes.addingNote();
                },
                child: Text("Add List"),
              ),
              Expanded(
                child: StreamBuilder(stream: addingNotes.notesRef.onValue, builder: (context,AsyncSnapshot<DatabaseEvent> snapshot){
                  return ListView.builder(
                      itemCount: snapshot.data?.snapshot.children.length??0,
                      itemBuilder: (context,index){
                    if(!snapshot.hasData){
                      return CircularProgressIndicator();
                    }
                    else{
                      Map<dynamic,dynamic> map=snapshot.data!.snapshot.value as dynamic;
                      List<dynamic>list=[];
                      list.clear();
                      list=map.values.toList();
                      final title=list[index]["note"].toString();
                      final id=list[index]["id"].toString();
                      return ListTile(
                        title: Text(title),
                        subtitle: Text(id),
                        trailing: PopupMenuButton<String>(
                            onSelected: (value){
                              if(value=="edit"){
                                edit();
                              }
                              else if(value=="delete"){
                                addingNotes.notesRef.child(id).remove();
                              }
                            },
                            itemBuilder: (context)=>[
                        PopupMenuItem(value: "edit",child: Text("Edit"),),
                          PopupMenuItem(value: "delete",child: Text("Delete"),),

                       ] )
                      );
                    }
                  });
                })
              ),
            ],
          ),
        ),
      ),
    );
  }
}
