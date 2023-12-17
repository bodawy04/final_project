import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../model/my_cache.dart';

class EmailEdit extends StatelessWidget {
  var email = TextEditingController(text: MyCache.getString(key: "email"));

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
                  data: {"email": email.text},
                );
                if (resp.statusCode == 200) {
                  Navigator.of(context).pop();
                  MyCache.setString(key: "email", value: email.text);
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
          SizedBox(
            height: 20.h,
          ),
          Text(
            "Main e-mail address",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 10.h,
          ),
          TextField(
            controller: email,
            decoration: InputDecoration(
              hintStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500),
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
