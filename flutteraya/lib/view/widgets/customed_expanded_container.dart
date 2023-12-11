import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomedExpandedContainer extends StatelessWidget {
  late String title;
  late bool centered;
  CustomedExpandedContainer(String t,{bool? c}) {
    this.title = t;
    this.centered=c??false;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Container(
        alignment: centered ?Alignment.center:Alignment.centerLeft,
        decoration: BoxDecoration(
            color: Color(0xffF4F4F5),
            border: Border.all(color: Color(0xffE5E7EB),width: 1)
        ),
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
          child: Text(
            title,
            style: TextStyle(
                color: Color(0xff6B7280),
                fontWeight: FontWeight.w500,
                fontSize: 14.sp),
          )),
    );
  }
}
