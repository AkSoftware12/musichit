import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:musichit/utils/app_colors.dart';


Widget customImageButton(
  context, {
  String? title = "Gmail",
  required Function callback,
  EdgeInsets? padding,
  Color? color,
  EdgeInsets? margin,
}) =>
    ElevatedButton(
      onPressed: () => callback(),
      style: TextButton.styleFrom(
        backgroundColor: color ?? primaryColor,
        foregroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        padding: padding,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 15.sp,
              width: 15.sp,
              child: Image.asset('assets/google_logo.png')),
          SizedBox(
            width: 5.sp,
          ),
          Text(
            title ?? 'Gmail',
            style: const TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
