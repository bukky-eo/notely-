import 'package:flutter/material.dart';
import 'package:note_fly/screens/intro/purchase.dart';
import 'package:note_fly/utilis/constant.dart';
import 'package:note_fly/utilis/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Register extends StatefulWidget {
  final VoidCallback showLoginPage;
  const Register({Key? key, required this.showLoginPage}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController;
    _nameController;
    _passwordController;
    super.dispose();
  }

  Future Register() async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kBackground,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'NOTELY',
          style: kTextStyle,
        ),
        elevation: 0,
        backgroundColor: kBackground,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Create a free account',
                style: kHeading,
              ),
              Text(
                'Join Notely for free. Create and share unlimited notes with your friends.',
                style: kSmallTextStyle,
                textAlign: TextAlign.center,
              ),
              EnterText(
                  inputType: TextInputType.name,
                  controller: _nameController,
                  title: 'Full Name'),
              EnterText(
                  inputType: TextInputType.text,
                  controller: _emailController,
                  title: 'Email'),
              EnterText(
                  inputType: TextInputType.text,
                  controller: _passwordController,
                  title: 'Password'),
              ColoredButton(
                  title: 'Create Account',
                  onTap: () {
                    setState(() {
                      Register();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Purchase()));
                    });
                  }),
              ClickText(
                  label: 'Already have an account', onTap: widget.showLoginPage)
            ],
          ),
        ),
      ),
    );
  }
}
