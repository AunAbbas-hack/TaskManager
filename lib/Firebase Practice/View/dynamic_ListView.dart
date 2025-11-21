import 'package:aunproject1/Customs/constants.dart';
import 'package:aunproject1/Customs/customs.dart';
import 'package:aunproject1/Utilities/Validators/validators.dart';
import 'package:aunproject1/Utilities/round_button.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../ViewModel/adding_notes.dart';
import '../ViewModel/edit_&_add_task.dart';

class ListviewBuilder1 extends StatefulWidget {
  const ListviewBuilder1({super.key});

  @override
  State<ListviewBuilder1> createState() => _ListviewBuilder1State();
}

class _ListviewBuilder1State extends State<ListviewBuilder1> {
  final AddingNotes addingNotes = AddingNotes();
  final EditAndAddNotes editAndAddNotes = EditAndAddNotes();
  final searchController = TextEditingController();
  String search = "";

  final formKey=GlobalKey<FormState>();

  void updateNotes({required String title, required String id}) {
    final editProvider = Provider.of<EditAndAddNotes>(context, listen: false);
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Update Notes"),
          content: TextField(
            controller: editProvider.editingController,
            decoration: InputDecoration(hintText: title),
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
          content: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  TextFormField(
                    validator: (value) {
                     return Validator.firstNameValidator(value);

                    },
                    controller: addProvider.addingNotes.firstNameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Enter First Name",
                    ),
                  ),
                  TextFormField(
                    validator: (value) {
                     return Validator.lastNameValidator(value);

                    },
                    controller: addProvider.addingNotes.lastNameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Enter Last Name",
                    ),
                  ),
                  TextFormField(
                    validator: (value) {
                    return  Validator.phoneNumberValidator(value);

                    },
                    controller: addProvider.addingNotes.phoneNumberController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Enter Phone number",
                    ),
                  ),
                  TextFormField(
                    controller: addProvider.addingNotes.addressController,
                    validator: (value) {
                    return  Validator.addressValidator(value);

                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Enter Address",
                    ),
                  ),
                  TextFormField(
                    controller: addProvider.addingNotes.noteController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Add Notes",
                    ),
                  ),
                ],
              ),
            ),
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
                if(formKey.currentState!.validate()) {
                  editAndAddNotes.addNote(
                    notes: addProvider.addingNotes.noteController.text,
                    firstName: addProvider.addingNotes.firstNameController.text,
                    lastName: addProvider.addingNotes.lastNameController.text,
                    phoneNumber:
                    addProvider.addingNotes.phoneNumberController.text,
                    address: addProvider.addingNotes.addressController.text,
                  );

                  Navigator.pop(context);
                  addProvider.addingNotes.noteController.clear();
                  addProvider.addingNotes.firstNameController.clear();
                  addProvider.addingNotes.lastNameController.clear();
                  addProvider.addingNotes.phoneNumberController.clear();
                  addProvider.addingNotes.addressController.clear();
                }},
              child: Text("Save"),
            ),
          ],
        );
      },
    );
  }

  void searchNotes(String query) {
    if (query.isEmpty) {
      addingNotes.notesRef;
    } else {
      setState(() {
        search = query;
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
                onChanged: (value) {
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
                    else if (snapshot.hasError){
                      return Text("Error");
                    }
                    else if (snapshot.data?.snapshot.value == null) {
                      return Center(child: Text("No Notes Found"));
                    }
                    Map<dynamic, dynamic> map =
                        snapshot.data!.snapshot.value as Map<dynamic, dynamic>;
                    List<dynamic> list = [];
                    list = map.values.toList();
                    List<dynamic> filteredList = list.where((element) {
                      String note = element["note"].toString().toLowerCase();
                      
                      return note.contains(search.toLowerCase());
                    }).toList();
                    if (filteredList.isEmpty) {
                      return Center(
                        child: Text(
                          search.isEmpty ? "No Notes Found" : "No Match Found",
                        ),
                      );
                    }
                    return ListView.builder(
                      itemCount: filteredList.length,
                      itemBuilder: (context, index) {

                          final notesTitle = filteredList[index]["note"].toString();
                          final notesId = filteredList[index]["id"].toString();
                          final firstName=filteredList[index]["firstName"].toString();
                          final lastName=filteredList[index]["lastName"].toString();

                          final phoneNumber=filteredList[index]["phoneNumber"].toString();

                          final address=filteredList[index]["address"].toString();

                          return Consumer<EditAndAddNotes>(
                            builder: (_, context, __) {
                              return Card(
                                child: ListTile(
                                  leading: CircleAvatar(
                                    radius: 20,
                                    child: Text(notesTitle[0]),
                                  ),
                                  title: Text(notesTitle,style: headingStyle,),
                                  subtitle: Column(
                                    children: [
                                      Text(firstName),
                                      Text(lastName),
                                      Text(phoneNumber),
                                      Text(address),
                                      Text(notesId),
                                    ],
                                  ),
                                  trailing: PopupMenuButton<String>(
                                    onSelected: (value) {
                                      if (value == "edit") {
                                        updateNotes(
                                          title: notesTitle,
                                          id: notesId,
                                        );
                                      } else if (value == "delete") {
                                        Get.defaultDialog(
                                          title: "Delete",
                                          middleText:
                                              "Are you sure you want to delete this note?",
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                Get.back();
                                              },
                                              child: Text("Cancel"),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                addingNotes.notesRef
                                                    .child(notesId)
                                                    .remove();
                                                Get.back();
                                              },
                                              child: Text("Delete"),
                                            ),
                                          ],
                                        );
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
                            },
                          );
                        }

                    );
                  },
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Consumer<EditAndAddNotes>(
                  builder: (context, value, child) {
                    return RoundButton(
                      title: "Add Notes",
                      ontap: () {
                        addNotes();
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
