import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmailEdit extends StatefulWidget {
  const EmailEdit({Key? key}) : super(key: key);

  @override
  _EmailEditState createState() => _EmailEditState();
}

class _EmailEditState extends State<EmailEdit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "Email Address",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        physics: BouncingScrollPhysics(),
        children: [
          SizedBox(height: 20.h,),
          Text(
            "Main e-mail address",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 10.h,),
          TextField(
            decoration: InputDecoration(
              hintText: "rafifdian12@gmail.com",
              hintStyle: TextStyle(color: Colors.black,fontSize: 12.sp,fontWeight: FontWeight.w500),
              prefixIcon: Icon(
                Icons.mail,
                color: Color(0xff9CA3AF),
              ),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 2, color: Color(0xffD1D5DB)),
                  borderRadius: BorderRadius.circular(10)),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 2, color: Color(0xffD1D5DB)),
                  borderRadius: BorderRadius.circular(10)),
            ),
          ),

        ],
      ),
    );
  }
}
