import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/constant/appcolors.dart';
import 'package:todoapp/constant/appicons.dart';
import 'package:todoapp/constant/appimages.dart';
import 'package:todoapp/controller/authcontroller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Authcontroller authcontroller = Get.put(Authcontroller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [],
      ),
    );
  }
}
