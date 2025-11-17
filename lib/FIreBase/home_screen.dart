import 'package:aunproject1/FIreBase/add_post.dart';
import 'package:aunproject1/FIreBase/login_firebase.dart';
import 'package:aunproject1/Utilities/more_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();
  final postRef = FirebaseDatabase.instance.ref("Post");
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    searchController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              FirebaseAuth.instance.signOut().then((value) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginFirebase()),
                );
              });
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddPost()),
          );
        },
        child: Icon(Icons.add),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextFormField(
            controller: searchController,
            decoration: InputDecoration(
              hintText: "Search",
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.search),
            ),
            onChanged: (String value) {
              setState(() {

              });
            }
          ),
          Expanded(
            child: StreamBuilder(
              stream: postRef.onValue,
              builder: (context, AsyncSnapshot<DatabaseEvent> snapShot) {
                return ListView.builder(

                  itemCount: snapShot.data!.snapshot.children.length,
                  itemBuilder: (context, index) {
                    if (!snapShot.hasData) {
                      return CircularProgressIndicator();
                    } else {
                      Map<dynamic, dynamic> map =
                          snapShot.data!.snapshot.value as dynamic;
                      List<dynamic> list = [];
                      list.clear();
                      list = map.values.toList();
                      final title= list[index]["title"].toString();
                      final id= list[index]["id"].toString();
                      if(searchController.text.isEmpty){
                        return Card(
                          child: ListTile(

                            title: Text(title),
                            subtitle: Text(id),
                            trailing: MoreButton()
                          ),
                        );
                      }
                      else if(title.toLowerCase().contains(searchController.toString().toLowerCase())){
                        return Card(
                          child: ListTile(

                            title: Text(title),
                            subtitle: Text(id),
                            trailing: IconButton(onPressed: (){
                            }, icon: Icon(Icons.more_vert)),
                          ),
                        );
                      }
                      else
                        return Container();

                    }
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
