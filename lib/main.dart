import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:note_fly/screens/homepage.dart';
import 'mainpage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  runApp(NoteFly());
}

class NoteFly extends StatelessWidget {
  const NoteFly({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
