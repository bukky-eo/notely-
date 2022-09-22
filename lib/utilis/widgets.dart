import 'package:flutter/material.dart';

import 'constant.dart';

class ColoredButton extends StatelessWidget {
  final String title;
  const ColoredButton({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 25),
          decoration: BoxDecoration(
              color: kOrange, borderRadius: BorderRadius.circular(15)),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 20),
          )),
    );
  }
}

class ClickText extends StatelessWidget {
  final String label;
  const ClickText({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {},
        child: Text(
          label,
          style: TextStyle(color: kOrange, fontSize: 20),
        ));
  }
}
