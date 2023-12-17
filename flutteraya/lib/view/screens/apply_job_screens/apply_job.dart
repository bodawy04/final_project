import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:flutteraya/model/job_model.dart';
import 'package:flutteraya/model/my_cache.dart';
import 'package:flutteraya/view/screens/apply_job_screens/company_part.dart';
import 'package:flutteraya/view/screens/apply_job_screens/description_part.dart';
import 'package:flutteraya/view/screens/apply_job_screens/people_part.dart';
import 'package:flutteraya/view/screens/home_screens/main_page.dart';
import 'package:flutteraya/view/widgets/customed_togglebar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'apply_job_2.dart';

class ApplyJob extends StatefulWidget {
  late JobModel jobModel;

  ApplyJob({required this.jobModel}) {
    jobModel = jobModel;
    MyCache.setString(key: "jobID", value: jobModel.id!.toString());
    MyCache.setString(key: "jobType", value: jobModel.jobType!);
    MyCache.setString(key: "jobName", value: jobModel.name!);
  }

  @override
  State<ApplyJob> createState() => _ApplyJobState();
}

class _ApplyJobState extends State<ApplyJob> {
  JobModel get j {
    return widget.jobModel;
  }

  List<String> _listTextTabToggle = ["Description", "Company", "People"];
  int _tabTextIndexSelected = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> _partitions = [
      DescriptionPart(
        desc: j.jobDescription!,
        skill: j.jobSkill!,
      ),
      CompanyPart(j.compEmail!,j.compWebsite!,j.aboutComp!),
      PeoplePart()
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "Job Detail",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: FaIcon(
              FontAwesomeIcons.solidBookmark,
              color: Colors.blue,
            ),
            onPressed: () {},
          )
        ],
      ),
      floatingActionButton: SizedBox(
          width: MediaQuery.of(context).size.width - 40.w,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                padding: EdgeInsets.symmetric(vertical: 10.h),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50))),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ApplyJob1()));
            },
            child: Text("Apply now"),
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Hero(
          tag: "job${widget.jobModel.id!}",
          child: ListView(
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            children: [
              Center(
                child: Column(
                  children: [
                    Container(
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(10)),
                        padding: EdgeInsets.all(14.sp),
                        margin: EdgeInsets.only(top: 20.h),
                        child: FaIcon(
                          FontAwesomeIcons.twitter,
                          color: Colors.white,
                          size: 30.sp,
                        )),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      widget.jobModel!.name!,
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18.sp,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      "${widget.jobModel!.compName!} • ${widget.jobModel.location!.substring(0, widget.jobModel.location!.indexOf(','))}",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12.sp,
                          color: Color(0xff374151)),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                            margin: EdgeInsets.symmetric(horizontal: 5.w),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Color(0xffD6E4FF)),
                            padding: EdgeInsets.symmetric(
                                horizontal: 15.w, vertical: 8.h),
                            child: Text(j.jobTimeType!,
                                style: TextStyle(
                                    color: Colors.blue, fontSize: 10.sp))),
                        Container(
                            margin: EdgeInsets.symmetric(horizontal: 5.w),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Color(0xffD6E4FF)),
                            padding: EdgeInsets.symmetric(
                                horizontal: 15.w, vertical: 8.h),
                            child: Text("Remote",
                                style: TextStyle(
                                    fontSize: 10.sp, color: Colors.blue))),
                        Container(
                          margin: EdgeInsets.only(left: 5.w, right: 15.w),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color(0xffD6E4FF)),
                          padding: EdgeInsets.symmetric(
                              horizontal: 15.w, vertical: 8.h),
                          child: Text(j.jobType!,
                              style: TextStyle(
                                  fontSize: 10.sp, color: Colors.blue)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Color(0xffF4F4F5),
                    borderRadius: BorderRadius.circular(50)),
                height: 50.h,
                child: Row(
                    children: List.generate(
                        _listTextTabToggle.length,
                        (index) => Expanded(
                              child: InkWell(
                                child: Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    _listTextTabToggle[index],
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w500,
                                        color: _tabTextIndexSelected == index
                                            ? Colors.white
                                            : Color(0xff6B7280)),
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: _tabTextIndexSelected == index
                                        ? Color(0xff091A7A)
                                        : Color(0xffF4F4F5),
                                  ),
                                  height: 50.h,
                                ),
                                onTap: () {
                                  setState(() => _tabTextIndexSelected = index);
                                },
                              ),
                            ))),
              ),
              SizedBox(
                height: 10.h,
              ),
              _partitions[_tabTextIndexSelected],
              SizedBox(
                height: 60.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}
