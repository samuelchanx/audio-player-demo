import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_player_new/auth/auth_page.dart';
import 'package:music_player_new/home_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _checkAuthStatusAndProceed();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Center(
        child: Image.asset(
          'assets/images/logo.png',
          width: 300,
          height: 300,
        ),
      ),
    );
  }

  void _checkAuthStatusAndProceed() async {
    final isSignedIn = FirebaseAuth.instance.currentUser != null;
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      Navigator.pushAndRemoveUntil(
        context,
        CupertinoPageRoute(
          builder: (_) => isSignedIn ? const HomePage() : const AuthPage(),
        ),
        (route) => false,
      );
    });
  }
}
