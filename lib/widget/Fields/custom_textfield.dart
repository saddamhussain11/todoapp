import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todoapp/constant/appcolors.dart';

class CustomTextfield extends StatefulWidget {
  final String labeltext;
  final TextInputType inputType;
  final bool obscuretext;
  final Color color;
  final IconData? iconData;
  final bool showSuffixIcon;
  final Color? borderColor;
  final double? width; // Optional width
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Widget? sufixicon;
  final bool? border;

  const CustomTextfield({
    super.key,
    required this.color,
    required this.labeltext,
    required this.inputType,
    required this.obscuretext,
    this.iconData,
    this.showSuffixIcon = false,
    this.borderColor,
    this.width, // Optional parameter
    this.controller,
    this.validator,
    this.sufixicon,
    this.border,
  });

  @override
  State<CustomTextfield> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  bool isvisible = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 47.h,
      width:
          widget.width ?? double.infinity, // Default full width if not provided
      decoration: BoxDecoration(
        color: widget.color,
        border: widget.border != null
            ? widget.borderColor != null
                ? Border.all(
                    color:
                        widget.borderColor!) // Border only if color is provided
                : null
            : null,
        borderRadius: const BorderRadius.all(Radius.circular(9)),
        boxShadow: [
          BoxShadow(
            offset: Offset(0.0, 0.1.h),
            blurRadius: 1.1.w,
            spreadRadius: -1.w,
          ),
        ],
      ),
      child: TextFormField(
        obscureText: isvisible,
        controller: widget.controller,
        keyboardType: widget.inputType,
        textAlign: TextAlign.start,
        textAlignVertical: TextAlignVertical.center,
        maxLines: null,
        style: TextStyle(
          color: Appcolors.Colorblack,
          fontSize: 16.sp,
        ),
        validator: widget.validator,
        decoration: InputDecoration(
          prefixIcon: widget.iconData != null
              ? Icon(
                  widget.iconData,
                  color: Appcolors.Colorblack,
                  size: 24.sp,
                )
              : null,
          suffixIcon: widget.showSuffixIcon
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      isvisible = !isvisible;
                    });
                  },
                  icon:
                      Icon(isvisible ? Icons.visibility : Icons.visibility_off))
              : widget.sufixicon,
          hintText: widget.labeltext,
          hintStyle: TextStyle(
            color: Appcolors.Colorblack,
            fontSize: 16.sp,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(80),
          ),
        ),
      ),
    );
  }
}
