import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutteraya/view/widgets/customed_textformfield.dart';

import '../../../model/my_cache.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {

  var password = TextEditingController(text: MyCache.getString(key: "password"));

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
      floatingActionButton: SizedBox(
          width: MediaQuery.of(context).size.width - 40.w,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                padding: EdgeInsets.symmetric(vertical: 12.h)),
            onPressed: () async {
              Dio dio = Dio();
              try {
                dynamic resp = await dio.post(
                  "https://project2.amit-learning.com/api/auth/user/update",
                  options: Options(headers: {
                    "Authorization": "Bearer ${MyCache.getString(key: "token")}"
                  }),
                  data: {"password": password.text},
                );
                if (resp.statusCode == 200) {
                  Navigator.of(context).pop();
                } else {
                  print("Error: ${resp.data}");
                }
              } catch (e) {
                // Handle exceptions here
                print("An error occurred: $e");
              }
            },
            child: Text("Save"),
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

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
