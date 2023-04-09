import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myapp/a_Sayfalar/home.dart';
import 'package:myapp/a_Sayfalar/login.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  // ignore: prefer_typing_uninitialized_variables
  var user;

  @override
  void initState() {
    super.initState();
    checkUser();
  }

  @override
  Widget build(BuildContext context) {
    if (user == null) {
      return LoginScreen();
    } else {
      return const HomeScreen();
    }
  }

  Future<void> checkUser() async {
    user = FirebaseAuth.instance.currentUser;
  }
}
