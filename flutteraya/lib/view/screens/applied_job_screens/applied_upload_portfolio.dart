import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppliedUploadPortfolio extends StatefulWidget {
  const AppliedUploadPortfolio({Key? key}) : super(key: key);

  @override
  _AppliedUploadPortfolioState createState() => _AppliedUploadPortfolioState();
}

class _AppliedUploadPortfolioState extends State<AppliedUploadPortfolio> {
  @override
  Widget build(BuildContext context) {
    return ListView(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        children: [
          SizedBox(
            height: 20.h,
          ),
          Text(
            "Upload Portfolio",
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
            "Upload CV",
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 14.sp),
          ),
          SizedBox(
            height: 10.h,
          ),
          SizedBox(
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
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            "Other file",
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 14.sp),
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
                  borderRadius: BorderRadius.circular(10)),
              padding: EdgeInsets.all(20.sp),
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
                          onPressed: () {},
                          icon: FaIcon(
                            FontAwesomeIcons.arrowUpFromBracket,
                            size: 16.sp,
                          ),
                          label: Text("Add file"))),
                ],
              ),
            ),
          ),
        ]);
  }
}
