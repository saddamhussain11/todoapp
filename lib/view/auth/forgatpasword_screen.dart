import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todoapp/constant/appcolors.dart';
import 'package:todoapp/constant/appimages.dart';
import 'package:todoapp/widget/Button/Custom_Container.dart';
import 'package:todoapp/widget/Fields/custom_textfield.dart';

class ForgatpaswordScreen extends StatelessWidget {
  const ForgatpaswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.h),
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        SizedBox(
          height: 172.h,
        ),
        Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Forgat Pasword',
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),
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
              CustomTextfield(
                width: 320.w,
                color: Appcolors.Colorweight,
                labeltext: 'Forgat Pasword',
                inputType: TextInputType.text,
                obscuretext: false,
              ),
              SizedBox(
                height: 45.h,
              ),
              InkWell(
                onTap: () {
                  print('Buton press');
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => AddtodolistScreen()));
                },
                child: CustomContainer(
                  width: 220.w,
                  height: 44.h,
                  backgroundColor: Appcolors.Colorgreen,
                  child: Center(
                      child: Text(
                    'Forgat ',
                    style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                        color: Appcolors.Colorweight),
                  )),
                ),
              ),
            ],
          ),
        ),
      ]),
    ));
  }
}
