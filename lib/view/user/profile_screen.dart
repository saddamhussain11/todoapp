import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:todoapp/constant/appcolors.dart';
import 'package:todoapp/constant/appicons.dart';
import 'package:todoapp/util/toast_util.dart';
import 'package:todoapp/view/auth/login_screen.dart';
import 'package:todoapp/widget/Fields/custom_textfield.dart';
import 'package:todoapp/widget/card/Custom_Container.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [],
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  InkWell(
                    onTap: () {},
                    child: CircleAvatar(
                      backgroundColor: Appcolors.Colorgrey,
                      maxRadius: 60.r,
                      child: Icon(
                        Icons.image,
                        size: 50.sp,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 28.h,
                  ),
                  Flexible(
                    child: CustomContainer(
                      height: 45.h,
                      width: double.infinity.w,
                      backgroundColor: Appcolors.Colorgreen2,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 15.h,
                ),
                Text(
                  'Edit profile',
                  style: TextStyle(
                      fontSize: 19.sp,
                      fontWeight: FontWeight.w500,
                      color: Appcolors.Colorgreen),
                ),
                SizedBox(
                  height: 15.h,
                ),
                CustomTextfield(
                  color: Appcolors.Colorweight,
                  border: true,
                  borderColor: Appcolors.Colorweight,
                  labeltext: '',
                  inputType: TextInputType.text,
                  obscuretext: false,
                  sufixicon: Icon(Icons.edit),
                ),
                SizedBox(
                  height: 15.h,
                ),
                CustomTextfield(
                  color: Appcolors.Colorweight,
                  border: true,
                  borderColor: Appcolors.Colorweight,
                  labeltext: '',
                  inputType: TextInputType.text,
                  obscuretext: false,
                ),
                SizedBox(
                  height: 25.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'More',
                      style: TextStyle(
                          fontSize: 19.sp,
                          fontWeight: FontWeight.w500,
                          color: Appcolors.Colorgreen),
                    ),
                    Text(
                      'Save',
                      style: TextStyle(
                          fontSize: 19.sp,
                          fontWeight: FontWeight.w500,
                          color: Appcolors.Colorgreen),
                    ),
                  ],
                ),
                SizedBox(
                  height: 45.h,
                ),
                Row(
                  children: [
                    Icon(Icons.privacy_tip),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      'Privacy policy',
                      style: TextStyle(
                          fontSize: 19.sp,
                          fontWeight: FontWeight.w500,
                          color: Appcolors.Colorblack),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15.h,
                ),
                Row(
                  children: [
                    Icon(Icons.twenty_four_mp_sharp),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      'terms and Conditions',
                      style: TextStyle(
                          fontSize: 19.sp,
                          fontWeight: FontWeight.w500,
                          color: Appcolors.Colorblack),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15.h,
                ),
                InkWell(
                  onTap: () async {
                    await FirebaseAuth.instance.signOut();
                    ToastUtil.success('Logout');
                    Get.to(LoginScreen());
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.logout,
                        color: Appcolors.Colorlitered,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(
                        'logout',
                        style: TextStyle(
                            fontSize: 19.sp,
                            fontWeight: FontWeight.w500,
                            color: Appcolors.Colorlitered),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
