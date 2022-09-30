import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:note_fly/screens/notes/edit_notes.dart';
import 'package:note_fly/screens/notes/read_note.dart';
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
      body: Padding(
        padding: const EdgeInsets.only(left: 25.0, right: 25),
        child: Column(
          children: [
            Expanded(
              child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                  stream: FirebaseFirestore.instance
                      .collection('Notes')
                      .snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (snapshot.hasData) {
                      return GridView(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2),
                        children: snapshot.data!.docs
                            .map((note) => noteCard(() {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              AddedNotes(doc: note)));
                                }, note))
                            .toList(),
                      );
                    }
                    return const Text('There is no note');
                  }),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const EditNotes()));
        },
        label: const Text(''),
        icon: const Icon(Icons.add),
      ),
      drawer: const MyHeader(),
    );
  }
}

Widget noteCard(Function()? onTap, QueryDocumentSnapshot doc) {
  return InkWell(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8.0)),
      child: Column(
        children: [
          Text(
            doc['note_title'],
            style: kHeading,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            doc['note_content'],
            overflow: TextOverflow.ellipsis,
            style: kSmallTextStyle,
          )
        ],
      ),
    ),
  );
}
