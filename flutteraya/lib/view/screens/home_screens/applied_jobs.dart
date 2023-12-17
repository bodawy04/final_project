import 'dart:io';
import 'package:dio/dio.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:flutteraya/view/screens/applied_job_screens/applied_job_main.dart';
import 'package:flutteraya/view/screens/applied_job_screens/applied_jobs_active.dart';
import 'package:flutteraya/view/screens/applied_job_screens/applied_jobs_rejected.dart';
import 'package:flutteraya/view/widgets/customed_expanded_container.dart';
import 'package:flutteraya/view/widgets/customed_togglebar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../model/job_model.dart';
import '../../../model/my_cache.dart';

class AppliedJobs extends StatefulWidget {
  const AppliedJobs({Key? key}) : super(key: key);

  @override
  _AppliedJobsState createState() => _AppliedJobsState();
}

class _AppliedJobsState extends State<AppliedJobs> {
  int _tabTextIndexSelected = 0;
  late int _jobsLength = 3;

  List<String> _titles = ["Active", "Rejected"];
  List<Widget> _states = [AppliedJobsActive(), AppliedJobsRejected()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Applied Jobs",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w800),
        ),
        centerTitle: true,
      ),
      body: ListView(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              children: [
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color(0xffF4F4F5),
                        borderRadius: BorderRadius.circular(50)),
                    height: 50.h,
                    child: Row(
                        children: List.generate(
                            2,
                            (index) => Expanded(
                                  child: InkWell(
                                    child: Container(
                                      alignment: Alignment.center,
                                      child: Text(
                                        _titles[index],
                                        style: TextStyle(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w500,
                                            color:
                                                _tabTextIndexSelected == index
                                                    ? Colors.white
                                                    : Color(0xff6B7280)),
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(50),
                                        color: _tabTextIndexSelected == index
                                            ? Color(0xff091A7A)
                                            : Color(0xffF4F4F5),
                                      ),
                                      height: 50.h,
                                    ),
                                    onTap: () {
                                      setState(() =>
                                          _tabTextIndexSelected = index);
                                    },
                                  ),
                                ))),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                _states[_tabTextIndexSelected]
              ],
            ),
    );
  }
}
