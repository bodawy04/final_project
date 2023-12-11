import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutteraya/view/widgets/customed_textformfield.dart';
import 'package:flutteraya/view/widgets/logo.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ForgetPass extends StatefulWidget {
  const ForgetPass({super.key});

  @override
  State<ForgetPass> createState() => _ForgetPassState();
}

class _ForgetPassState extends State<ForgetPass> {
  //ToDo : khalaso

  bool _requested = false;
  bool _verified = false;
  bool _showAppBar = true;
  bool _reset = false;
  bool _obs = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.white,
            appBar: _showAppBar
                ? AppBar(
                    iconTheme: IconThemeData(
                      color: Colors.black,
                    ),
                    actions: [
                      Logo(
                        20,
                        mrg: 20.w,
                      )
                    ],
                    backgroundColor: Colors.white,
                    elevation: 0,
                  )
                : null,
            body: !_requested
                ? Stack(
                    fit: StackFit.expand,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 40.h,
                            ),
                            Text(
                              "Reset Password",
                              style: TextStyle(
                                  fontSize: 28.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff111827)),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Text(
                              "Enter the email address you used when you joined and we’ll send you instructions to reset your password.",
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff6B7280)),
                            ),
                            SizedBox(
                              height: 30.h,
                            ),
                            CustomedTextField(
                                "Enter your email", FontAwesomeIcons.envelope)
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: 10.h,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.sp),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "You remember your password ",
                                    style: TextStyle(
                                        color: Color(0xff9CA3AF),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12.sp),
                                  ),
                                  InkWell(
                                    child: Text(
                                      " Login",
                                      style:
                                          TextStyle(color: Colors.blueAccent),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              SizedBox(
                                  width: MediaQuery.of(context).size.width - 40,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Color(0xFF3366FF),
                                        padding: EdgeInsets.symmetric(
                                            vertical: 12.h),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(100))),
                                    onPressed: () {
                                      setState(() {
                                        _requested = true;
                                        _showAppBar = false;
                                      });
                                    },
                                    child: Text(
                                      "Request password reset",
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                : !_verified
                    ? Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            SizedBox(),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.asset("images/logo12.png"),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Text(
                                  "Check your Email",
                                  style: TextStyle(
                                      color: Color(0xff111827),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 22.sp),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Text(
                                  "We have sent a reset password to your email address",
                                  style: TextStyle(
                                    color: Color(0xff6B7280),
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  textAlign: TextAlign.center,
                                )
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: 10.h),
                              child: SizedBox(
                                  width: MediaQuery.of(context).size.width - 40,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Color(0xFF3366FF),
                                        padding: EdgeInsets.symmetric(
                                            vertical: 12.h),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(100))),
                                    onPressed: () {
                                      setState(() {
                                        _verified = true;
                                        _showAppBar = true;
                                      });
                                    },
                                    child: Text(
                                      "Open email app",
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  )),
                            ),
                          ],
                        ),
                      )
                    : !_reset
                        ? Stack(
                            fit: StackFit.expand,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 40.h,
                                    ),
                                    Text(
                                      "Create new password",
                                      style: TextStyle(
                                          fontSize: 28.sp,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xff111827)),
                                    ),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    Text(
                                      "Set your new password so you can login and acces Jobsque",
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xff6B7280)),
                                    ),
                                    SizedBox(
                                      height: 30.h,
                                    ),
                                    CustomedTextField(
                                      "Password",
                                      FontAwesomeIcons.lock,
                                      obs: true,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 10.h, bottom: 20.h),
                                      child: Text(
                                        "Password must be at least 8 characters",
                                        style: TextStyle(
                                            color: Color(0xff9CA3AF),
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14.sp),
                                      ),
                                    ),
                                    CustomedTextField(
                                      "Confirm password",
                                      FontAwesomeIcons.lock,
                                      obs: true,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 10.h, bottom: 20.h),
                                      child: Text(
                                        "Both passwords must match",
                                        style: TextStyle(
                                            color: Color(0xff9CA3AF),
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14.sp),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                bottom: 10.h,
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.w),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width -
                                              40,
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    Color(0xFF3366FF),
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 12.h),
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            100))),
                                            onPressed: () {
                                              setState(() {
                                                _reset = true;
                                              });
                                            },
                                            child: Text(
                                              "Open email app",
                                              style: TextStyle(
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          )),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )
                        : Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                SizedBox(),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Image.asset("images/logo13.png"),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    Text(
                                      "Password changed succesfully!",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Color(0xff111827),
                                          fontWeight: FontWeight.w600,
                                          fontSize: 22.sp),
                                    ),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    Text(
                                      "Your password has been changed successfully, we will let you know if there are more problems with your account",
                                      style: TextStyle(
                                        color: Color(0xff6B7280),
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      textAlign: TextAlign.center,
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10.h),
                                  child: SizedBox(
                                      width: MediaQuery.of(context).size.width -
                                          40,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: Color(0xFF3366FF),
                                            padding: EdgeInsets.symmetric(
                                                vertical: 12.h),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        100))),
                                        onPressed: () {},
                                        child: Text(
                                          "Open email app",
                                          style: TextStyle(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      )),
                                ),
                              ],
                            ),
                          )));
  }
}
