import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../model/my_cache.dart';

class TypeOfWork extends StatefulWidget {
  const TypeOfWork({Key? key}) : super(key: key);

  @override
  _TypeOfWorkState createState() => _TypeOfWorkState();
}

class _TypeOfWorkState extends State<TypeOfWork> {

  List<String> _radioTiles=List.generate(1, (index) => "${index+1}");
  String gpVal="";

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
                    activeColor: Colors.blue,
                      tileColor: gpVal==_radioTiles[i]?Colors.blueAccent.withOpacity(0.3):Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(color:gpVal!=_radioTiles[i]?Color(0xffD1D5DB):Colors.blue,width: 2)),
                      controlAffinity: ListTileControlAffinity.trailing,
                      title: Text(
                        MyCache.getString(key: "jobType"),
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500),
                      ),
                      subtitle:
                      MyCache.getString(key: "cv_file")==" "?null:
                      Text(
                      MyCache.getString(key: "cv_file"),
                        style: TextStyle(
                            color: Color(0xff6B7280),
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w400),
                      ),
                      value: _radioTiles[i],
                      groupValue: gpVal,
                      onChanged: (val) {
                        setState(() {
                          // _radioTiles[i]=!_radioTiles[i];
                          gpVal=val.toString();
                          MyCache.setString(key: "chosen_jobType", value: MyCache.getString(key: "jobName"));
                        });
                      }),
                );
              },
              itemCount: 1,
            )
          ]);
  }
}
