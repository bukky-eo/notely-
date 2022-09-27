import 'package:flutter/material.dart';
import 'package:note_fly/screens/notes/add_note.dart';
import 'package:note_fly/utilis/constant.dart';
import 'package:note_fly/utilis/widgets.dart';

class Purchase extends StatefulWidget {
  const Purchase({Key? key}) : super(key: key);

  @override
  State<Purchase> createState() => _PurchaseState();
}

class _PurchaseState extends State<Purchase> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,
      appBar: AppBar(
        backgroundColor: kBackground,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Text(
          'Notely Premium',
          style: kSmallText,
        ),
        centerTitle: true,
        actions: const [
          Icon(
            Icons.close,
            color: kText,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 0, right: 25, left: 25, bottom: 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(child: Image.asset('assets/second.jpg')),
            const Text(
              'Start Using Notely \nwith Premium Benefits',
              style: kHeading,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 15,
            ),
            const Tick(title: 'Save unlimited notes to a single project'),
            const Tick(title: 'Create unlimited projects and teams'),
            const Tick(title: 'Daily backups to keep your data safe'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                HoverCard(
                    number: '79.99', heading: 'Annual', season: 'per year'),
                HoverCard(
                    number: '7.99', heading: 'Monthly', season: 'per month')
              ],
            ),
            ColoredButton(
                title: 'SUBSCRIBE',
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Notes()));
                }),
            ClickText(label: 'Restore Purchase', onTap: () {})
          ],
        ),
      ),
    );
  }
}
