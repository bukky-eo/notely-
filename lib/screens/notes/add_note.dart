import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:note_fly/utilis/constant.dart';

class Notes extends StatefulWidget {
  const Notes({Key? key}) : super(key: key);

  @override
  State<Notes> createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  // final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'All Notes',
          style: kSmallText,
        ),
        centerTitle: true,
        backgroundColor: kBackground,
        automaticallyImplyLeading: false,
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.search,
              color: kText,
            ),
          )
        ],
        // title: Text('signed in as:' + user.email!),
      ),
      body: Column(),
      drawer: Drawer(
        backgroundColor: kBackground,
        child: SingleChildScrollView(
          child: Column(
              // MyHeaderDrawer(),
              // MyDrawer(),
              ),
        ),
      ),
    );
  }
}
