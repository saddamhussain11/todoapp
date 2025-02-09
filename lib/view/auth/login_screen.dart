import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:todoapp/constant/appcolors.dart';
import 'package:todoapp/constant/appicons.dart';
import 'package:todoapp/constant/appimages.dart';
import 'package:todoapp/controller/authcontroller.dart';
import 'package:todoapp/view/auth/forgatpasword_screen.dart';
import 'package:todoapp/view/auth/signup_screen.dart';
import 'package:todoapp/view/user/addtodolist_screen.dart';
import 'package:todoapp/widget/Button/Custom_Container.dart';
import 'package:todoapp/widget/Fields/custom_textfield.dart';

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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 172.h,
            ),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Welcome back',
                    style:
                        TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 21.h,
                  ),
                  Image.asset(Appimages.Signin),
                  SizedBox(
                    height: 15.h,
                  ),
                  Column(spacing: 26.h, children: [
                    CustomTextfield(
                      width: 320.w,
                      color: Appcolors.Colorweight,
                      labeltext: 'Enter your Ful name',
                      inputType: TextInputType.text,
                      obscuretext: false,
                    ),
                    CustomTextfield(
                      width: 320.w,
                      color: Appcolors.Colorweight,
                      labeltext: 'Enter your pasword',
                      inputType: TextInputType.visiblePassword,
                      obscuretext: true,
                      showSuffixIcon: true,
                    ),
                  ]),
                  SizedBox(
                    height: 38.h,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ForgatpaswordScreen()));
                    },
                    child: Text(
                      'Forgot Password ?',
                      style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500,
                          color: Appcolors.Colorgreen),
                    ),
                  ),
                  SizedBox(
                    height: 45.h,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddtodolistScreen()));
                    },
                    child: CustomContainer(
                      width: 220.w,
                      height: 44.h,
                      backgroundColor: Appcolors.Colorgreen,
                      child: Center(
                          child: Text(
                        'Sign in ',
                        style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500,
                            color: Appcolors.Colorweight),
                      )),
                    ),
                  ),
                  SizedBox(
                    height: 28.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Dont have an account ?',
                        style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignupScreen()));
                        },
                        child: Text(
                          'sign up',
                          style: TextStyle(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w500,
                              color: Appcolors.Colorgreen),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
