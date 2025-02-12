import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:todoapp/constant/appcolors.dart';
import 'package:todoapp/constant/appicons.dart';
import 'package:todoapp/constant/appimages.dart';
import 'package:todoapp/controller/authcontroller.dart';
import 'package:todoapp/util/toast_util.dart';
import 'package:todoapp/view/auth/forgatpasword_screen.dart';
import 'package:todoapp/view/auth/signup_screen.dart';
import 'package:todoapp/view/user/addtodolist_screen.dart';
import 'package:todoapp/widget/Button/Custom_Buton.dart';
import 'package:todoapp/widget/Fields/custom_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailcontroler = TextEditingController();
  TextEditingController paswordcontroler = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  Authcontroller authcontroller = Get.put(Authcontroller());
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
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
                      style: TextStyle(
                          fontSize: 20.sp, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 21.h,
                    ),
                    Image.asset(Appimages.Signin),
                    SizedBox(
                      height: 15.h,
                    ),
                    Form(
                      key: _formkey,
                      child: Column(spacing: 26.h, children: [
                        CustomTextfield(
                          controller: emailcontroler,
                          width: 320.w,
                          color: Appcolors.Colorweight,
                          labeltext: 'Enter your Ful Email',
                          inputType: TextInputType.text,
                          obscuretext: false,
                          validator: (value) {
                            if (value == '' || value == null) {
                              return 'Please enter your Email';
                            }
                            return null;
                          },
                        ),
                        CustomTextfield(
                          controller: paswordcontroler,
                          width: 320.w,
                          color: Appcolors.Colorweight,
                          labeltext: 'Enter your pasword',
                          inputType: TextInputType.visiblePassword,
                          obscuretext: true,
                          showSuffixIcon: true,
                          validator: (value) {
                            if (value == '' || value == null) {
                              return 'Please enter your Pasword';
                            } else if (value.length < 6) {
                              return 'Enter at least 6 digit';
                            }
                            return null;
                          },
                        ),
                      ]),
                    ),
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
                    Custombuton(
                      width: 220.w,
                      height: 44.h,
                      backgroundColor: Appcolors.Colorgreen,
                      ontap: () async {
                        if (_formkey.currentState!.validate()) {
                          try {
                            isLoading = true;
                            setState(() {});
                            await FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                                    email: emailcontroler.text.trim(),
                                    password: paswordcontroler.text)
                                .then((value) {
                              Get.to(() => AddtodolistScreen());
                              isLoading = false;
                              setState(() {});
                            });
                            ToastUtil.success('you hvae Succesfuly Logedin');
                          } on FirebaseAuthException catch (e) {
                            ToastUtil.error('an error ocurd');
                            isLoading = false;
                            setState(() {});
                          }
                        }
                      },
                      title: 'Log in',
                      isLoading: isLoading,
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
      ),
    );
  }
}
