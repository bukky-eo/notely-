import 'package:flutter/material.dart';
import 'package:note_fly/screens/intro/login.dart';
import 'package:note_fly/screens/intro/register.dart';
import 'package:note_fly/utilis/constant.dart';
import 'package:note_fly/utilis/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool showLoginPage = true;

  void toggleScreens() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'NOTELY',
            style: kTextStyle,
          ),
          centerTitle: true,
          backgroundColor: kBackground,
          elevation: 0,
        ),
        backgroundColor: kBackground,
        body: Padding(
          padding:
              const EdgeInsets.only(top: 0, left: 25, right: 25, bottom: 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(height: 10),
              Image.asset(
                'assets/welcome.jpg',
                height: 200,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "World’s Safest And \nLargest Digital Notebook",
                textAlign: TextAlign.center,
                style: kTextStyle,
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                "Notely is the world’s safest, largest and \nintelligent digital notebook. Join over \n10M+ users already using Notely.",
                textAlign: TextAlign.center,
                style: kSmallTextStyle,
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: Column(
                  children: [
                    ColoredButton(
                        title: 'GET STARTED',
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      Register(showLoginPage: toggleScreens)));
                        }),
                    ClickText(
                      label: 'Already have an account',
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage(
                                    showRegisterPage: toggleScreens)));
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
