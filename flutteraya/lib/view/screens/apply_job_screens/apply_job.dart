import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:flutteraya/view/screens/apply_job_screens/company_part.dart';
import 'package:flutteraya/view/screens/apply_job_screens/description_part.dart';
import 'package:flutteraya/view/screens/apply_job_screens/people_part.dart';
import 'package:flutteraya/view/widgets/customed_togglebar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ApplyJob extends StatefulWidget {
  const ApplyJob({super.key});

  @override
  State<ApplyJob> createState() => _ApplyJobState();
}

class _ApplyJobState extends State<ApplyJob> {
  List<String> _listTextTabToggle = ["Description", "Company", "People"];
  int _tabTextIndexSelected = 0;

  List<Widget> _partitions = [DescriptionPart(),CompanyPart(),PeoplePart()];

  @override
  Widget build(BuildContext context) {
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
            onPressed: () {},
            child: Text("Apply now"),
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: ListView(
          shrinkWrap: true,
          physics:BouncingScrollPhysics(),
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
                    "Senior UI Designer",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18.sp,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    "Twitter • Jakarta, Indonesia ",
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
                          child: Text("Fulltime",
                              style: TextStyle(
                                  color: Colors.blue, fontSize: 10.sp))),
                      Container(
                          margin: EdgeInsets.symmetric(horizontal: 5.w),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color(0xffD6E4FF)),
                          padding: EdgeInsets.symmetric(
                              horizontal: 15.w, vertical: 8.h),
                          child: Text("Onsite",
                              style: TextStyle(
                                  fontSize: 10.sp, color: Colors.blue))),
                      Container(
                        margin: EdgeInsets.only(left: 5.w, right: 15.w),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color(0xffD6E4FF)),
                        padding: EdgeInsets.symmetric(
                            horizontal: 15.w, vertical: 8.h),
                        child: Text("Senior",
                            style:
                                TextStyle(fontSize: 10.sp, color: Colors.blue)),
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
              child: Row(children:
              List.generate(_listTextTabToggle.length, (index) => Expanded(
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
              ))
                // Expanded(
                //   child: InkWell(
                //     child: Container(
                //       alignment: Alignment.center,
                //       child: Text(
                //         "Active",
                //         style: TextStyle(
                //             fontSize: 14.sp,
                //             fontWeight: FontWeight.w500,
                //             color: _tabTextIndexSelected == 0
                //                 ? Colors.white
                //                 : Color(0xff6B7280)),
                //       ),
                //       decoration: BoxDecoration(
                //         borderRadius: BorderRadius.circular(50),
                //         color: _tabTextIndexSelected == 0
                //             ? Color(0xff091A7A)
                //             : Color(0xffF4F4F5),
                //       ),
                //       height: 50.h,
                //     ),
                //     onTap: () {
                //       setState(() => _tabTextIndexSelected = 0);
                //     },
                //   ),
                // ),
                // Expanded(
                //   child: InkWell(
                //     child: Container(
                //       alignment: Alignment.center,
                //       child: Text(
                //         "Rejected",
                //         style: TextStyle(
                //             color: _tabTextIndexSelected == 1
                //                 ? Colors.white
                //                 : Color(0xff6B7280)),
                //       ),
                //       decoration: BoxDecoration(
                //         borderRadius: BorderRadius.circular(50),
                //         color: _tabTextIndexSelected == 1
                //             ? Color(0xff091A7A)
                //             : Color(0xffF4F4F5),
                //       ),
                //       height: 50.h,
                //     ),
                //     onTap: () {
                //       setState(() => _tabTextIndexSelected = 1);
                //     },
                //   ),
                // )
              ),
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
    );
  }
}
