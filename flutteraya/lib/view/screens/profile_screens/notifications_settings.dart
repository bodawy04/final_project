import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutteraya/view/widgets/customed_expanded_container.dart';

class NotificationSettings extends StatefulWidget {
  const NotificationSettings({super.key});

  @override
  State<NotificationSettings> createState() => _NotificationSettingsState();
}

class _NotificationSettingsState extends State<NotificationSettings> {
  List<String> _jobNoti = [
    "Your Job Search Alert",
    "Job Application Update",
    "Job Application Reminders",
    "Jobs You May Be Interested In",
    "Job Seeker Updates"
  ];
  List<String> _otherNoti = [
    "Show Profile","All Message","Message Nudges"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "Notifications",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          CustomedExpandedContainer("Job Notification"),
          SizedBox(
            height: 10.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, i) {
                return SwitchListTile(
                  title: Text(
                    _jobNoti[i],
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 14.sp),
                  ),
                  value: true,
                  onChanged: (bool value) {},
                );
              },
              itemCount: 5,
              separatorBuilder: (context, index) => Divider(
                color: Colors.grey,
                indent: 12.w,
                endIndent: 20.w,
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          CustomedExpandedContainer("Other Notification"),
          SizedBox(
            height: 10.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, i) {
                return SwitchListTile(
                  title: Text(
                    _otherNoti[i],
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 14.sp),
                  ),
                  value: true,
                  onChanged: (bool value) {},
                );
              },
              itemCount: 3,
              separatorBuilder: (context, index) => Divider(
                color: Colors.grey,
                indent: 12.w,
                endIndent: 20.w,
              ),
            ),
          )
        ],
      ),
    );
  }
}
