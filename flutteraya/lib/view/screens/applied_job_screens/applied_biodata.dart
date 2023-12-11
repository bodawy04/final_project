import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class AppliedBiodata extends StatefulWidget {
  const AppliedBiodata({Key? key}) : super(key: key);

  @override
  State<AppliedBiodata> createState() => _AppliedBiodataState();
}

class _AppliedBiodataState extends State<AppliedBiodata> {
  int activeStep = 0;
  List<String> _stepperTitle = [
    'Biodata',
    "Type of work",
    "Upload portfolio",
  ];

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
            decoration: InputDecoration(
                hintText: "Rafif Dian Axelingga",
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
            decoration: InputDecoration(
                hintText: "rafifdian12@gmail.com",
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
