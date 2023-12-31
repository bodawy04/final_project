import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../model/job_model.dart';
import '../../../model/my_cache.dart';
import '../../widgets/customed_expanded_container.dart';

class SavedScreen extends StatefulWidget {
  const SavedScreen({super.key});

  @override
  State<SavedScreen> createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
  int _jobsLength = 2;

  Future<List<JobModel>> getData() async {
    Dio dio = Dio();
    try {
      Response response = await dio.get(
        "https://project2.amit-learning.com/api/favorites",
        options: Options(headers: {
          "Authorization": "Bearer ${MyCache.getString(key: "token")}"
        }),
      );
      // print(response.data);
      List<JobModel> jobList = [];
      // Check if the response status code is 200 (OK)
      if (response.statusCode == 200) {
        // Check if the response contains a "data" key and if "data" is a list
        response.data!['data'].forEach((e) {
          // print("================== ${e}");
          jobList.add(JobModel.fromJson(e['jobs']));
        });
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
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            "Saved",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w800),
          ),
          centerTitle: true,
        ),
        body: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) => snapshot.connectionState ==
                  ConnectionState.waiting
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomedExpandedContainer(
                          "${snapshot.data!.length} Job Saved",
                          c: true),
                      SizedBox(
                        height: 10.h,
                      ),
                      ListView.separated(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) => Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  ListTile(
                                      leading: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          child: Image.network(
                                              snapshot.data![index].image!)),
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
                                      trailing: IconButton(
                                        icon: FaIcon(FontAwesomeIcons.ellipsis),
                                        onPressed: () {
                                          showModalBottomSheet(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  20),
                                                          topRight:
                                                              Radius.circular(
                                                                  20))),
                                              // isScrollControlled: true,
                                              context: context,
                                              builder: (context) {
                                                return Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 15.sp,
                                                      right: 15.sp,
                                                      bottom:
                                                          MediaQuery.of(context)
                                                              .viewInsets
                                                              .bottom),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.all(10.sp),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        Container(
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            50),
                                                                border: Border.all(
                                                                    width: 1,
                                                                    color: Color(
                                                                        0xffD1D5DB))),
                                                            child: ListTile(
                                                              leading: Icon(
                                                                  Icons.inbox,
                                                                  color: Colors
                                                                      .black),
                                                              title: Text(
                                                                  "Apply Job",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black)),
                                                              trailing: FaIcon(
                                                                  FontAwesomeIcons
                                                                      .chevronRight),
                                                            )),
                                                        SizedBox(
                                                          height: 10.h,
                                                        ),
                                                        Container(
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            50),
                                                                border: Border.all(
                                                                    width: 1,
                                                                    color: Color(
                                                                        0xffD1D5DB))),
                                                            child: ListTile(
                                                              leading: FaIcon(
                                                                  FontAwesomeIcons
                                                                      .cloudArrowUp,
                                                                  color: Colors
                                                                      .black),
                                                              title: Text(
                                                                "Share Via...",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .black),
                                                              ),
                                                              trailing: FaIcon(
                                                                  FontAwesomeIcons
                                                                      .chevronRight),
                                                            )),
                                                        SizedBox(
                                                          height: 10.h,
                                                        ),
                                                        Container(
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            50),
                                                                border: Border.all(
                                                                    width: 1,
                                                                    color: Color(
                                                                        0xffD1D5DB))),
                                                            child: ListTile(
                                                              leading: FaIcon(
                                                                FontAwesomeIcons
                                                                    .bookmark,
                                                                color: Colors
                                                                    .black,
                                                              ),
                                                              title: Text(
                                                                  "Cancel Save",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black)),
                                                              trailing: FaIcon(
                                                                  FontAwesomeIcons
                                                                      .chevronRight),
                                                            )),
                                                        SizedBox(
                                                          height: 10.h,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              });
                                        },
                                      )),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10.w),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Posted 2 days ago"),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.watch_later_outlined,
                                              size: 14.sp,
                                            ),
                                            Text("  Be an early applicant")
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                          separatorBuilder: (context, i) {
                            return Divider(
                              thickness: 2,
                            );
                          },
                          itemCount: snapshot.data!.length)
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
