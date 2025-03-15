import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/module/todolist_model.dart';
import 'package:todoapp/util/toast_util.dart';
import 'package:todoapp/view/user/home_screen.dart';

class TodomodelController extends GetxController {
  final firestore = FirebaseFirestore.instance;
  RxList<TodolistModel> todolist = <TodolistModel>[].obs;
  RxBool isloading = false.obs;

  Future<TodolistModel?> gettodo() async {
    final String userid = FirebaseAuth.instance.currentUser!.uid;
    try {
      isloading.value = true;
      QuerySnapshot Snapshot = await firestore
          .collection('Todo')
          .where('userid', isEqualTo: userid)
          .get();

      List<TodolistModel> fetchedTodos = Snapshot.docs.map((doc) {
        return TodolistModel.fromFirestore(doc.data() as Map<String, dynamic>);
      }).toList();

      todolist.assignAll(fetchedTodos);
      isloading.value = false;
      ToastUtil.success('data read succes');
    } on FirebaseException catch (e) {
      ToastUtil.error(e.toString());
    }
    return null;
  }

  Future addtodo(TextEditingController titlecontroller,
      TextEditingController descroptioncontroller, time, formkey) async {
    final userid = FirebaseAuth.instance.currentUser!.uid;
    if (formkey.currentState!.validate()) {
      try {
        isloading.value = true;
        DocumentReference docref = firestore.collection('Todo').doc();
        TodolistModel todolistModel = TodolistModel(
            docid: docref.id,
            userid: userid,
            title: titlecontroller.text,
            description: descroptioncontroller.text,
            Time: time);
        await docref.set(todolistModel.tofirestore());
        isloading.value = false;
        Get.to(HomeScreen());
        ToastUtil.success('Add data Succes');
      } on FirebaseException catch (e) {
        ToastUtil.error(e.toString());
        isloading.value = false;
      }
    }
  }

  Future updatetodo(TextEditingController titlecontroller,
      TextEditingController descroptioncontroller, docid) async {
    try {
      isloading.value = true;
      await firestore.collection('Todo').doc(docid).update({
        'title': titlecontroller.text,
        'description': descroptioncontroller.text
      });
      ToastUtil.success('Update');
      Get.to(HomeScreen());
      isloading.value = false;
    } on FirebaseException catch (e) {
      ToastUtil.error(e.toString());
      isloading.value = false;
    }
  }

  Future delettodo(docid) async {
    try {
      await firestore.collection('Todo').doc(docid).delete();
      ToastUtil.success('delet');
    } on FirebaseException catch (e) {
      ToastUtil.error(e.toString());
    }
  }
}
