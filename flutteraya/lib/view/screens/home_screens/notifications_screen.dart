import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutteraya/view/widgets/customed_expanded_container.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            "Notifications",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(height: 10.h,),
              CustomedExpandedContainer("New"),
              ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ListTile(
                            leading: FaIcon(
                              FontAwesomeIcons.facebook,
                              color: Colors.blue,
                              size: 40.sp,
                            ),
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Facebook",
                                  style: TextStyle(
                                      fontSize: 18.sp,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "•",
                                      style: TextStyle(
                                          color: Colors.yellow,
                                          fontSize: 30.sp,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text("10:00 AM")
                                  ],
                                ),
                              ],
                            ),
                            subtitle: Text(
                              "Posted new design jobs",
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      ),
                  separatorBuilder: (context, i) {
                    return Divider(
                      thickness: 2,
                    );
                  },
                  itemCount: 4),
              SizedBox(height: 10.h,),
              CustomedExpandedContainer("Yesterday"),

              ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ListTile(
                            leading: Container(
                              padding: EdgeInsets.all(10.sp),
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),color: Color(0xffD6E4FF)),
                              child: FaIcon(
                                FontAwesomeIcons.magnifyingGlass,
                                color: Colors.blue,
                                size: 20.sp,
                              ),
                            ),
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Welcome to Jobsque",
                                  style: TextStyle(
                                      fontSize: 18.sp,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "•",
                                      style: TextStyle(
                                          color: Colors.yellow,
                                          fontSize: 30.sp,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text("10:00 AM")
                                  ],
                                ),
                              ],
                            ),
                            subtitle: Text(
                              index.isEven?
                              "Your email setup was successful with the following details: Your new email is rafifdianganz@gmail.com.":"Hello Rafif Dian Axelingga, thank you for registering Jobsque. Enjoy the various features that....",
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      ),
                  separatorBuilder: (context, i) {
                    return Divider(
                      thickness: 2,
                    );
                  },
                  itemCount: 2),
            ],
          ),
        ),
      ),
    );
  }
}
