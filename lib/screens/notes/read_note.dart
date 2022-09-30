import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../utilis/constant.dart';

class AddedNotes extends StatefulWidget {
  QueryDocumentSnapshot doc;
  AddedNotes({Key? key, required this.doc}) : super(key: key);

  @override
  State<AddedNotes> createState() => _AddedNotesState();
}

class _AddedNotesState extends State<AddedNotes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Text(
              widget.doc['note_title'],
              style: kHeading,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              widget.doc['note_content'],
              overflow: TextOverflow.ellipsis,
              style: kSmallTextStyle,
            )
          ],
        ),
      ),
    );
  }
}
