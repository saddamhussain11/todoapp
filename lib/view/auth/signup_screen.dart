import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todoapp/constant/appcolors.dart';
import 'package:todoapp/view/auth/login_screen.dart';
import 'package:todoapp/widget/Button/Custom_Container.dart';
import 'package:todoapp/widget/Fields/custom_textfield.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 172.h,
            ),
            Center(
              child: Text(
                'Welcome Onboard!',
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              height: 39.h,
            ),
            Text(
              'Let’s help you meet up your task',
              style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500,
                  color: Appcolors.Colorgreen),
            ),
            SizedBox(
              height: 39.h,
            ),
            Column(
              spacing: 26.h,
              children: [
                CustomTextfield(
                  color: Appcolors.Colorweight,
                  labeltext: 'Enter your Ful name',
                  inputType: TextInputType.text,
                  obscuretext: false,
                ),
                CustomTextfield(
                  color: Appcolors.Colorweight,
                  labeltext: 'Enter your EmailAdres',
                  inputType: TextInputType.emailAddress,
                  obscuretext: false,
                ),
                CustomTextfield(
                  color: Appcolors.Colorweight,
                  labeltext: 'Enter your pasword',
                  inputType: TextInputType.visiblePassword,
                  obscuretext: true,
                  showSuffixIcon: true,
                ),
                CustomTextfield(
                  color: Appcolors.Colorweight,
                  labeltext: 'Enter your confirmpasword',
                  inputType: TextInputType.visiblePassword,
                  obscuretext: true,
                  showSuffixIcon: true,
                ),
                SizedBox(
                  height: 98.h,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                  child: CustomContainer(
                    width: 220.w,
                    height: 44.h,
                    backgroundColor: Appcolors.Colorgreen,
                    child: Center(
                        child: Text(
                      'Sign up ',
                      style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                          color: Appcolors.Colorweight),
                    )),
                  ),
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
                                builder: (context) => LoginScreen()));
                      },
                      child: Text(
                        'sign in',
                        style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w500,
                            color: Appcolors.Colorgreen),
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
