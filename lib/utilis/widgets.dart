import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';

import 'constant.dart';

class ColoredButton extends StatelessWidget {
  final String title;
  final Function() onTap;
  const ColoredButton({Key? key, required this.title, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 25),
          decoration: BoxDecoration(
              color: kOrange, borderRadius: BorderRadius.circular(15)),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white, fontSize: 20),
          )),
    );
  }
}

class ClickText extends StatelessWidget {
  final String label;
  final Function() onTap;
  const ClickText({Key? key, required this.label, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onTap,
        child: Text(
          label,
          style: const TextStyle(color: kOrange, fontSize: 20),
        ));
  }
}

class EnterText extends StatelessWidget {
  final String title;
  final TextInputType inputType;
  final TextEditingController controller;
  const EnterText(
      {Key? key,
      required this.controller,
      required this.title,
      required this.inputType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: inputType,
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kBackground),
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(12),
          ),
          hintText: title,
          fillColor: Colors.white,
          filled: true),
    );
  }
}

class Tick extends StatelessWidget {
  final String title;
  const Tick({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.check),
          SizedBox(
            width: 25,
            height: 30,
          ),
          Text(
            title,
            style: kDetailsText,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}

class HoverCard extends StatelessWidget {
  final String number;
  final String heading;
  final String season;
  const HoverCard(
      {Key? key,
      required this.number,
      required this.heading,
      required this.season})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
          // side: BorderSide(style: BorderStyle.solid),
          borderRadius: BorderRadius.circular(15)),

      // hoverDecoration: ,
      child: Container(
        height: 125,
        width: 130,
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Text(heading, style: kDetailsText),
            SizedBox(height: 10),
            Text(
              '\$$number',
              style: kPricing,
            ),
            SizedBox(height: 10),
            Text(
              season,
              style: TextStyle(
                  color: kDetails, fontSize: 14, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}

class MyHeaderDrawer extends StatefulWidget {
  const MyHeaderDrawer({Key? key}) : super(key: key);

  @override
  State<MyHeaderDrawer> createState() => _MyHeaderDrawerState();
}

class _MyHeaderDrawerState extends State<MyHeaderDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(image: AssetImage('assests/'))),
          )
        ],
      ),
    );
  }
}
