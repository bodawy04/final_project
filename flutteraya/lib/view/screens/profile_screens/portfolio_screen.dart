import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutteraya/view/screens/profile_screens/profile.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../model/my_cache.dart';
import '../../../model/profile_model.dart';

class PortfolioScreen extends StatelessWidget {

  Future uploadPDF()async{
    FilePickerResult? result=await FilePicker.platform.pickFiles();
      String filename="";
      String path="";
    if(result!=null){
      File file=File(result.files.single.path??" ");
      filename=file.path.split('/').last;
      path=file.path;
      print("filename========== $filename");
      print("path========== $path");
    }
    Dio dio = Dio();
    try {
      dynamic resp = await dio.post(
        "https://project2.amit-learning.com/api/user/profile/portofolios",
        options: Options(headers: {
          "Authorization": "Bearer ${MyCache.getString(key: "token")}",
        }),
        data: {"cv_file": filename},
      );
        print("response = ========= ${resp}");
      if (resp.statusCode == 200) {
        Profile p1 = Profile.fromJson(resp.data);
        MyCache.setString(key: "cv_file", value: filename);
        // Navigator.of(context).pushReplacement(
        //     MaterialPageRoute(builder: (context) => ProfileScreen()));
      } else {
        print("Server returned status code: ${resp.statusCode}");
        print("Error: ${resp.data}");
      }
    } catch (e) {
      // Handle exceptions here
      print("An error occurred: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "Portfolio",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Add portfolio here",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 20.sp),
            ),
            SizedBox(
              height: 10.h,
            ),
            DottedBorder(
              color: Colors.blue,
              borderType: BorderType.RRect,
              radius: Radius.circular(10),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.blue.shade100,
                    borderRadius: BorderRadius.circular(10)),padding: EdgeInsets.all(20.sp),
                width: MediaQuery.of(context).size.width - 20.w,
                child: Column(
                  children: [
                    CircleAvatar(
                        backgroundColor: Color(0xffD6E4FF),
                        child: Icon(
                          Icons.file_open_rounded,
                          color: Colors.blue,
                        )),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      "Upload your other file",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 16.sp),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      "Max. file size 10 MB",
                      style: TextStyle(
                          color: Color(0xff6B7280),
                          fontWeight: FontWeight.w400,
                          fontSize: 10.sp),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(vertical: 5.h),
                                elevation: 0,
                                foregroundColor: Colors.blue,
                                backgroundColor: Color(0xffD6E4FF),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50),
                                    side: BorderSide(color: Colors.blue))),
                            onPressed: () {
                              uploadPDF();
                            },
                            icon: FaIcon(
                              FontAwesomeIcons.arrowUpFromBracket,
                              size: 16.sp,
                            ),
                            label: Text("Add file")))
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, i) {
                return SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 5.h),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Color(0xffD1D5DB))),
                    child: ListTile(
                      leading: Icon(
                        Icons.picture_as_pdf,
                        color: Colors.red,
                        size: 30.sp,
                      ),
                      title: Text(
                        "UI/UX Designer",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w600),
                      ),
                      subtitle: Text(
                        "CV.pdf 300KB",
                        style: TextStyle(
                            color: Color(0xff6B7280),
                            fontWeight: FontWeight.w400,
                            fontSize: 10.sp),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.mode_edit_outline,
                            color: Colors.blue,
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          Icon(
                            Icons.cancel_outlined,
                            color: Colors.red,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              itemCount: 3,
            )
          ],
        ),
      ),
    );
  }

}
