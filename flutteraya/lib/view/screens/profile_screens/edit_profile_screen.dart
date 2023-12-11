import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutteraya/view/screens/home_screens/main_page.dart';
import 'package:flutteraya/view/widgets/customed_floating_button.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "Edit Profile",
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
            onPressed: () {},
            child: Text("Save"),
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 20.h,
            ),
            Center(
                child: CircleAvatar(
              backgroundImage: AssetImage("images/onboarding1.png"),
              radius: 50.sp,
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.black.withOpacity(0.5)),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Icon(Icons.camera_alt_outlined)),
            )),
            SizedBox(
              height: 10.h,
            ),
            InkWell(
              child: Text(
                "Change Photo",
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600),
              ),
              onTap: () {},
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Name",
                    style: TextStyle(color: Color(0xff9CA3AF)),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 2, color: Colors.blue),
                          borderRadius: BorderRadius.circular(10)),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 2, color: Color(0xffD1D5DB)),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Text(
                    "Bio",
                    style: TextStyle(color: Color(0xff9CA3AF)),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 2, color: Colors.blue),
                          borderRadius: BorderRadius.circular(10)),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 2, color: Color(0xffD1D5DB)),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Text(
                    "Address",
                    style: TextStyle(color: Color(0xff9CA3AF)),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 2, color: Colors.blue),
                          borderRadius: BorderRadius.circular(10)),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 2, color: Color(0xffD1D5DB)),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Text(
                    "No. Handphone",
                    style: TextStyle(color: Color(0xff9CA3AF)),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  IntlPhoneField(
                    decoration: InputDecoration(
                      counterText: "",
                      hintText: 'Phone Number',
                      focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 2, color: Colors.red),
                          borderRadius: BorderRadius.circular(10)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 2, color: Color(0xffD1D5DB)),
                          borderRadius: BorderRadius.circular(10)),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 2, color: Color(0xffD1D5DB)),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    initialCountryCode: 'EG',
                    dropdownIconPosition:IconPosition.trailing,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
