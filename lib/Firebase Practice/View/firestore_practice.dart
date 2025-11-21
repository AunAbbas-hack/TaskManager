import 'package:aunproject1/Utilities/round_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../ViewModel/firestore_controller.dart';

class FireStorePractice extends StatefulWidget {
  const FireStorePractice({super.key});

  @override
  State<FireStorePractice> createState() => _FireStorePracticeState();
}

class _FireStorePracticeState extends State<FireStorePractice> {
  TextEditingController nameController = TextEditingController();
  TextEditingController classnNameController = TextEditingController();
  FireStoreController fireStoreController = FireStoreController();
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FireStoreController>(context, listen: false);
    return Scaffold(
      appBar: AppBar(title: Text("Firestore Firebase Practice")),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          child: Column(
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  hintText: "Enter your Name",
                  border: OutlineInputBorder(),
                ),
              ),
              TextField(
                controller: classnNameController,
                decoration: InputDecoration(
                  hintText: "Enter your Class",
                  border: OutlineInputBorder(),
                ),
              ),
              Consumer<FireStoreController>(
                builder: (context, provider, child) {
                  return RoundButton(
                    title: "Add Student",
                    ontap: () {
                      FocusScope.of(context).unfocus();

                      provider.addStudent(
                        title: nameController.text,
                        className: classnNameController.text,
                      );
                      nameController.clear();
                      classnNameController.clear();
                    },
                  );
                },
              ),
              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                  stream: provider.readStudentStream,
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapShot) {
                    if (snapShot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else if (snapShot.hasError) {
                      return Center(child: Text("Error"));
                    } else if (!snapShot.hasData || snapShot == null) {
                      return Center(child: Text("No Data Found"));
                    } else {
                      return ListView.builder(
                        itemCount: snapShot.data?.docs.length,
                        itemBuilder: (context, index) {
                          final data = snapShot.data?.docs;
                          final name = data?[index]["title"]??"Empty Name";
                          return ListTile(title: Text(name));
                        },
                      );
                    }
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


// Mada the New firestore_practice.dart & firestore_controller.dart and perform the operation of adding students name and class