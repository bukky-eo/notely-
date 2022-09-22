import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_fly/screens/homepage.dart';

void main() {
  runApp(NoteFly());
}

class NoteFly extends StatelessWidget {
  const NoteFly({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
