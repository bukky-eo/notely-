import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:note_fly/utilis/constant.dart';

import '../../utilis/widgets.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback showRegisterPage;
  const LoginPage({Key? key, required this.showRegisterPage}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  Future signIn() async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'NOTELY',
                style: kTextStyle,
              ),
              EnterText(
                  inputType: TextInputType.text,
                  controller: _emailController,
                  title: 'Email'),
              EnterText(
                  inputType: TextInputType.text,
                  controller: _passwordController,
                  title: 'Password'),
              ColoredButton(
                  title: 'Login',
                  onTap: () {
                    setState(() {
                      signIn();
                    });
                  }),
              ClickText(
                label: "Don't have an account",
                onTap: widget.showRegisterPage,
              )
            ],
          ),
        ),
      ),
    );
  }
}
