import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/controller/backend/userinfo_controller.dart';
import 'package:todoapp/module/user_model.dart';
import 'package:todoapp/util/toast_util.dart';
import 'package:todoapp/view/auth/login_screen.dart';
import 'package:todoapp/view/user/home_screen.dart';

class Authcontroller extends GetxController {
  UserinfoController userinfoController = Get.put(UserinfoController());
  RxBool isLoading = false.obs;

  Future signup(
    formkey,
    TextEditingController emailcontroler,
    TextEditingController paswordcontroler,
  ) async {
    if (formkey.currentState!.validate()) {
      try {
        isLoading.value = true;

        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailcontroler.text.trim(), password: paswordcontroler.text);

        ToastUtil.success('succes');
        isLoading.value = false;
      } on FirebaseAuthException catch (e) {
        ToastUtil.error(e.toString());
        isLoading.value = false;
      }
    }
  }

  Future signIn(formkey, TextEditingController paswordcontroler,
      TextEditingController emailcontroler) async {
    if (formkey.currentState!.validate()) {
      try {
        isLoading.value = true;
        await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: emailcontroler.text, password: paswordcontroler.text);
        ToastUtil.success('Your account Logedin');
        isLoading.value = false;
        Get.to(HomeScreen());
      } on FirebaseAuthException catch (e) {
        ToastUtil.error(e.toString());
        isLoading.value = false;
      }
    }
  }

  Future forgotPassword(formkey, TextEditingController emailcontroler) async {
    if (formkey.currentState!.validate()) {
      try {
        isLoading.value = true;
        await FirebaseAuth.instance.sendPasswordResetEmail(
          email: emailcontroler.text,
        );
        ToastUtil.success('Your pasword Reset');
        isLoading.value = false;
      } on FirebaseAuthException catch (e) {
        ToastUtil.error(e.toString());
        isLoading.value = false;
      }
    }
  }

  Future logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      ToastUtil.success('Logout');
      Get.offAll(LoginScreen());
    } on FirebaseAuthException catch (e) {
      ToastUtil.error(e.toString());
    }
  }
}
