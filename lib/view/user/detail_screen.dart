import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:todoapp/view/user/edit_screen.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    final arguments = Get.arguments;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 70,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(
                      Icons.arrow_circle_left_outlined,
                      size: 35.sp,
                    )),
                IconButton(
                    onPressed: () => passArgument(),
                    icon: Icon(
                      Icons.edit_note,
                      size: 40.sp,
                    )),
              ],
            ),
            SizedBox(
              height: 70.h,
            ),
            Text(
              arguments['title'],
              style: TextStyle(fontSize: 25.sp, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 10.h,
            ),
            Divider(
              thickness: 3.h,
            ),
            SizedBox(
              height: 40.h,
            ),
            Text(
              arguments['description'],
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              textAlign: TextAlign.right,
              arguments['time'],
              style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }

  void passArgument() {
    final arguments = Get.arguments;

    Get.to(() => EditScreen(), arguments: {
      'title': arguments['title'],
      'description': arguments['description'],
      'docid': arguments['docid']
    });
  }
}
