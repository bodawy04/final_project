import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "Terms & Conditions",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        children: [
          SizedBox(
            height: 20.h,
          ),
          Text(
            "Lorem ipsum dolor",
            style: TextStyle(
                color: Colors.black,
                fontSize: 18.sp,
                fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at.",
              style: TextStyle(
                  color: Color(0xff6B7280),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400)),
          SizedBox(
            height: 10.h,
          ),
          Text(
            "Lorem ipsum dolor",
            style: TextStyle(
                color: Colors.black,
                fontSize: 18.sp,
                fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
              "Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
              style: TextStyle(
                  color: Color(0xff6B7280),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400)),
          SizedBox(
            height: 10.h,
          ),
          Container(
            padding: EdgeInsets.all(10.sp),
            color: Color(0xffF4F4F5),
            child: Text(
                "Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                style: TextStyle(
                    color: Color(0xff6B7280),
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400)),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at.",
              style: TextStyle(
                  color: Color(0xff6B7280),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400)),
        ],
      ),
    );
  }
}
