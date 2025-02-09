import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todoapp/constant/appcolors.dart';
import 'package:todoapp/constant/appimages.dart';
import 'package:todoapp/view/user/home_screen.dart';
import 'package:todoapp/widget/Button/Custom_Container.dart';
import 'package:todoapp/widget/Fields/custom_textfield.dart';

class AddtodolistScreen extends StatelessWidget {
  const AddtodolistScreen({super.key});

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
                          'Welcome Onboard!',
                          style: TextStyle(
                              fontSize: 20.sp, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 31.h,
                        ),
                        Image.asset(
                          Appimages.addto,
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        Text(
                          'Add What your want to do later on..',
                          style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w500,
                              color: Appcolors.Colorgreen),
                        ),
                        SizedBox(
                          height: 35.h,
                        ),
                        Column(spacing: 26.h, children: [
                          CustomTextfield(
                            width: 320.w,
                            color: Appcolors.Colorweight,
                            labeltext: 'title',
                            inputType: TextInputType.text,
                            obscuretext: false,
                          ),
                          CustomTextfield(
                            width: 320.w,
                            color: Appcolors.Colorweight,
                            labeltext: 'Description',
                            inputType: TextInputType.text,
                            obscuretext: false,
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomeScreen()));
                            },
                            child: CustomContainer(
                              width: 220.w,
                              height: 44.h,
                              backgroundColor: Appcolors.Colorgreen,
                              child: Center(
                                  child: Text(
                                'Add to list ',
                                style: TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Appcolors.Colorweight),
                              )),
                            ),
                          ),
                        ]),
                      ],
                    ),
                  ),
                ])));
  }
}
