import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutteraya/view/widgets/customed_textformfield.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "Change Password",
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
            "Enter your old password",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 5.h,),
          CustomedTextField("New Password", Icons.lock,obs: true),
          SizedBox(height: 15.h,),
          Text(
            "Enter your new password",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 5.h,),
          CustomedTextField("New Password", Icons.lock,obs: true),
          SizedBox(height: 15.h,),
          Text(
            "Confirm your new password",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 5.h,),
          CustomedTextField("Confirm Password", Icons.lock,obs: true),
          SizedBox(height: 10.h,),
        ],
      ),

    );
  }
}
