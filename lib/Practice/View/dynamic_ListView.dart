import 'package:aunproject1/Customs/customs.dart';
import 'package:aunproject1/Practice/ViewModel/adding_notes.dart';
import 'package:aunproject1/Practice/ViewModel/edit_task.dart';
import 'package:aunproject1/Utilities/round_button.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListviewBuilder1 extends StatefulWidget {
  const ListviewBuilder1({super.key});

  @override
  State<ListviewBuilder1> createState() => _ListviewBuilder1State();
}

class _ListviewBuilder1State extends State<ListviewBuilder1> {
  final AddingNotes addingNotes = AddingNotes();
  final EditAndAddNotes editAndAddNotes = EditAndAddNotes();
  final searchController = TextEditingController();
  String search="";
  void updateNotes({required String title, required String id}) {
    final editProvider = Provider.of<EditAndAddNotes>(context, listen: false);
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Update Notes"),
          content: TextField(
            controller: editProvider.editingController,
            decoration: InputDecoration(
                hintText: title),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                editAndAddNotes.upDateNotes(
                  id: id,
                  notes: editProvider.editingController.text,
                );
                Navigator.pop(context);
              },
              child: Text("Save"),
            ),
          ],
        );
      },
    );
  }

  void addNotes() {
    final addProvider = Provider.of<EditAndAddNotes>(context, listen: false);
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Add Notes"),
          content: TextField(
            controller: addProvider.addNotesController,
            decoration: InputDecoration(
                hintText: "Add Notes"),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                editAndAddNotes.addNotes(
                  notes: addProvider.addNotesController.text,
                );
                Navigator.pop(context);
                addProvider.addNotesController.clear();
              },
              child: Text("Save"),
            ),
          ],
        );
      },
    );
  }
  void searchNotes(String queury){
    if(queury.isEmpty){
      addingNotes.notesRef;
    }
    else{
      setState(() {
       search=queury;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Uihelper.customText(
          text: "TO DO List.",
          size: 20,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        centerTitle: true,
        elevation: 2,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
               TextField(
                 onChanged: (value){
                   setState(() {
                     search = value.toLowerCase();
                   });
                 },
                  controller: searchController,
                  decoration: InputDecoration(
                    hintText: "Search Notes List",
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.search),
                  ),
                ),
              SizedBox(height: 10),

              Expanded(
                child: StreamBuilder(
                  stream: addingNotes.notesRef.onValue,
                  builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
                    if (!snapshot.hasData) {
                      return CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.purple.withOpacity(0.2),
                        child: CircularProgressIndicator(
                          color: Colors.blue,
                          strokeWidth: 2,
                        ),
                      );
                    }
                   else if (snapshot.data?.snapshot.value == null) {
                      return Center(child: Text("No Notes Found"));
                    }
                   Map<dynamic,dynamic> map=snapshot.data?.snapshot.value??false as dynamic;
                   List<dynamic> list=[];
                   list.clear();
                   list=map.values.toList();
                   List<dynamic> filterdList=list.where((element){String note=element["note"].toString().toLowerCase();
                    return note.contains(search.toLowerCase());}).toList();
                   if(filterdList.isEmpty){
                     return Center(child: Text(search.isEmpty?"No Notes Found":"No Match Found"));
                   }
                    return ListView.builder(
                      itemCount: filterdList.length,
                      itemBuilder: (context, index) {
                        if (!snapshot.hasData) {
                          return SizedBox(
                              height: 50,
                              width: 50,
                              child: CircularProgressIndicator());
                        } else {
                          final notesTitle = filterdList[index]["note"].toString();
                          final notesId = filterdList[index]["id"].toString();
                          return Consumer<EditAndAddNotes>(builder: (_,context,__){
                            return Card(
                              child: ListTile(
                                title: Text(notesTitle),
                                subtitle: Text(notesId),
                                trailing: PopupMenuButton<String>(
                                  onSelected: (value) {
                                    if (value == "edit") {
                                      updateNotes(title: notesTitle, id: notesId);
                                    } else if (value == "delete") {
                                      addingNotes.notesRef.child(notesId).remove();
                                    }
                                  },
                                  itemBuilder: (context) => [
                                    PopupMenuItem(
                                      value: "edit",
                                      child: Text("Edit"),
                                    ),
                                    PopupMenuItem(
                                      value: "delete",
                                      child: Text("Delete"),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          });
                        }
                      },
                    );
                  },
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Consumer<EditAndAddNotes>(builder: (context,value,child){
                  return RoundButton(title: "Add Notes", ontap: () {
                    addNotes();
                  },);
                })
              ),
            ],
          ),
        ),
      ),
    );
  }
}
