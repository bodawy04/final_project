import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutteraya/model/my_cache.dart';
import 'package:flutteraya/view/screens/home_screens/main_page.dart';
import 'package:flutteraya/view/screens/profile_screens/profile.dart';
import 'package:flutteraya/view/widgets/customed_floating_button.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:image_picker/image_picker.dart';
import '../../../model/profile_model.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  File? _selectedImage;
  String? _imagePath;

  // final imagePicker=ImagePicker();

  var name = TextEditingController(text:MyCache.getString(key: "name"));
  var bio = TextEditingController(text:MyCache.getString(key: "bio"));
  var address = TextEditingController(text:MyCache.getString(key: "address"));
  var phoneContr = TextEditingController(text:MyCache.getString(key: "mobile"));

  saveData(String n, String b,String a,String m) async {
    Dio dio = Dio();
    try {
      Response resp = await dio.put(
        "https://project2.amit-learning.com/api/user/profile/edit",
        data: {"name": n, "bio": b,"address":a,"mobile":m,"image":_imagePath??MyCache.getString(key: "image")},
          options: Options(headers: {
            "Authorization": "Bearer ${MyCache.getString(key: "token")}",
          })
      );
      if (resp.statusCode == 200) {
        Profile p1 = Profile.fromJson(resp.data);
        MyCache.setString(key: "name", value: n);
        MyCache.setString(key: "bio", value: b);
        MyCache.setString(key: "address", value: a);
        MyCache.setString(key: "mobile", value: m);
        MyCache.setString(key: "image", value: _imagePath!);
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => MainScreen()));
        } else {
        }
    } on DioException catch(e) {
      // Handle exceptions here
      print("An error occurred: ${e.response!.statusCode}");
    }
  }


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
            onPressed: () {
              saveData(name.text, bio.text, address.text,phoneContr.text);
            },
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
              backgroundImage: _selectedImage==null?FileImage(File(MyCache.getString(key: "image"))):FileImage(_selectedImage!),
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
              onTap: () {_pickImage();},
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
                  TextFormField(
                    controller: name,
                    // initialValue: MyCache.getString(key: "name"),
                    decoration: InputDecoration(
                      // hintText:"Username" ,
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
                  TextFormField(
                    controller: bio,
                    // initialValue: MyCache.getString(key: "bio"),
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
                  TextFormField(
                    controller: address,
                    // initialValue: MyCache.getString(key: "address"),
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
                    controller: phoneContr,
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
  Future _pickImage()async{
    final returnedImage=await ImagePicker().pickImage(source: ImageSource.gallery);
    _imagePath=returnedImage!.path;
    setState(() {
      _selectedImage=File(returnedImage!.path);
    });
  }

}
