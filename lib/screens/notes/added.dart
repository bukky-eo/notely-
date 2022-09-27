import 'package:flutter/material.dart';
import 'package:note_fly/utilis/constant.dart';

import '../../utilis/drawer.dart';

class AddNotes extends StatefulWidget {
  const AddNotes({Key? key}) : super(key: key);

  @override
  State<AddNotes> createState() => _AddNotesState();
}

class _AddNotesState extends State<AddNotes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Recent Notes',
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
      body: Column(),
      drawer: MyHeader(),
    );
  }
}
