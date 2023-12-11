import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class PhoneNumberEdit extends StatefulWidget {
  const PhoneNumberEdit({Key? key}) : super(key: key);

  @override
  _PhoneNumberEditState createState() => _PhoneNumberEditState();
}

class _PhoneNumberEditState extends State<PhoneNumberEdit> {

  bool _switchTile=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "Phone Number",
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
          SizedBox(
            height: 20.h,
          ),
          Text(
            "Enter your old password",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 10.h,
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
            height: 10.h,
          ),
          SwitchListTile(
            value: _switchTile,
            contentPadding: EdgeInsets.all(0),
            onChanged: (val) {
              setState(() {
                _switchTile=!_switchTile;
              });
            },
            title: Text("Use the phone number to reset your password",style: TextStyle(color:Color(0xff6B7280)),),
          )
        ],
      ),
    );
  }
}
