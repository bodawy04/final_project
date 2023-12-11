import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:flutteraya/view/widgets/customed_expanded_container.dart';
import 'package:flutteraya/view/widgets/customed_togglebar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppliedJobs extends StatefulWidget {
  const AppliedJobs({Key? key}) : super(key: key);

  @override
  _AppliedJobsState createState() => _AppliedJobsState();
}

class _AppliedJobsState extends State<AppliedJobs> {
  int activeStep = 0;
  int _tabTextIndexSelected = 0;
  List<String> _titles = ["Active", "Rejected"];

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
                      _titles.length,
                      (index) => Expanded(
                            child: InkWell(
                              child: Container(
                                alignment: Alignment.center,
                                child: Text(
                                  _titles[index],
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
          ),
          SizedBox(height: 10.h),
          CustomedExpandedContainer("3 Jobs"),
          SizedBox(height: 10.h),
          Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: ListView.separated(
              physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, i) {
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                            radius: 16.sp,
                            backgroundColor: Colors.blue,
                            child: FaIcon(
                              FontAwesomeIcons.discord,
                              size: 16.sp,
                            )),
                        title: Text(
                          "UI/UX Designer",
                          style:
                              TextStyle(color: Colors.black, fontSize: 18.sp),
                        ),
                        subtitle: Text("Spectrum • Jakarta, Indonesia",
                            style:
                                TextStyle(color: Colors.grey, fontSize: 12.sp)),
                        trailing: FaIcon(FontAwesomeIcons.bookmark),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                  margin: EdgeInsets.symmetric(horizontal: 5.w),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Color(0xffD6E4FF)),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 15.w, vertical: 8.h),
                                  child: Text("Fulltime",
                                      style: TextStyle(
                                          fontSize: 10.sp,
                                          color: Colors.blue))),
                              Container(
                                margin: EdgeInsets.only(left: 5.w, right: 15.w),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Color(0xffD6E4FF)),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 15.w, vertical: 8.h),
                                child: Text("Remote",
                                    style: TextStyle(
                                        fontSize: 10.sp, color: Colors.blue)),
                              ),
                            ],
                          ),
                          Text(
                            "Posted 2 days ago",
                            style: TextStyle(
                                color: Color(0xff374151), fontSize: 12.sp),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Color(0xffD1D5DB))),
                          child: Padding(
                            padding: EdgeInsets.only(top: 20.h),
                            child: EasyStepper(
                              activeStep: activeStep,
                              activeStepBackgroundColor: Colors.white,
                              activeStepTextColor: Colors.blue,
                              activeStepIconColor: Colors.blue,
                              finishedStepTextColor: Colors.blue,
                              internalPadding: 30.sp,
                              showLoadingAnimation: false,
                              fitWidth: true,
                              disableScroll: true,
                              stepRadius: 20.sp,
                              showStepBorder: true,
                              borderThickness: 5,
                              stepShape: StepShape.circle,
                              defaultStepBorderType: BorderType.normal,
                              steps: List.generate(
                                  3,
                                  (index) => EasyStep(
                                        finishIcon: Icon(Icons.done),
                                        icon: index == 0
                                            ? Icon(FontAwesomeIcons.one)
                                            : index == 1
                                                ? Icon(FontAwesomeIcons.two)
                                                : Icon(FontAwesomeIcons.three),
                                        title: "Data",
                                      )),
                            ),
                          ))
                    ],
                  );
                },
                separatorBuilder: (context, i) => Divider(
                      thickness: 1,
                      color: Color(0xffE5E7EB),
                  height: 20.h,
                    ),
                itemCount: 3),
          )
        ],
      ),
    );
  }
}
