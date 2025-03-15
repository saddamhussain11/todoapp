import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/module/user_model.dart';
import 'package:todoapp/util/toast_util.dart';
import 'package:todoapp/view/user/home_screen.dart';

class UserinfoController extends GetxController {
  RxBool isLoading = false.obs;
  RxList<UserModel> userinfolist = <UserModel>[].obs;
  final firestore = FirebaseFirestore.instance;

  Future<UserModel?> getuserinfo() async {
    final String userid = FirebaseAuth.instance.currentUser!.uid;
    try {
      DocumentSnapshot snapshot =
          await firestore.collection('userinfo').doc(userid).get();

      UserModel fetchuserinfo = UserModel.fromFirestore(snapshot);
      userinfolist.assignAll([fetchuserinfo]);
      print('✅ User fetched successfully: ${fetchuserinfo.name}');
      print('📌 Total Users in List: ${userinfolist.length}');
      return fetchuserinfo;
    } on FirebaseException catch (e) {
      ToastUtil.error(e.toString());
      isLoading.value = false;
    }
    return null;
  }

  Future adduserifo(TextEditingController namecontroller,
      TextEditingController emailcontroller) async {
    final String userid = FirebaseAuth.instance.currentUser!.uid;
    try {
      isLoading.value = true;

      UserModel userModel = UserModel(
          userid: userid,
          name: namecontroller.text,
          email: emailcontroller.text,
          image: '');

      await firestore
          .collection('userinfo')
          .doc(userid)
          .set(userModel.toFirestore());

      isLoading.value = false;
      Get.offAll(HomeScreen());
    } on FirebaseException catch (e) {
      ToastUtil.error(e.toString());
      isLoading.value = false;
    }
  }

  Future updateuserinfo(TextEditingController namecontroller, userid) async {
    isLoading.value = true;
    try {
      await firestore
          .collection('userinfo')
          .doc(userid)
          .update({'name': namecontroller.text, 'image': ''}).then(
        (value) {
          isLoading.value = false; // پہلے false کرو
          ToastUtil.success('Update');
          Get.off(HomeScreen());
        },
      );
    } on FirebaseException catch (e) {
      isLoading.value = false;
      ToastUtil.error(e.toString());
    }
  }
}
