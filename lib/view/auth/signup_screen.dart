import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:todoapp/constant/appcolors.dart';
import 'package:todoapp/util/toast_util.dart';
import 'package:todoapp/view/auth/login_screen.dart';
import 'package:todoapp/widget/Button/Custom_Buton.dart';
import 'package:todoapp/widget/Fields/custom_textfield.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController namecontroler = TextEditingController();
  TextEditingController emailcontroler = TextEditingController();
  TextEditingController paswordcontroler = TextEditingController();
  TextEditingController confirmpaswordcontroler = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool isloading = false;

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
            Form(
              key: _formKey,
              child: Column(
                spacing: 26.h,
                children: [
                  CustomTextfield(
                    controller: namecontroler,
                    color: Appcolors.Colorweight,
                    labeltext: 'Enter your Full name',
                    inputType: TextInputType.text,
                    obscuretext: false,
                    validator: (value) {
                      if (value == '' || value == null) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                  ),
                  CustomTextfield(
                    controller: emailcontroler,
                    color: Appcolors.Colorweight,
                    labeltext: 'Enter your EmailAdres',
                    inputType: TextInputType.emailAddress,
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
                  CustomTextfield(
                    controller: confirmpaswordcontroler,
                    color: Appcolors.Colorweight,
                    labeltext: 'Enter your confirmpasword',
                    inputType: TextInputType.visiblePassword,
                    obscuretext: true,
                    showSuffixIcon: true,
                    validator: (value) {
                      if (value == '' || value == null) {
                        return 'Please enter your ConfirmPasword';
                      } else if (value != paswordcontroler.text) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 98.h,
                  ),
                  Custombuton(
                    width: 220.w,
                    height: 44.h,
                    backgroundColor: Appcolors.Colorgreen,
                    ontap: () async {
                      if (_formKey.currentState!.validate()) {
                        try {
                          setState(() {
                            isloading = true;
                          });

                          await FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                                  email: emailcontroler.text,
                                  password: paswordcontroler.text);

                          Get.to(() => LoginScreen());
                          ToastUtil.success('Succes');
                          setState(() {
                            isloading = false;
                          });
                        } on FirebaseAuthException catch (e) {
                          ToastUtil.error(e.toString());
                          setState(() {
                            isloading = false;
                          });
                        }
                      }
                    },
                    title: 'Sign up ',
                    isLoading: isloading,
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
              ),
            )
          ],
        ),
      ),
    );
  }
}
