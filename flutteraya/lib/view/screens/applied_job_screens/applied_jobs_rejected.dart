import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppliedJobsRejected extends StatefulWidget {
  const AppliedJobsRejected({Key? key}) : super(key: key);

  @override
  _AppliedJobsRejectedState createState() => _AppliedJobsRejectedState();
}

class _AppliedJobsRejectedState extends State<AppliedJobsRejected> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 100.h,),
            Image.asset("images/rejected.png"),
            SizedBox(height:10.h),
            Text(
              "No applications were rejected",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w600),
            ),
            SizedBox(height:10.h),
            Text(
              "If there is an application that is rejected by the company it will appear here",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12.sp,color: Color(0xff6B7280),fontWeight: FontWeight.w400),
            )
          ],
        ),
      ),
    );
  }
}
