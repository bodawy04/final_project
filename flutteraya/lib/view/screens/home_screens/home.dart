import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutteraya/model/my_cache.dart';
import 'package:flutteraya/model/profile_model.dart';
import 'package:flutteraya/view/screens/home_screens/notifications_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'home_search_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<String> _recents = [
    "Product Manager",
    "Junior UI Designer",
    "Junior UX Designer"
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                    fontSize: 22.sp, fontWeight: FontWeight.w600)),
            subtitle: Text("Create a better future for yourself here",
                style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff6B7280))),
            trailing: InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>NotificationScreen()));
              },
              child: Container(
                padding: EdgeInsets.all(12.sp),
                child: FaIcon(
                  FontAwesomeIcons.bell,
                  color: Colors.black,
                ),
                decoration: BoxDecoration(
                    border:
                    Border.all(color: Color(0xffD1D5DB), width: 1.5),
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
                        border: Border.all(color: Color(0xffD1D5DB),width: 1)),
                    padding: EdgeInsets.all(10.sp),
                    child: Row(
                      children: [Icon(Icons.search), SizedBox(width: 5.w,),Text("Search...",style: TextStyle(fontSize:13.sp,color: Color(0xff9CA3AF)),)],
                    )),
              )),
          SizedBox(
            height: 5.h,
          ),
          ListTile(
            title: Text(
              "Suggested Jobs",
              style:
              TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
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
                    (index) => Container(
                  padding: EdgeInsets.all(10.sp),
                  decoration: BoxDecoration(
                      color: index.isEven
                          ? Color(0xff0929AF)
                          : Colors.black.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ListTile(
                        leading: FaIcon(FontAwesomeIcons.twitter),
                        title: Text(
                          _recents[index],
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 16.sp),
                        ),
                        subtitle: Text("Twitter • United States"),
                        trailing: FaIcon(FontAwesomeIcons.bookmark),
                      ),
                      Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.circular(20),
                                  color: Color.fromRGBO(
                                      255, 255, 255, 0.14)),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20.w, vertical: 8.h),
                              child: Text(
                                "Fulltime",
                                style: TextStyle(color: Colors.white),
                              )),
                          Container(
                              decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.circular(20),
                                  color: Color.fromRGBO(
                                      255, 255, 255, 0.14)),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20.w, vertical: 8.h),
                              child: Text("Remote",
                                  style:
                                  TextStyle(color: Colors.white))),
                          Container(
                              decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.circular(20),
                                  color: Color.fromRGBO(
                                      255, 255, 255, 0.14)),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20.w, vertical: 8.h),
                              child: Text("Design",
                                  style:
                                  TextStyle(color: Colors.white))),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              RichText(
                                text: TextSpan(
                                  style: TextStyle(
                                      fontSize: 28.13.sp,
                                      fontWeight: FontWeight.w600),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: ("\$12K-15K"),
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 18.sp,
                                            color: Colors.white)),
                                    TextSpan(
                                        text: ("/Month"),
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12.sp,
                                            color: Colors.grey)),
                                  ],
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                child: Text("Apply now"),
                                style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    backgroundColor: Color(0xff3366FF),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(50))),
                              ),
                            ]),
                      ),
                    ],
                  ),
                )),
            options: CarouselOptions(
                viewportFraction: 0.82.w,
                enlargeCenterPage: true,
                enableInfiniteScroll: false),
          ),
          SizedBox(
            height: 5.h,
          ),
          ListTile(
            title: Text(
              "Recent Jobs",
              style:
              TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
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
              itemBuilder: (context, index) => Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                      leading: FaIcon(FontAwesomeIcons.discord),
                      title: Text(
                        "Senior UI Designer",
                        style: TextStyle(
                            fontSize: 18.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                      ),
                      subtitle: Text(
                        "Discord • Jakarta, Indonesia",
                        style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.grey,
                            fontWeight: FontWeight.w400),
                      ),
                      trailing: index.isOdd
                          ? FaIcon(FontAwesomeIcons.bookmark)
                          : FaIcon(
                        FontAwesomeIcons.solidBookmark,
                        color: Colors.blue,
                      )),
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
                                  color: Colors.blue,
                                  fontSize: 10.sp))),
                      Container(
                          margin: EdgeInsets.symmetric(horizontal: 5.w),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color(0xffD6E4FF)),
                          padding: EdgeInsets.symmetric(
                              horizontal: 15.w, vertical: 8.h),
                          child: Text("Remote",
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
                        child: Text("Senior",
                            style: TextStyle(
                                fontSize: 10.sp, color: Colors.blue)),
                      ),
                      RichText(
                        text: TextSpan(
                          style: TextStyle(
                              fontSize: 28.sp,
                              fontWeight: FontWeight.w600),
                          children: <TextSpan>[
                            TextSpan(
                                text: ("\$15K"),
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18.sp,
                                    color: Colors.green)),
                            TextSpan(
                                text: ("/Month"),
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12.sp,
                                    color: Colors.grey)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              separatorBuilder: (context, i) {
                return Divider(
                  thickness: 2,
                );
              },
              itemCount: 2)
        ],
      ),
    );
  }
}
