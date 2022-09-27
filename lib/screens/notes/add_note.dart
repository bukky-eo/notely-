import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_fly/utilis/constant.dart';
import 'package:note_fly/utilis/drawer.dart';

import '../../utilis/widgets.dart';
import 'added.dart';

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
          title: const Text(
            'All Notes',
            style: kSmallText,
          ),
          centerTitle: true,
          backgroundColor: kBackground,
          // automaticallyImplyLeading: false,
          leading: null,
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
        body: Padding(
          padding:
              const EdgeInsets.only(top: 0, left: 30, right: 30, bottom: 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/third.jpg'),
              const Text(
                'Create Your First Note',
                style: kHeading,
              ),
              const Text(
                'Add a note about anything (your thoughts on climate change, or your history essay) and share it witht the world.',
                style: kSmallTextStyle,
                textAlign: TextAlign.center,
              ),
              ColoredButton(
                  title: 'Create A Note',
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AddNotes()));
                  }),
              ClickText(label: 'Import Notes', onTap: () {})
            ],
          ),
        ),
        drawer: const MyHeader());
  }
}
