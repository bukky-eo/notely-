import 'package:flutter/material.dart';
import 'package:note_fly/utilis/constant.dart';
import 'package:note_fly/utilis/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,
      body: Padding(
        padding: const EdgeInsets.only(top: 0, left: 35, right: 35, bottom: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'NOTELY',
              textAlign: TextAlign.center,
              style: kTextStyle,
            ),
            const SizedBox(
              height: 25,
            ),
            Image.asset('assets/welcome.jpg'),
            const SizedBox(
              height: 15,
            ),
            const Text(
              "World’s Safest And \nLargest Digital Notebook",
              textAlign: TextAlign.center,
              style: kTextStyle,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Notely is the world’s safest, largest and \nintelligent digital notebook. Join over \n10M+ users already using Notely.",
              textAlign: TextAlign.center,
              style: kSmallTextStyle,
            ),
            const SizedBox(
              height: 10,
            ),
            const ColoredButton(title: 'GET STARTED'),
            const SizedBox(
              height: 10,
            ),
            const ClickText(label: 'Already have an account')
          ],
        ),
      ),
    );
  }
}
