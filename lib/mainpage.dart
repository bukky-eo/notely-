import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:note_fly/screens/homepage.dart';
import 'package:note_fly/screens/intro/authpage.dart';
import 'package:note_fly/screens/notes/add_note.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Notes();
            } else {
              return AuthPage();
            }
          }),
    );
  }
}
