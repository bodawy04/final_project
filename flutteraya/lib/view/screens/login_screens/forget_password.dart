import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutteraya/view/widgets/customed_textformfield.dart';
import 'package:flutteraya/view/widgets/logo.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../model/my_cache.dart';
import '../../../model/profile_model.dart';
import '../home_screens/main_page.dart';

class ForgetPass extends StatefulWidget {
  const ForgetPass({super.key});

  @override
  State<ForgetPass> createState() => _ForgetPassState();
}

class _ForgetPassState extends State<ForgetPass> {
  bool _requested = false;
  bool _verified = false;
  bool _showAppBar = true;
  bool _reset = false;
  bool _obs = true;

  var email = TextEditingController();
  var password = TextEditingController();

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
                            TextField(
                              controller: email,
                              decoration: InputDecoration(
                                hintText: "Enter your email",
                                prefixIcon: Icon(
                                  Icons.mail_outline_rounded,
                                  color: Color(0xffD1D5DB),
                                ),
                                iconColor: Colors.black,
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 2, color: Color(0xffD1D5DB)),
                                    borderRadius: BorderRadius.circular(10)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 2, color: Color(0xffD1D5DB)),
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                            )
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
                                    onPressed: () async {
                                      setState(() {
                                        _requested = true;
                                        _showAppBar = false;
                                      });
                                      Dio dio = Dio();
                                      try {
                                        dynamic resp = await dio.post(
                                          "https://project2.amit-learning.com/api/auth/user/update",
                                          data: {"email": email.text},
                                        );
                                        if (resp.statusCode == 200) {
                                          Profile p1 =
                                              Profile.fromJson(resp.data);
                                          MyCache.setString(
                                              key: "token", value: p1.token!);
                                          MyCache.setString(
                                              key: "userID",
                                              value: p1.user!.id!.toString());
                                          MyCache.setString(
                                              key: "name",
                                              value: p1.user!.name!);
                                        } else {
                                          print("Error: ${resp.data}");
                                        }
                                      } catch (e) {
                                        // Handle exceptions here
                                        print("An error occurred: $e");
                                      }
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
                                    TextField(
                                      controller: password,
                                      obscureText: _obs!,
                                      obscuringCharacter: '●',
                                      decoration: InputDecoration(
                                        hintText: "Enter your new password",
                                        prefixIcon: Icon(
                                          Icons.lock_outlined,
                                          color: Color(0xffD1D5DB),
                                        ),
                                        suffixIcon: _obs
                                            ? IconButton(
                                                onPressed: () {
                                                  setState(() {
                                                    _obs = !(_obs!);
                                                    _obs
                                                        ? FontAwesomeIcons.eye
                                                        : FontAwesomeIcons
                                                            .eyeSlash;
                                                  });
                                                },
                                                icon:
                                                    Icon(FontAwesomeIcons.eye),
                                              )
                                            : null,
                                        suffixIconColor: Color(0xffD1D5DB),
                                        iconColor: Colors.black,
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                width: 2,
                                                color: Color(0xffD1D5DB)),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                width: 2,
                                                color: Color(0xffD1D5DB)),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                      ),
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
                                    TextField(
                                      obscureText: _obs!,
                                      obscuringCharacter: '●',
                                      decoration: InputDecoration(
                                        hintText: "Confirm password",
                                        prefixIcon: Icon(
                                          Icons.lock_outlined,
                                          color: Color(0xffD1D5DB),
                                        ),
                                        suffixIcon: _obs
                                            ? IconButton(
                                                onPressed: () {
                                                  setState(() {
                                                    _obs = !(_obs!);
                                                    _obs
                                                        ? FontAwesomeIcons.eye
                                                        : FontAwesomeIcons
                                                            .eyeSlash;
                                                  });
                                                },
                                                icon:
                                                    Icon(FontAwesomeIcons.eye),
                                              )
                                            : null,
                                        suffixIconColor: Color(0xffD1D5DB),
                                        iconColor: Colors.black,
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                width: 2,
                                                color: Color(0xffD1D5DB)),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                width: 2,
                                                color: Color(0xffD1D5DB)),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                      ),
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
                                            onPressed: () async {
                                              setState(() {
                                                _reset = true;
                                              });
                                              Dio dio = Dio();
                                              try {
                                                dynamic resp = await dio.post(
                                                  "https://project2.amit-learning.com/api/auth/user/update",
                                                  options: Options(headers: {
                                                    "Authorization": "Bearer ${MyCache.getString(key: "token")}"
                                                  }),
                                                  data: {
                                                    "password": password.text
                                                  },
                                                );
                                                if (resp.statusCode == 200) {
                                                  Navigator.of(context)
                                                      .pushReplacement(
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  MainScreen()));
                                                } else {
                                                  print("Error: ${resp.data}");
                                                }
                                              } catch (e) {
                                                // Handle exceptions here
                                                print("An error occurred: $e");
                                              }
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
                                        onPressed: () {
                                          Navigator.of(context).pushReplacement(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      MainScreen()));
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
                          )));
  }
}
