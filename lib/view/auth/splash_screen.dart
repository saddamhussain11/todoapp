import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todoapp/view/auth/onboarding.dart';
import 'package:todoapp/view/auth/signup_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final box = GetStorage();

  void initState() {
    super.initState();
    Timer(const Duration(seconds: 4), () {
      final bool onbordingply = box.read('onbording');
      if (onbordingply) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => SignupScreen()));
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => Onboarding()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Center(child: Text('Splash Scren'))],
      ),
    );
  }
}
