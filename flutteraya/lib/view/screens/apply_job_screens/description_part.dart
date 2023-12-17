import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutteraya/model/job_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DescriptionPart extends StatelessWidget {

  late String desc;
  late String skill;

  DescriptionPart({required this.desc,required this.skill}){
    this.desc=desc;
    this.skill=skill;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: ListView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    "Job Description",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    desc,
                    style: TextStyle(
                        color: Color(0xff4B5563), fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    "Skill Required",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    """${skill}""",
                    style: TextStyle(
                        color: Color(0xff4B5563), fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 60.h,
                  )
                ],
              )
            ]));
  }
}
