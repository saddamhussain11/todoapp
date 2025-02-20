import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:todoapp/constant/appcolors.dart';
import 'package:todoapp/constant/appicons.dart';
import 'package:todoapp/constant/appimages.dart';
import 'package:todoapp/util/date&time_util.dart';
import 'package:todoapp/util/toast_util.dart';
import 'package:todoapp/view/auth/login_screen.dart';
import 'package:todoapp/view/user/addtodolist_screen.dart';
import 'package:todoapp/view/user/detail_screen.dart';
import 'package:todoapp/view/user/profile_screen.dart';
import 'package:todoapp/widget/Button/Custom_Buton.dart';
import 'package:todoapp/widget/card/Custom_Container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Random random = Random();

  Color getRandomColor() {
    return Color.fromRGBO(
      random.nextInt(256), // Red (0-255)
      random.nextInt(256), // Green (0-255)
      random.nextInt(256), // Blue (0-255)
      1.0, // Opacity (Full opacity)
    );
  }

  final List todotask = [
    {
      'title': 'Title of your TASK',
      'subtitle': 'Description of your task is .....',
      'time': '6:45 pm',
    },
    {
      'title': 'Title of your TASK',
      'subtitle': 'Description of your task is .....',
      'time': '5:35 pm',
    },
    {
      'title': 'Title of your TASK',
      'subtitle': 'Description of your task is .....',
      'time': '6:45 pm',
    }
  ];

  String userId = FirebaseAuth.instance.currentUser!.uid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Flexible(
              child: CustomContainer(
                height: 295.h,
                width: double.infinity.w,
                backgroundColor: Appcolors.Colorgreen,
                child: Column(
                  children: [
                    SizedBox(
                      height: 50.h,
                    ),
                    StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection('userinfo')
                          .doc(userId)
                          .snapshots(),
                      builder: (context, snapshot) {
                        return Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Get.to(ProfileScreen());
                              },
                              child: CircleAvatar(
                                backgroundColor: Appcolors.Colorgreen,
                                maxRadius: 60.r,
                                backgroundImage: NetworkImage(
                                  snapshot.data!['image'],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 25.h,
                            ),
                            Text(
                              snapshot.data!['name'],
                              style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Appcolors.Colorblack),
                            ),
                          ],
                        );
                      },
                    ),
                    SizedBox(
                      height: 18.h,
                    ),
                    Flexible(
                      child: CustomContainer(
                        height: 55.h,
                        width: double.infinity.w,
                        backgroundColor: Appcolors.Colorgreen2,
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        textAlign: TextAlign.left,
                        'Todo Task',
                        style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w500,
                            color: Appcolors.Colorblack),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection('Todo')
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        } else if (snapshot.hasError) {
                          return Center(
                              child: Text('Error: ${snapshot.error}'));
                        } else if (!snapshot.hasData ||
                            snapshot.data!.docs.isEmpty) {
                          return Center(child: Text('No Products Found'));
                        } else {
                          return ListView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: snapshot.data!.docs.length,
                              itemBuilder: (_, index) {
                                return Padding(
                                    padding: EdgeInsets.all(
                                        8.sp), // Responsive padding
                                    child: CustomContainer(
                                      height: 70.h,
                                      width: 354.w,
                                      backgroundColor: getRandomColor()
                                          .withValues(alpha: .3),
                                      borderRadius: BorderRadius.circular(10),
                                      child: ListTile(
                                        onTap: () {
                                          Get.to(DetailScreen(), arguments: {
                                            'title': snapshot.data!.docs[index]
                                                ['title'],
                                            'description': snapshot.data!
                                                .docs[index]['description'],
                                            'time': DateTimeUtil.formatTime(
                                                snapshot.data!.docs[index]
                                                    ['Time']),
                                            'docid': snapshot.data!.docs[index]
                                                ['docid']
                                          });
                                        },
                                        leading: GestureDetector(
                                          onTap: () async {
                                            final String docid = snapshot
                                                .data!.docs[index]['docid'];
                                            deletdata(docid);
                                          },
                                          child: CircleAvatar(
                                            backgroundColor: Colors.red,
                                            child: Icon(Icons.delete),
                                          ),
                                        ),
                                        title: Text(snapshot.data!.docs[index]
                                            ['title']),
                                        subtitle: Text(snapshot
                                            .data!.docs[index]['description']),
                                        trailing: Text(DateTimeUtil.formatTime(
                                            snapshot.data!.docs[index]
                                                ['Time'])),
                                      ),
                                    ));
                              });
                        }
                      }),
                ],
              ),
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(AddtodolistScreen());
        },
        backgroundColor: Appcolors.Colorgreen,
        child: Icon(Icons.add, color: Colors.white),
        shape: CircleBorder(),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.endFloat, // Default Position
    );
  }

  Future deletdata(String docid) async {
    try {
      print(docid.toString());
      await FirebaseFirestore.instance.collection('Todo').doc(docid).delete();
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }
}
