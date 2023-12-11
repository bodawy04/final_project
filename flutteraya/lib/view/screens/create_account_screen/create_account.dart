import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutteraya/view/screens/create_account_screen/interests_screen.dart';
import 'package:flutteraya/view/screens/login_screens/login.dart';
import 'package:flutteraya/view/widgets/customed_textformfield.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../model/profile_model.dart';
import '../../widgets/logo.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  Color _borderColor = Color(0xffD1D5DB);
  bool _obs = true;
  bool _obsConst = true;
  bool _rememberMe = false;

  var email = TextEditingController();
  var name = TextEditingController();
  var pass = TextEditingController();

  // Register(String email,String n, String p) async {
  //   Dio dio = Dio();
  //   try {
  //     dynamic resp = await dio.post(
  //       "https://project2.amit-learning.com/api/auth/register",
  //       data: {"email": email, "name":n,"password": p},
  //     );
  //     if (resp.statusCode == 200) {
  //       Profile p = Profile.fromJson(resp.data);
  //       print("Success");
  //       print(p.token!);
  //       print(p.user!.name);
  //       print(p.user!.id);
  //       print(p.user!.email);
  //     } else {
  //       print("Server returned status code: ${resp.statusCode}");
  //       print("Error: ${resp.data}");
  //     }
  //   } catch (e) {
  //     // Handle exceptions here
  //     print("An error occurred: $e");
  //   }
  // }

  Register(String n,String em, String p) async {
    Dio dio = Dio();
    try {
      dynamic resp = await dio.post(
        "https://project2.amit-learning.com/api/auth/register",
        data: {"name": n, "email": em , "password": p},
      );
      if (resp.statusCode == 200) {
        Profile profile = Profile.fromJson(resp.data);
        print("Success");
        print(profile.token!);
        print(profile.user!.name);
        print(profile.user!.id);
        print(profile.user!.email);
      } else {
        print("Server returned status code: ${resp.statusCode}");
        print("Error: ${resp.data}");
      }
    } catch (e) {
      // Handle exceptions here
      print("An error occurred: $e");
    }
  }

  GlobalKey<FormState> _formkey = new GlobalKey<FormState>();

  TextEditingController _passwordController = TextEditingController();

  void _updateBorderColor(Color color) {
    setState(() {
      _borderColor = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
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
        ),
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Stack(
          fit: StackFit.expand,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    "Create Account",
                    style:
                        TextStyle(fontSize: 26.sp, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text("Please create an account to find your dream job",
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff6B7280))),
                  SizedBox(
                    height: 50.h,
                  ),
                  Form(
                    key: _formkey,
                    child: Column(
                      children: [
                        TextFormField(
                            controller: name,
                            decoration: InputDecoration(
                              hintText: "Username",
                              prefixIcon: Icon(
                                FontAwesomeIcons.user,
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
                            )),
                        SizedBox(
                          height: 10.h,
                        ),
                        TextFormField(
                            controller: email,
                            decoration: InputDecoration(
                              hintText: "Email",
                              prefixIcon: Icon(
                                FontAwesomeIcons.envelope,
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
                            )),
                        SizedBox(
                          height: 10.h,
                        ),
                        TextFormField(
                          controller: _passwordController,
                          autovalidateMode: AutovalidateMode.always,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "Password must be at least 8 characters";
                            } else if (val.length < 8 && val.length > 1) {
                              return "Password must be at least 8 characters";
                            } else if (val.length >= 8) {
                              return "Password must be at least 8 characters";
                            }
                          },
                          onChanged: (val) {
                            if (val.length >= 8) {
                              _updateBorderColor(Colors.green);
                            } else if (val.length < 8 && val.length >= 1) {
                              _updateBorderColor(Colors.red);
                            } else {
                              _updateBorderColor(Color(0xffD1D5DB));
                            }
                          },
                          obscureText: _obs,
                          obscuringCharacter: '●',
                          decoration: InputDecoration(
                            hintText: "Password",
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Color(0xffD1D5DB),
                            ),
                            suffixIcon: _obsConst
                                ? IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _obs = !(_obs);
                                      });
                                    },
                                    icon: _obs
                                        ? Icon(Icons.visibility,
                                            color: _borderColor)
                                        : Icon(Icons.visibility_off,
                                            color: _borderColor),
                                  )
                                : null,
                            errorStyle: TextStyle(color: _borderColor),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 2, color: _borderColor),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 2, color: Color(0xffD1D5DB)),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: _borderColor, width: 2),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: _borderColor, width: 2),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 10.h,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("Already have an account? "),
                        InkWell(
                            onTap: () {

                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => Login()));
                            },
                            child: Text(
                              " Login",
                              style: TextStyle(color: Colors.blue),
                            ))
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
                              padding: EdgeInsets.symmetric(vertical: 12.h),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100))),
                          onPressed: () {
                            Register(name.text,email.text, pass.text);
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => Interests()));
                          },
                          child: Text("Create account"),
                        )),
                    SizedBox(
                      height: 15.h,
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          height: 1.h,
                          width: MediaQuery.of(context).size.width-40.w,
                          color: Color(0xffD1D5DB),
                        ),

                        Container(
                          alignment: Alignment.center,
                          child: Text(
                            "Or Sign up With Account",
                            style: TextStyle(
                                color: Color(0xff6B7280),
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w500),
                          ),
                          width: 150.w,
                          color: Colors.white,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 40,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: OutlinedButton.icon(
                              onPressed: () {},
                              style: OutlinedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                  side: BorderSide(color: Colors.red, width: 2)),
                              icon: FaIcon(
                                FontAwesomeIcons.google,
                                color: Colors.red,
                              ),
                              label: Text("Google",
                                  style: TextStyle(color: Colors.red)),
                            ),
                          ),
                          SizedBox(
                            width: 20.w,
                          ),
                          Expanded(
                            child: OutlinedButton.icon(
                              onPressed: () {},
                              style: OutlinedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                  side: BorderSide(color: Colors.blue, width: 2)),
                              icon: FaIcon(FontAwesomeIcons.facebook),
                              label: Text("Facebook"),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        )),
      ),
    );
  }
}
