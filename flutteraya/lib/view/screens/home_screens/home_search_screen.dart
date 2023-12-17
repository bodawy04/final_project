import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../model/job_model.dart';
import '../../../model/my_cache.dart';
import '../../widgets/customed_expanded_container.dart';

class HomeSearch extends StatefulWidget {
  const HomeSearch({super.key});

  @override
  State<HomeSearch> createState() => _HomeSearchState();
}

////todo Cancel and filtration not implemented

class _HomeSearchState extends State<HomeSearch> {

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


  TextEditingController _txtContr = TextEditingController();
  String _search = "";
  String _dropdown1 = "Remote";
  String _dropdown2 = "Fulltime";
  String _dropdown3 = "Post Date";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: TextField(
            controller: _txtContr,
            onChanged: (s) {
              setState(() {
                _search = s;
                print(_search);
              });
            },
            decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 15.w),
                hintText: "Type something...",
                hintStyle: TextStyle(
                    color: Color(0xff9CA3AF),
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                suffixIcon: InkWell(
                  child: Icon(
                    Icons.cancel_outlined,
                    color: Colors.black,
                    size: 18.sp,
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide(color: Color(0xffD1D5DB))),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide(color: Color(0xffD1D5DB)))),
          ),
        ),
        body: FutureBuilder(
          future: getData(),
          builder:(context,snapshot)=>snapshot.connectionState==ConnectionState.waiting?Center(child: CircularProgressIndicator(),): SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: BouncingScrollPhysics(),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 10.h,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.sp),
                          child: IconButton(
                              onPressed: () {
                                showModalBottomSheet(
                                    isScrollControlled: true,
                                    context: context,
                                    builder: (context) {
                                      return BottomSheet(context, _search);
                                    });
                              },
                              icon: FaIcon(
                                FontAwesomeIcons.sliders,
                                size: 26.sp,
                              )),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 5.w),
                          decoration: BoxDecoration(
                              color: Color(0xff091A7A),
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(color: Color(0xffD1D5DB))),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15.w, vertical: 1.h),
                              items: [
                                DropdownMenuItem(
                                  child: Text("Remote   "),
                                  value: "Remote",
                                ),
                                DropdownMenuItem(
                                  child: Text("Onsite   "),
                                  value: "Onsite",
                                ),
                                DropdownMenuItem(
                                  child: Text("Hybrid   "),
                                  value: "Hybrid",
                                )
                              ],
                              value: _dropdown1,
                              onChanged: (String? value) {
                                setState(() {
                                  _dropdown1 = value!;
                                });
                              },
                              icon: FaIcon(
                                FontAwesomeIcons.chevronDown,
                                color: Colors.white,
                              ),
                              iconSize: 16.sp,
                              dropdownColor: Color(0xff091A7A),
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 5.w),
                          decoration: BoxDecoration(
                              color: Color(0xff091A7A),
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(color: Color(0xffD1D5DB))),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15.w, vertical: 1.h),
                              items: [
                                DropdownMenuItem(
                                  child: Text("Fulltime   "),
                                  value: "Fulltime",
                                ),
                                DropdownMenuItem(
                                  child: Text("Parttime   "),
                                  value: "Parttime",
                                )
                              ],
                              value: _dropdown2,
                              onChanged: (String? value) {
                                setState(() {
                                  _dropdown2 = value!;
                                });
                              },
                              icon: FaIcon(
                                FontAwesomeIcons.chevronDown,
                                color: Colors.white,
                              ),
                              iconSize: 16.sp,
                              dropdownColor: Color(0xff091A7A),
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 5.w),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(color: Color(0xffD1D5DB))),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15.w, vertical: 1.h),
                              items: [
                                DropdownMenuItem(
                                  child: Text("Post Date   "),
                                  value: "Post Date",
                                ),
                              ],
                              value: _dropdown3,
                              onChanged: (String? value) {
                                setState(() {
                                  _dropdown3 = value!;
                                });
                              },
                              icon: FaIcon(
                                FontAwesomeIcons.chevronDown,
                                color: Colors.grey,
                              ),
                              iconSize: 16.sp,
                              dropdownColor: Color(0xff091A7A),
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ),
                      ]),
                ),
                SizedBox(
                  height: 10.h,
                ),
                FutureBuilder(
                  future: getData(),
                  builder: (context, snapshot) => snapshot.connectionState ==
                          ConnectionState.waiting
                      ? Center(
                          child: Column(
                            children: [
                              CircularProgressIndicator(),
                              SizedBox(
                                height: 10.h,
                              ),
                              Text("Osbor shywa")
                            ],
                          ),
                        )
                      : _search.isEmpty
                          ? SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              physics: BouncingScrollPhysics(),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  CustomedExpandedContainer("Recent searches"),
                                  ListView.builder(
                                      physics: NeverScrollableScrollPhysics(),
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 10.w),
                                      shrinkWrap: true,
                                      itemCount: snapshot.data!.length,
                                      itemBuilder: (context, i) {
                                        return ListTile(
                                          title:
                                              Text(snapshot.data![i].name!),
                                          leading: Icon(
                                            Icons.watch_later_outlined,
                                            color: Colors.black,
                                          ),
                                          trailing: IconButton(
                                            icon: Icon(
                                              Icons.cancel_outlined,
                                              color: Colors.red,
                                            ),
                                            onPressed: () {
                                              snapshot.data!.removeAt(i);
                                            },
                                          ),
                                        );
                                      }),
                                  CustomedExpandedContainer("Popular searches"),
                                  ListView.builder(
                                      physics: NeverScrollableScrollPhysics(),
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 10.w),
                                      shrinkWrap: true,
                                      itemCount: snapshot.data!.length,
                                      itemBuilder: (context, i) {
                                        return ListTile(
                                          title:
                                              Text(snapshot.data![i].name!),
                                          leading: FaIcon(
                                            FontAwesomeIcons.magnifyingGlass,
                                            color: Colors.black,
                                          ),
                                          trailing: Icon(
                                            Icons.arrow_circle_right_outlined,
                                            color: Colors.blue,
                                          ),
                                        );
                                      }),
                                ],
                              ),
                            )
                          : Column(
                              children: [
                                ListView.separated(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: snapshot.data!.length,
                                    itemBuilder: (context, index) {
                                      if (snapshot.data![index].name!
                                              .toLowerCase().startsWith(
                                          _txtContr.text))
                                        return Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            CustomedExpandedContainer(
                                                "Featuring ${snapshot.data!.length} jobs"),
                                            SizedBox(height: 10.h,),
                                            ListTile(
                                                leading: FaIcon(
                                                    FontAwesomeIcons.discord),
                                                title: Text(
                                                  snapshot
                                                      .data![index].name!,
                                                  style: TextStyle(
                                                      fontSize: 18.sp,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                                subtitle: Text(
                                                  "${snapshot.data![index].compName!} • ${snapshot.data![index].location!}",
                                                  style: TextStyle(
                                                      fontSize: 12.sp,
                                                      color: Colors.grey,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                                trailing: index.isOdd
                                                    ? FaIcon(
                                                        FontAwesomeIcons.bookmark)
                                                    : FaIcon(
                                                        FontAwesomeIcons
                                                            .solidBookmark,
                                                        color: Colors.blue,
                                                      )),
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 10.w),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                // mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Row(children: [
                                                    Container(
                                                        margin:
                                                            EdgeInsets.symmetric(
                                                                horizontal: 5.w),
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(20),
                                                            color: Color(
                                                                0xffD6E4FF)),
                                                        padding:
                                                            EdgeInsets.symmetric(
                                                                horizontal: 15.w,
                                                                vertical: 8.h),
                                                        child: Text("Fulltime",
                                                            style: TextStyle(
                                                                color:
                                                                    Colors.blue,
                                                                fontSize:
                                                                    10.sp))),
                                                    Container(
                                                        margin:
                                                            EdgeInsets.symmetric(
                                                                horizontal: 5.w),
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(20),
                                                            color: Color(
                                                                0xffD6E4FF)),
                                                        padding:
                                                            EdgeInsets.symmetric(
                                                                horizontal: 15.w,
                                                                vertical: 8.h),
                                                        child: Text("Remote",
                                                            style: TextStyle(
                                                                fontSize: 10.sp,
                                                                color: Colors
                                                                    .blue))),
                                                  ]),
                                                  RichText(
                                                    text: TextSpan(
                                                      style: TextStyle(
                                                          fontSize: 28.sp,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                      children: <TextSpan>[
                                                        TextSpan(
                                                            text: index.isEven
                                                                ? "\$15K"
                                                                : "\$8K",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontSize: 18.sp,
                                                                color: Colors
                                                                    .green)),
                                                        TextSpan(
                                                            text: ("/Month"),
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontSize: 12.sp,
                                                                color:
                                                                    Colors.grey)),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        );
                                    },
                                    separatorBuilder: (context, i) {
                                      return Divider(
                                        thickness: 2,
                                      );
                                    },
                                )],
                            ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget BottomSheet(context, t) {
  return SingleChildScrollView(
    scrollDirection: Axis.vertical,
    child: Padding(
      padding: EdgeInsets.only(
          left: 15.sp,
          right: 15.sp,
          bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back),
                color: Colors.black,
                onPressed: () => Navigator.pop(context),
              ),
              Text(
                "Set filters",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 14.sp),
              ),
              InkWell(
                onTap: () {},
                child: Text(
                  'Reset',
                  style: TextStyle(color: Colors.blue),
                ),
              )
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Text("Job Title",
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600)),
          SizedBox(
            height: 10.h,
          ),
          TextField(
            decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 15.w),
                hintText: t,
                hintStyle: TextStyle(
                    color: Color(0xff9CA3AF),
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400),
                prefixIcon: Icon(
                  Icons.work,
                  color: Colors.black,
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Color(0xffD1D5DB))),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide(color: Color(0xffD1D5DB)))),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            "Location",
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 10.h,
          ),
          TextField(
            decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 15.w),
                hintText: "Jakarta, Indonesia",
                hintStyle: TextStyle(
                    color: Color(0xff9CA3AF),
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400),
                prefixIcon: Icon(
                  Icons.location_pin,
                  color: Colors.black,
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Color(0xffD1D5DB))),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide(color: Color(0xffD1D5DB)))),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            "Salary",
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 10.h,
          ),
          DropdownButtonHideUnderline(
            child: DropdownMenu(
              inputDecorationTheme: InputDecorationTheme(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(width: 5, color: Colors.grey))),
              width: MediaQuery.of(context).size.width - 20.w,
              leadingIcon: Icon(Icons.monetization_on),
              hintText: "\$5K-\$10K",
              dropdownMenuEntries: [
                DropdownMenuEntry(
                  label: "\$5K-\$10K",
                  value: "\$5K-\$10K",
                ),
                DropdownMenuEntry(
                  label: "\$10K-\$15K",
                  value: "\$10K-\$15K",
                ),
                DropdownMenuEntry(
                  label: "\$15K-\$20K",
                  value: "\$15K-\$20K",
                ),
              ],
            ),
          ),
          SizedBox(
            height: 50.h,
          ),
          SizedBox(
              width: MediaQuery.of(context).size.width - 10,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  onPressed: () {},
                  child: Text("Show Results")))
        ],
      ),
    ),
  );
}
