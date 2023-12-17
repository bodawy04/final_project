import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutteraya/model/my_cache.dart';
import 'package:flutteraya/model/profile_model.dart';
import 'package:flutteraya/view/screens/create_account_screen/create_account.dart';
import 'package:flutteraya/view/screens/home_screens/main_page.dart';
import 'package:flutteraya/view/screens/login_screens/forget_password.dart';
import 'package:flutteraya/view/widgets/customed_textformfield.dart';
import 'package:flutteraya/view/widgets/logo.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _obs = true;
  bool _constObs = true;
  bool _rememberMe = false;
  String _passError = "";

  var name = TextEditingController();
  var pass = TextEditingController();

  login(String n, String p) async {
    Dio dio = Dio();
    try {
      dynamic resp = await dio.post(
        "https://project2.amit-learning.com/api/auth/login",
        data: {"email": n, "password": p},
      );
      print(resp.data!);
      if (resp.statusCode == 200) {
        Profile p1 = Profile.fromJson(resp.data);
        MyCache.setString(key: "token", value: p1.token!);
        MyCache.setString(key: "email", value: n);
        MyCache.setString(key: "userID", value: p1.user!.id!.toString());
        MyCache.setString(key: "name", value: p1.user!.name!);
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => MainScreen()));
        } else {
        print("Server returned status code: ${resp.statusCode}");
        print("Error: ${resp.data}");
      }
    } catch (e) {
      // Handle exceptions here
      print("An error occurred: $e");
      setState(() {
        _passError = "Wrong Password!";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white,
          appBar: AppBar(
            actions: [Logo(20, mrg: 20.w)],
            backgroundColor: Colors.white,
            elevation: 0,
          ),
          body: Stack(
            fit: StackFit.expand,
            children: [
              Padding(
                padding: EdgeInsets.all(20.sp),
                child: ListView(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          "Login",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 30.sp),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          "Please login to find your dream job",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16.sp,
                              color: Colors.grey),
                        ),
                        SizedBox(
                          height: 40.h,
                        ),
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
                        SizedBox(height: 10.h),
                        TextFormField(
                            controller: pass,
                            obscureText: _obs,
                            obscuringCharacter: '●',
                            decoration: InputDecoration(
                              hintText: "Password",
                              errorText: _passError,
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _obs = !_obs;
                                  });
                                },
                                icon: _obs
                                    ? FaIcon(FontAwesomeIcons.eye)
                                    : FaIcon(FontAwesomeIcons.eyeSlash),
                              ),
                              prefixIcon: Icon(
                                FontAwesomeIcons.lock,
                                color: Color(0xffD1D5DB),
                              ),
                              suffixIconColor: Color(0xffD1D5DB),
                              iconColor: Colors.black,
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 2, color: Color(0xffD1D5DB)),
                                  borderRadius: BorderRadius.circular(10)),
                              errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 2, color: Color(0xffD1D5DB)),
                                  borderRadius: BorderRadius.circular(10)),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 2, color: Color(0xffD1D5DB)),
                                  borderRadius: BorderRadius.circular(10)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 2, color: Color(0xffD1D5DB)),
                                  borderRadius: BorderRadius.circular(10)),
                            )),
                        SizedBox(height: 3.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Checkbox(
                                  value: _rememberMe,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      _rememberMe = value!;
                                    });
                                  },
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                ),
                                Text("Remember me"),
                              ],
                            ),
                            InkWell(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => ForgetPass()));
                                },
                                child: Text(
                                  "Forgot Password?",
                                  style: TextStyle(color: Colors.blue),
                                ))
                          ],
                        )
                      ],
                    ),
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
                        children: [
                          Text("Don't have an account?"),
                          InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => CreateAccount()));
                              },
                              child: Text(
                                " Register",
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
                              if (pass.text.length < 6) {
                                setState(() {
                                  _passError =
                                      "The password field must be at least 6 characters.";
                                });
                              } else {
                                login(name.text, pass.text);
                              }
                            },
                            child: Text("Login"),
                          )),
                      SizedBox(
                        height: 15.h,
                      ),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            height: 1.h,
                            width: MediaQuery.of(context).size.width - 40.w,
                            color: Color(0xffD1D5DB),
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: Text(
                              "Or Login With Account",
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
                                    side: BorderSide(
                                        color: Colors.red, width: 2)),
                                icon: FaIcon(
                                  FontAwesomeIcons.google,
                                  color: Colors.red,
                                ),
                                label: Text("Google",
                                    style: TextStyle(color: Colors.red)),
                              ),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Expanded(
                              child: OutlinedButton.icon(
                                onPressed: () {},
                                style: OutlinedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8)),
                                    side: BorderSide(
                                        color: Colors.blue, width: 2)),
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
    );
  }
}
