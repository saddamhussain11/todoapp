import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:todoapp/constant/appcolors.dart';
import 'package:todoapp/util/toast_util.dart';
import 'package:todoapp/view/user/home_screen.dart';
import 'package:todoapp/widget/Button/Custom_Buton.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({super.key});

  @override
  State<EditScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<EditScreen> {
  TextEditingController titlecontroler = TextEditingController();
  TextEditingController descriptioncontroler = TextEditingController();
  bool Loading = false;

  @override
  void initState() {
    final argument = Get.arguments;
    titlecontroler.text = argument['title'] ?? '';
    descriptioncontroler.text = argument['description'] ?? '';

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_circle_left_outlined,
                      size: 35.sp,
                    )),
              ],
            ),
            SizedBox(
              height: 70.h,
            ),
            TextField(
              controller: titlecontroler,
              decoration: InputDecoration(border: InputBorder.none),
              style: TextStyle(fontSize: 25.sp),
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
            TextField(
              maxLines: null,
              controller: descriptioncontroler,
              decoration: InputDecoration(border: InputBorder.none),
              style: TextStyle(fontSize: 18.sp),
            ),
            SizedBox(
              height: 40.h,
            ),
            Custombuton(
              height: 50.h,
              width: 200.w,
              backgroundColor: Appcolors.Colorgreen,
              title: 'Update',
              isLoading: Loading,
              ontap: () => editdata(),
            )
          ],
        ),
      ),
    );
  }

  Future editdata() async {
    try {
      setState(() {
        Loading = true;
      });
      final argument = Get.arguments;
      final String docid = argument['docid'];
      await FirebaseFirestore.instance.collection('Todo').doc(docid).update({
        'title': titlecontroler.text,
        'description': descriptioncontroler.text,
      });

      ToastUtil.success('Update Succes');
      Navigator.pop(context);

      setState(() {
        Loading = false;
      });
    } on FirebaseException catch (e) {
      ToastUtil.error(e.toString());
      Loading = false;
      setState(() {});
    }
  }
}
