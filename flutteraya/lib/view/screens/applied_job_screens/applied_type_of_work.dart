import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppliedTypeOfWork extends StatefulWidget {
  const AppliedTypeOfWork({Key? key}) : super(key: key);

  @override
  _AppliedTypeOfWorkState createState() => _AppliedTypeOfWorkState();
}

class _AppliedTypeOfWorkState extends State<AppliedTypeOfWork> {

  List<bool> _radioTiles=[false,false,false,false];

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
            "Type of work",
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
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, i) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 5.h),
                child: RadioListTile(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(color:!_radioTiles[i]?Color(0xffD1D5DB):Colors.blue)),
                    controlAffinity: ListTileControlAffinity.trailing,
                    title: Text(
                      "Senior UX Designer",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500),
                    ),
                    subtitle: Text(
                      "CV.pdf • Portfolio.pdf",
                      style: TextStyle(
                          color: Color(0xff6B7280),
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w400),
                    ),
                    value: _radioTiles[i],
                    groupValue: "radioTiles",
                    onChanged: (val) {
                      setState(() {
                        _radioTiles[i]=!_radioTiles[i];
                      });
                    }),
              );
            },
            itemCount: 4,
          )
        ]);
  }
}
