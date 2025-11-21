import 'package:aunproject1/FIreBase/login_firebase.dart';
import 'package:aunproject1/FIreBase/splash.dart';
import 'package:aunproject1/Portfolio/portfolio.dart';
import 'package:aunproject1/Insta/instagram.dart';
import 'package:aunproject1/Practice/practice_screen.dart';
import 'package:aunproject1/To-DoList/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'Firebase Practice/View/firestore_practice.dart';
import 'Firebase Practice/ViewModel/edit_&_add_task.dart';
import 'Firebase Practice/ViewModel/firestore_controller.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_)=>EditAndAddNotes()),
    ChangeNotifierProvider(create: (_)=>FireStoreController()),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: PracticeScreen(),
    );
  }
}
