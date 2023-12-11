import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HelpCenter extends StatefulWidget {
  const HelpCenter({super.key});

  @override
  State<HelpCenter> createState() => _HelpCenterState();
}

class _HelpCenterState extends State<HelpCenter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "Help Center",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        children: [
          SizedBox(
            height: 20.h,
          ),
          TextField(
            decoration: InputDecoration(
              hintText: "How can we help?",
              prefixIcon: Icon(
                Icons.search,
                color: Colors.black,
              ),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 2, color: Colors.blue),
                  borderRadius: BorderRadius.circular(50)),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 2, color: Color(0xffD1D5DB)),
                  borderRadius: BorderRadius.circular(50)),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount:8,
            itemBuilder:(context,i)=>Padding(
              padding: EdgeInsets.symmetric(vertical: 5.h),
              child: ExpansionTile(
                iconColor:Color(0xff9CA3AF),
                collapsedIconColor:Color(0xff9CA3AF),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8),side: BorderSide(color: Color(0xffD1D5DB),width: 1)),
                collapsedShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8),side: BorderSide(color: Color(0xffD1D5DB),width: 1)),
                childrenPadding: EdgeInsets.fromLTRB(12.w, 0 , 12.w, 12.h),
                title: Text(
                  "Lorem ipsum dolor sit amet",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 14.sp),
                ),
                children: [
                  Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ultricies mi enim, quis vulputate nibh faucibus at. Maecenas est ante, suscipit vel sem non, blandit blandit erat. Praesent pulvinar ante et felis porta vulputate. Curabitur ornare velit nec fringilla finibus. Phasellus mollis pharetra ante, in ullamcorper massa ullamcorper et. Curabitur ac leo sit amet leo interdum mattis vel eu mauris.",              style: TextStyle(
                      color: Color(0xff6B7280),
                      fontWeight: FontWeight.w400,
                      fontSize: 12.sp),)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
