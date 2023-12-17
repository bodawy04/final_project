import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../model/my_cache.dart';
import '../../../model/profile_model.dart';

class AppliedBiodata extends StatelessWidget {
  int activeStep = 0;
  List<String> _stepperTitle = [
    'Biodata',
    "Type of work",
    "Upload portfolio",
  ];

  var name = TextEditingController(text:MyCache.getString(key: "name"));
  var email = TextEditingController(text:MyCache.getString(key: "email"));
  var phoneContr = TextEditingController(text:MyCache.getString(key: "mobile"));

  @override
  Widget build(BuildContext context) {
    return ListView(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        children: [
          Text(
            "BioData",
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 18.sp),
          ),
          SizedBox(
            height: 5.h,
          ),
          Text(
            "Fill in your bio data correctly",
            style: TextStyle(
                color: Color(0xff6B7280),
                fontWeight: FontWeight.w400,
                fontSize: 12.sp),
          ),
          SizedBox(
            height: 20.h,
          ),
          Text(
            "Full Name",
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 14.sp),
          ),
          SizedBox(
            height: 5.h,
          ),
          TextField(
            controller: name,
            onSubmitted: (String v){
              MyCache.setString(key: "applied_name", value: v);
            },
            decoration: InputDecoration(
                hintStyle: TextStyle(color: Colors.black, fontSize: 13.sp),
                prefixIcon: Icon(Icons.person),
                prefixIconColor: Color(0xffD1D5DB),
                iconColor: Colors.black,
                focusedBorder: OutlineInputBorder(
                    borderSide:
                    BorderSide(width: 2, color: Color(0xffD1D5DB)),
                    borderRadius: BorderRadius.circular(10)),
                enabledBorder: OutlineInputBorder(
                    borderSide:
                    BorderSide(width: 2, color: Color(0xffD1D5DB)),
                    borderRadius: BorderRadius.circular(10))),
          ),
          SizedBox(
            height: 15.h,
          ),
          Text(
            "Email",
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 14.sp),
          ),
          SizedBox(
            height: 5.h,
          ),
          TextField(
            controller: email,
            onSubmitted: (String v){
              MyCache.setString(key: "applied_email", value: v);
            },
            decoration: InputDecoration(
                hintStyle: TextStyle(color: Colors.black, fontSize: 13.sp),
                prefixIcon: Icon(Icons.mail_outline_rounded),
                prefixIconColor: Color(0xffD1D5DB),
                iconColor: Colors.black,
                focusedBorder: OutlineInputBorder(
                    borderSide:
                    BorderSide(width: 2, color: Color(0xffD1D5DB)),
                    borderRadius: BorderRadius.circular(10)),
                enabledBorder: OutlineInputBorder(
                    borderSide:
                    BorderSide(width: 2, color: Color(0xffD1D5DB)),
                    borderRadius: BorderRadius.circular(10))),
          ),
          SizedBox(
            height: 15.h,
          ),
          Text(
            "No.Handphone",
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 14.sp),
          ),
          SizedBox(
            height: 5.h,
          ),
          IntlPhoneField(
            controller: phoneContr,
            onSubmitted: (String v){
              MyCache.setString(key: "applied_phone", value: v);
            },
            decoration: InputDecoration(
              counterText: "",
              counter: null,
              contentPadding: EdgeInsets.symmetric(vertical: 16.h),
              hintText: 'Phone Number',
              focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 2, color: Colors.red),
                  borderRadius: BorderRadius.circular(10)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 2, color: Color(0xffD1D5DB)),
                  borderRadius: BorderRadius.circular(10)),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 2, color: Color(0xffD1D5DB)),
                  borderRadius: BorderRadius.circular(10)),
            ),
            initialCountryCode: 'EG',
            dropdownIconPosition: IconPosition.trailing,
          ),
          SizedBox(
            height: 15.h,
          ),
        ]);
  }
}
