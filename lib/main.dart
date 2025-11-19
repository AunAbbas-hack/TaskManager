import 'package:aunproject1/FIreBase/login_firebase.dart';
import 'package:aunproject1/FIreBase/splash.dart';
import 'package:aunproject1/Portfolio/portfolio.dart';
import 'package:aunproject1/Insta/instagram.dart';
import 'package:aunproject1/Practice/View/dynamic_ListView.dart';
import 'package:aunproject1/Practice/ViewModel/edit_task.dart';
import 'package:aunproject1/Practice/image_Getx.dart';
import 'package:aunproject1/To-DoList/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_)=>EditAndAddNotes())
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: ListviewBuilder1(),
    );
  }
}
