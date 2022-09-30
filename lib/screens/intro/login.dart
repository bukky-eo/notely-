import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:note_fly/screens/notes/added.dart';
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
  bool _submitted = false;
  String? get _errorText {
    final password = _passwordController.value.text;
    final text = _emailController.value.text;

    if (text.isEmpty && password.isEmpty) {
      return "Can't be empty";
    }
    if (password.length < 7) {
      return 'Too Short';
    }
    return null;
  }

  void _submit() {
    setState(() => _submitted = true);
    if (_errorText == null) {
      print(_emailController.value.text);
    }
  }

  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 25, right: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'NOTELY',
                  style: kTextStyle,
                ),
                EnterText(
                    inputType: TextInputType.text,
                    controller: _emailController,
                    errorText: _submitted ? _errorText : null,
                    title: 'Email'),
                EnterText(
                    inputType: TextInputType.text,
                    controller: _passwordController,
                    errorText: _submitted ? _errorText : null,
                    title: 'Password'),
                ColoredButton(
                    title: 'Login',
                    onTap: () {
                      setState(() {
                        signIn();
                        _errorText != null ? _submit() : null;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AddNotes()));
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
      ),
    );
  }
}
