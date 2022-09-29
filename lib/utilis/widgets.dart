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
  // final String? errorText;
  const EnterText({
    Key? key,
    required this.controller,
    required this.title,
    required this.inputType,
    // required this.errorText
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: inputType,
      decoration: InputDecoration(
          // errorText: errorText,
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: kBackground),
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black),
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
          const Icon(Icons.check),
          const SizedBox(
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
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Text(heading, style: kDetailsText),
            const SizedBox(height: 10),
            Text(
              '\$$number',
              style: kPricing,
            ),
            const SizedBox(height: 10),
            Text(
              season,
              style: const TextStyle(
                  color: kDetails, fontSize: 14, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}

class MyHeaderDrawer extends StatelessWidget {
  final IconData icon;
  final String title;
  const MyHeaderDrawer({Key? key, required this.icon, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 35,
            width: 40,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            child: Icon(
              icon,
              color: kOrange,
            ),
          ),
          Text(
            title,
            style: kProfileText,
          ),
          GestureDetector(
            onTap: () {},
            child: Icon(
              Icons.navigate_next_outlined,
              color: kProfile,
            ),
          )
        ],
      ),
    );
  }
}
