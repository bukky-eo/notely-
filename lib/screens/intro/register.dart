import 'package:flutter/material.dart';
import 'package:note_fly/screens/intro/purchase.dart';
import 'package:note_fly/utilis/constant.dart';
import 'package:note_fly/utilis/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Register extends StatefulWidget {
  final VoidCallback showLoginPage;
  // final ValueChanged<String> onSubmit;
  const Register({
    Key? key,
    required this.showLoginPage,
  }) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  bool _submitted = false;

  @override
  void dispose() {
    _emailController;
    _nameController;
    _passwordController;
    super.dispose();
  }

  String? get _errorText {
    final password = _passwordController.value.text;
    final text = _emailController.value.text;
    final name = _nameController.value.text;
    if (text.isEmpty && password.isEmpty && name.isEmpty) {
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

  Future Register() async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: ValueListenableBuilder(
            valueListenable: _emailController,
            builder: (context, TextEditingValue value, __) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                      errorText: _submitted ? _errorText : null,
                      title: 'Full Name'),
                  EnterText(
                      inputType: TextInputType.text,
                      controller: _emailController,
                      errorText: _submitted ? _errorText : null,
                      title: 'Email'),
                  EnterText(
                      inputType: TextInputType.text,
                      errorText: _submitted ? _errorText : null,
                      controller: _passwordController,
                      title: 'Password'),
                  ColoredButton(
                      title: 'Create Account',
                      onTap: () {
                        setState(() {
                          _errorText != null ? _submit : null;
                          Register();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Purchase()));
                        });
                      }),
                  ClickText(
                      label: 'Already have an account',
                      onTap: widget.showLoginPage)
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
