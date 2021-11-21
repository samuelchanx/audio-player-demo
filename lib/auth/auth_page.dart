import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_player_new/home_page.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:string_validator/string_validator.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final emailInput = TextEditingController();
  final passwordInput = TextEditingController();

  @override
  void dispose() {
    emailInput.dispose();
    passwordInput.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Log in now'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          TextField(
            controller: emailInput,
            textAlign: TextAlign.center,
            decoration: const InputDecoration(
              hintText: 'Input a valid email',
              label: Text('Email'),
            ),
          ).padding(bottom: 24),
          TextField(
            controller: passwordInput,
            obscureText: true,
            textAlign: TextAlign.center,
            decoration: const InputDecoration(
              label: Text('Password'),
              hintText: 'At least 8 characters',
            ),
            keyboardType: TextInputType.visiblePassword,
          ).padding(bottom: 36),
          ElevatedButton(
            onPressed: () {
              final email = emailInput.text;
              final password = passwordInput.text;
              if (!isEmail(email)) {
                const snackBar = SnackBar(content: Text('Invalid email'));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                return;
              }

              if (password.length < 9) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Invalid password, need to be at least 8 characters')),
                );
                return;
              }

              _login(email, password);
            },
            child: Text('Login'),
          ),
        ],
      ).padding(horizontal: 16),
    );
  }

  Future _login(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      Navigator.pushAndRemoveUntil(
        context,
        CupertinoPageRoute(builder: (_) => const HomePage()),
        (route) => false,
      );
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to login, please try again later')),
      );
    }
  }
}
