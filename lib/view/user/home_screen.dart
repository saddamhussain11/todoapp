import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:todoapp/constant/appcolors.dart';
import 'package:todoapp/controller/Ui/theme_controller.dart';
import 'package:todoapp/controller/backend/todomodel_controller.dart';
import 'package:todoapp/controller/backend/userinfo_controller.dart';
import 'package:todoapp/module/todolist_model.dart';
import 'package:todoapp/module/user_model.dart';
import 'package:todoapp/util/date&time_util.dart';
import 'package:todoapp/util/loading_util.dart';
import 'package:todoapp/view/user/addtodolist_screen.dart';
import 'package:todoapp/view/user/detail_screen.dart';
import 'package:todoapp/view/user/profile_screen.dart';
import 'package:todoapp/widget/card/Custom_Container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TodomodelController todomodelController = Get.put(TodomodelController());
  UserinfoController userinfoController = Get.put(UserinfoController());
  ThemeController themeController = Get.put(ThemeController());
  final Random random = Random();

  Color getRandomColor() {
    return Color.fromRGBO(
      random.nextInt(256), // Red (0-255)
      random.nextInt(256), // Green (0-255)
      random.nextInt(256), // Blue (0-255)
      1.0, // Opacity (Full opacity)
    );
  }

  @override
  void initState() {
    todomodelController.gettodo();
    userinfoController.getuserinfo();
    super.initState();
  }

  String userId = FirebaseAuth.instance.currentUser!.uid;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {
                themeController.switchtheme();
              },
              icon: Icon(Icons.brightness_2_outlined))
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 280.h,
            width: double.infinity,
            decoration: BoxDecoration(color: Appcolors.Colorgreen),
            child: Column(
              children: [
                SizedBox(
                  height: 40.h,
                ),
                Obx(
                  () {
                    if (userinfoController.isLoading.value == true) {
                      return LoadingUtil.shimmerTile(itemcount: 1);
                    } else if (userinfoController.userinfolist.isEmpty) {
                      return Center(child: Text('No Products Found'));
                    } else {
                      return Column(
                        children: [
                          InkWell(
                            onTap: () {
                              UserModel userModel = UserModel(
                                  userid: userId,
                                  name: userinfoController
                                      .userinfolist.first.name,
                                  email: userinfoController
                                      .userinfolist.first.email,
                                  image: userinfoController
                                      .userinfolist.first.image);
                              Get.to(ProfileScreen(), arguments: userModel);
                            },
                            child: CircleAvatar(
                              backgroundColor: Appcolors.Colorweight,
                              maxRadius: 60.r,
                              backgroundImage: NetworkImage(
                                userinfoController.userinfolist.first.image,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 25.h,
                          ),
                          Text(
                            userinfoController.userinfolist.first.name,
                            style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w500,
                                color: Appcolors.Colorblack),
                          ),
                        ],
                      );
                    }
                  },
                )
              ],
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Text(
              'Todo list ',
              style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                  color: Appcolors.Colorblack),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Obx(() {
            if (todomodelController.isloading.value == true) {
              return LoadingUtil.shimmerTile(itemcount: 8);
            } else if (todomodelController.todolist.isEmpty) {
              return Center(child: Text('No Products Found'));
            } else {
              return Expanded(
                child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: todomodelController.todolist.length,
                    itemBuilder: (_, index) {
                      return Padding(
                          padding: EdgeInsets.all(8.sp), // Responsive padding
                          child: CustomContainer(
                            height: 70.h,
                            width: 354.w,
                            backgroundColor:
                                getRandomColor().withValues(alpha: .3),
                            borderRadius: BorderRadius.circular(10),
                            child: ListTile(
                              style: theme.listTileTheme.style,
                              onTap: () {
                                TodolistModel todolistModel = TodolistModel(
                                  docid:
                                      todomodelController.todolist[index].docid,
                                  userid: userId,
                                  title:
                                      todomodelController.todolist[index].title,
                                  description: todomodelController
                                      .todolist[index].description,
                                  Time: DateTimeUtil.formatTime(
                                      todomodelController.todolist[index].Time),
                                );
                                Get.to(DetailScreen(),
                                    arguments: todolistModel);
                              },
                              leading: GestureDetector(
                                onTap: () async {
                                  final String docid =
                                      todomodelController.todolist[index].docid;
                                  todomodelController.delettodo(docid);
                                  todomodelController.gettodo();
                                },
                                child: CircleAvatar(
                                  backgroundColor: Colors.red,
                                  child: Icon(Icons.delete),
                                ),
                              ),
                              title: Text(
                                todomodelController.todolist[index].title,
                              ),
                              subtitle: Text(todomodelController
                                  .todolist[index].description),
                              trailing: Text(DateTimeUtil.formatTime(
                                  todomodelController.todolist[index].Time)),
                            ),
                          ));
                    }),
              );
            }
          })
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(AddtodolistScreen());
        },
        backgroundColor: Appcolors.Colorgreen,
        child: Icon(Icons.add, color: Colors.white),
        shape: CircleBorder(),
      ),
    );
  }
}
