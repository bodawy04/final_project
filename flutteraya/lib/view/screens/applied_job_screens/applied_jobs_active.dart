import 'package:dio/dio.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../model/job_model.dart';
import '../../../model/my_cache.dart';
import '../../widgets/customed_expanded_container.dart';
import 'applied_job_main.dart';

class AppliedJobsActive extends StatefulWidget {
  const AppliedJobsActive({super.key});

  @override
  State<AppliedJobsActive> createState() => _AppliedJobsActiveState();
}

class _AppliedJobsActiveState extends State<AppliedJobsActive> {
  Future<List<JobModel>> getData() async {
    Dio dio = Dio();
    try {
      Response response = await dio.get(
        "https://project2.amit-learning.com/api/jobs",
        options: Options(headers: {
          "Authorization": "Bearer ${MyCache.getString(key: "token")}"
        }),
      );
      List<JobModel> jobList = [];
      // Check if the response status code is 200 (OK)
      if (response.statusCode == 200) {
        // Check if the response contains a "data" key and if "data" is a list
        response.data!['data']
            .forEach((e) => jobList.add(JobModel.fromJson(e)));
        return jobList;
      } else {
        // If the response status code is not 200, handle it accordingly
        print("Unexpected response status code: ${response.statusCode}");
        return [];
      }
    } catch (e) {
      print("Error occurred: $e");
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getData(),
      builder: (context, snapshots) => snapshots.connectionState ==
              ConnectionState.waiting
          ? Center(child: CircularProgressIndicator())
          : ListView(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              children: [
                SizedBox(
                  height: 20.h,
                ),
                CustomedExpandedContainer("${snapshots.data!.length} Jobs"),
                SizedBox(height: 10.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: ListView.separated(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, i) {
                        return InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => AppliedJobMain(
                                      jobModel: snapshots.data![i],
                                    )));
                          },
                          child: Hero(
                            tag: "job${snapshots.data![i].id!}",
                            child: Column(
                              children: [
                                ListTile(
                                  leading: CircleAvatar(
                                    radius: 24.sp,
                                    backgroundImage:
                                        NetworkImage(snapshots.data![i].image!),
                                  ),
                                  title: Text(
                                    snapshots.data![i].name!,
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 18.sp),
                                  ),
                                  subtitle: Text(
                                      "${snapshots.data![i].compName!} • ${snapshots.data![i].location!.substring(0, snapshots.data![i].location!.indexOf(','))}",
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 12.sp)),
                                  trailing: FaIcon(FontAwesomeIcons.bookmark),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 5.w),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                color: Color(0xffD6E4FF)),
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 15.w,
                                                vertical: 8.h),
                                            child: Text(
                                                snapshots.data![i].jobType!,
                                                style: TextStyle(
                                                    fontSize: 10.sp,
                                                    color: Colors.blue))),
                                        Container(
                                          margin: EdgeInsets.only(
                                              left: 5.w, right: 15.w),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: Color(0xffD6E4FF)),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 15.w, vertical: 8.h),
                                          child: Text("Remote",
                                              style: TextStyle(
                                                  fontSize: 10.sp,
                                                  color: Colors.blue)),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      "Posted 2 days ago",
                                      style: TextStyle(
                                          color: Color(0xff374151),
                                          fontSize: 12.sp),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: Color(0xffD1D5DB))),
                                    child: Padding(
                                      padding: EdgeInsets.only(top: 20.h),
                                      child: EasyStepper(
                                        activeStep: 0,
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
                                        defaultStepBorderType:
                                            BorderType.normal,
                                        steps: List.generate(
                                            3,
                                            (index) => EasyStep(
                                                  finishIcon: Icon(Icons.done),
                                                  icon: index == 0
                                                      ? Icon(
                                                          FontAwesomeIcons.one)
                                                      : index == 1
                                                          ? Icon(
                                                              FontAwesomeIcons
                                                                  .two)
                                                          : Icon(
                                                              FontAwesomeIcons
                                                                  .three),
                                                  title: "Data",
                                                )),
                                      ),
                                    ))
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, i) => Divider(
                            thickness: 1,
                            color: Color(0xffE5E7EB),
                            height: 20.h,
                          ),
                      itemCount: snapshots.data!.length!),
                )
              ],
            ),
    );
  }
}
