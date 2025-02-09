import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todoapp/constant/appcolors.dart';
import 'package:todoapp/constant/appimages.dart';
import 'package:todoapp/widget/Button/Custom_Container.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            CustomContainer(
              height: 280.h,
              width: double.infinity.w,
              backgroundColor: Appcolors.Colorgreen,
              child: Column(
                children: [
                  SizedBox(
                    height: 50.h,
                  ),
                  CircleAvatar(
                    backgroundColor: Appcolors.Colorgreen,
                    maxRadius: 60.r,
                    backgroundImage: AssetImage(
                      Appimages.home,
                    ),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  Text(
                    'Welcome Fisayomi',
                    style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                        color: Appcolors.Colorblack),
                  ),
                  SizedBox(
                    height: 18.h,
                  ),
                  CustomContainer(
                    height: 45.h,
                    width: double.infinity.w,
                    backgroundColor: Appcolors.Colorgreen2,
                  )
                ],
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
                  ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: todotask.length,
                      itemBuilder: (_, index) {
                        return Padding(
                            padding: EdgeInsets.all(8.sp), // Responsive padding
                            child: CustomContainer(
                              height: 70.h,
                              width: 354.w,
                              backgroundColor: getRandomColor(),
                              borderRadius: BorderRadius.circular(10),
                              child: ListTile(
                                title: Text(todotask[index]['title']),
                                subtitle: Text(todotask[index]['subtitle']),
                                trailing: Text(todotask[index]['time']),
                              ),
                            ));
                      }),
                ],
              ),
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("FAB Pressed!");
        },
        backgroundColor: Appcolors.Colorgreen,
        child: Icon(Icons.add, color: Colors.white),
        shape: CircleBorder(),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.endFloat, // Default Position
    );
  }
}
