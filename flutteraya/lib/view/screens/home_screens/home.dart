import 'package:carousel_slider/carousel_slider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutteraya/model/job_model.dart';
import 'package:flutteraya/model/my_cache.dart';
import 'package:flutteraya/model/profile_model.dart';
import 'package:flutteraya/view/screens/apply_job_screens/apply_job.dart';
import 'package:flutteraya/view/screens/home_screens/notifications_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../../controller/saving_icon.dart';
import 'home_search_screen.dart';

class Home extends StatelessWidget {
  List<String> _recents = [
    "Product Manager",
    "Junior UI Designer",
    "Junior UX Designer"
  ];

  late int _jobsLength = 3;

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
        _jobsLength = jobList.length;
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
    List<bool> _jobSaved = List.generate(_jobsLength, (index) => false);
    return FutureBuilder(
      future: getData(),
      builder: (context, snapshot) {
        return snapshot.connectionState == ConnectionState.waiting
            ? Center(
                child: CircularProgressIndicator(),
              )
            : !snapshot.hasData
                ? Center(
                    child: Text("no data"),
                  )
                : Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: ListView(
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      children: [
                        SizedBox(
                          height: 20.h,
                        ),
                        ListTile(
                          title: Text("Hi,${MyCache.getString(key: "name")}",
                              style: TextStyle(
                                  fontSize: 22.sp,
                                  fontWeight: FontWeight.w600)),
                          subtitle: Text(
                              "Create a better future for yourself here",
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff6B7280))),
                          trailing: InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => NotificationScreen()));
                            },
                            child: Container(
                              padding: EdgeInsets.all(12.sp),
                              child: FaIcon(
                                FontAwesomeIcons.bell,
                                color: Colors.black,
                              ),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Color(0xffD1D5DB), width: 1.5),
                                  borderRadius: BorderRadius.circular(50)),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            child: InkWell(
                              onTap: () {
                                // showSearch(context: context, delegate: HomeSearching());
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => HomeSearch()));
                              },
                              child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      border: Border.all(
                                          color: Color(0xffD1D5DB), width: 1)),
                                  padding: EdgeInsets.all(10.sp),
                                  child: Row(
                                    children: [
                                      Icon(Icons.search),
                                      SizedBox(
                                        width: 5.w,
                                      ),
                                      Text(
                                        "Search...",
                                        style: TextStyle(
                                            fontSize: 13.sp,
                                            color: Color(0xff9CA3AF)),
                                      )
                                    ],
                                  )),
                            )),
                        SizedBox(
                          child:
                          MyCache.getString(key: "chosen_jobType")==" "?null:Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            child: Container(
                              margin: EdgeInsets.only(top: 20.h),
                              child: ListTile(
                                isThreeLine: true,
                                leading: ClipRRect(
                                  child: Image.network(
                                    MyCache.getString(key: "jobImage"),
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                title: Text(MyCache.getString(key: "applied_job")),
                                subtitle: Text("Waiting to be selected by AMIT"),
                                trailing: Container(
                                  child: Text(
                                    "Submitted",
                                    style: TextStyle(
                                        fontSize: 10.sp, color: Color(0xff1939B7)),
                                  ),
                                  decoration: BoxDecoration(
                                      color: Color(0xffADC8FF),
                                      borderRadius: BorderRadius.circular(50)),
                                  padding: EdgeInsets.all(10.sp),
                                ),
                              ),
                              decoration: BoxDecoration(
                                  color: Color(0xffD6E4FF),
                                  borderRadius: BorderRadius.circular(8)),
                              padding: EdgeInsets.symmetric(vertical: 10.h),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        ListTile(
                          title: Text(
                            "Suggested Jobs",
                            style: TextStyle(
                                fontSize: 16.sp, fontWeight: FontWeight.w600),
                          ),
                          trailing: InkWell(
                            child: Text(
                              "View all",
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff3366FF)),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        CarouselSlider(
                          items: List.generate(
                              3,
                              (index) => Hero(
                                    tag: "job${snapshot.data![index].id}",
                                    child: Container(
                                      padding: EdgeInsets.all(10.sp),
                                      decoration: BoxDecoration(
                                          color: index.isEven
                                              ? Color(0xff0929AF)
                                              : Colors.black.withOpacity(0.5),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          ListTile(
                                            leading: ClipRRect(
                                              child: Image.network(
                                                  snapshot.data![index].image!),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            title: Text(
                                              snapshot.data![index].name!,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 16.sp),
                                            ),
                                            subtitle: Text(
                                                "${snapshot.data![index].compName!} • ${snapshot.data![index].location!.substring(0, snapshot.data![index].location!.indexOf(','))}"),
                                            trailing: FaIcon(
                                                FontAwesomeIcons.bookmark),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                      color: Color.fromRGBO(
                                                          255, 255, 255, 0.14)),
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 20.w,
                                                      vertical: 8.h),
                                                  child: Text(
                                                    snapshot.data![index]
                                                        .jobTimeType!,
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  )),
                                              Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                      color: Color.fromRGBO(
                                                          255, 255, 255, 0.14)),
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 20.w,
                                                      vertical: 8.h),
                                                  child: Text("Remote",
                                                      style: TextStyle(
                                                          color:
                                                              Colors.white))),
                                              Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                      color: Color.fromRGBO(
                                                          255, 255, 255, 0.14)),
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 20.w,
                                                      vertical: 8.h),
                                                  child: Text(
                                                      snapshot.data![index]
                                                          .jobType!,
                                                      style: TextStyle(
                                                          color:
                                                              Colors.white))),
                                            ],
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 5.w),
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  RichText(
                                                    text: TextSpan(
                                                      style: TextStyle(
                                                          fontSize: 28.13.sp,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                      children: <TextSpan>[
                                                        TextSpan(
                                                            text:
                                                                ("\$${snapshot.data![index].salary!}"),
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontSize: 18.sp,
                                                                color: Colors
                                                                    .white)),
                                                        TextSpan(
                                                            text: ("/Month"),
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontSize: 12.sp,
                                                                color: Colors
                                                                    .grey)),
                                                      ],
                                                    ),
                                                  ),
                                                  ElevatedButton(
                                                    onPressed: () {
                                                      Navigator.of(context).push(
                                                          MaterialPageRoute(
                                                              builder: (context) => ApplyJob(
                                                                  jobModel: snapshot
                                                                          .data![
                                                                      index])));
                                                    },
                                                    child: Text("Apply now"),
                                                    style: ElevatedButton.styleFrom(
                                                        elevation: 0,
                                                        backgroundColor:
                                                            Color(0xff3366FF),
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        50))),
                                                  ),
                                                ]),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )),
                          options: CarouselOptions(
                              viewportFraction: 0.9.w,
                              enlargeCenterPage: true,
                              enableInfiniteScroll: false),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        ListTile(
                          title: Text(
                            "Recent Jobs",
                            style: TextStyle(
                                fontSize: 16.sp, fontWeight: FontWeight.w600),
                          ),
                          trailing: InkWell(
                            child: Text(
                              "View all",
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff3366FF)),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        ListView.separated(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) =>
                                ChangeNotifierProvider(
                                  create: (context) => SavedJob(),
                                  child: Consumer<SavedJob>(
                                    builder: (context, savedJob, child) =>
                                        Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        ListTile(
                                            leading: ClipRRect(
                                              child: Image.network(
                                                  snapshot.data![index].image!),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            title: Text(
                                              snapshot.data![index].name!,
                                              style: TextStyle(
                                                  fontSize: 18.sp,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            subtitle: Text(
                                              "${snapshot.data![index].compName!} • ${snapshot.data![index].location!.substring(0, snapshot.data![index].location!.indexOf(','))}",
                                              style: TextStyle(
                                                  fontSize: 12.sp,
                                                  color: Colors.grey,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            trailing: InkWell(
                                              onTap: () async {
                                                _jobSaved[index] =
                                                    !_jobSaved[index];
                                                savedJob.changeIcon(
                                                    _jobSaved[index]);
                                                Dio dio = Dio();
                                                try {
                                                  Response response = await dio
                                                      .post(
                                                          "https://project2.amit-learning.com/api/favorites",
                                                          options: Options(
                                                              headers: {
                                                                "Authorization":
                                                                    "Bearer ${MyCache.getString(key: "token")}"
                                                              }),
                                                          data: {
                                                        "job_id": snapshot
                                                            .data![index].id!,
                                                        "like": 2,
                                                        "image": snapshot
                                                            .data![index]
                                                            .image!,
                                                        "location": snapshot
                                                            .data![index]
                                                            .location
                                                      });
                                                  List<JobModel> jobList = [];
                                                  // Check if the response status code is 200 (OK)
                                                  if (response.statusCode ==
                                                      200) {
                                                    // Check if the response contains a "data" key and if "data" is a list
                                                    print("Success");
                                                  } else {
                                                    // If the response status code is not 200, handle it accordingly
                                                    print(
                                                        "Unexpected response status code: ${response.statusCode}");
                                                  }
                                                } catch (e) {
                                                  print("Error occurred: $e");
                                                }
                                              },
                                              child: savedJob.icon,
                                            )),
                                        Row(
                                          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Container(
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 5.w),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    color: Color(0xffD6E4FF)),
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 15.w,
                                                    vertical: 8.h),
                                                child: Text(
                                                    snapshot.data![index]
                                                        .jobTimeType!,
                                                    style: TextStyle(
                                                        color: Colors.blue,
                                                        fontSize: 10.sp))),
                                            Container(
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 5.w),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    color: Color(0xffD6E4FF)),
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 15.w,
                                                    vertical: 8.h),
                                                child: Text("Remote",
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
                                                  horizontal: 15.w,
                                                  vertical: 8.h),
                                              child: Text(
                                                  snapshot
                                                      .data![index].jobType!,
                                                  style: TextStyle(
                                                      fontSize: 10.sp,
                                                      color: Colors.blue)),
                                            ),
                                            Wrap(
                                              children: [
                                                RichText(
                                                  text: TextSpan(
                                                    style: TextStyle(
                                                        fontSize: 28.sp,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                    children: <TextSpan>[
                                                      TextSpan(
                                                          text:
                                                              ("\$${snapshot.data![index].salary!}"),
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontSize: 12.sp,
                                                              color: Colors
                                                                  .green)),
                                                      TextSpan(
                                                          text: ("/Month"),
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontSize: 8.sp,
                                                              color:
                                                                  Colors.grey)),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                            separatorBuilder: (context, i) {
                              return Divider(
                                thickness: 2,
                              );
                            },
                            itemCount: snapshot.data!.length)
                      ],
                    ),
                  );
      },
    );
  }
}
