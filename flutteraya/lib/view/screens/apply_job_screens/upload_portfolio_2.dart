import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutteraya/view/screens/home_screens/home.dart';
import 'package:flutteraya/view/screens/home_screens/main_page.dart';

class UploadPortfolio2 extends StatefulWidget {
  const UploadPortfolio2({Key? key}) : super(key: key);

  @override
  _UploadPortfolio2State createState() => _UploadPortfolio2State();
}

class _UploadPortfolio2State extends State<UploadPortfolio2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          "Apply Job",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      floatingActionButton: SizedBox(
          width: MediaQuery.of(context).size.width - 40.w,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff2C2CF5),
                padding: EdgeInsets.symmetric(vertical: 10.h),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50))),
            onPressed: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>MainScreen()));
            },
            child: Text("Back to home"),
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset("images/dataIlustration.png"),
              SizedBox(height: 20.h,),
              Text(
                "Your data has been successfully sent",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w600),textAlign: TextAlign.center,
              ),
              SizedBox(height: 10.h,),
              Text(
                "You will get a message from our team, about the announcement of employee acceptance",
                style: TextStyle(
                    color: Color(0xff6B7280),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400),textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
