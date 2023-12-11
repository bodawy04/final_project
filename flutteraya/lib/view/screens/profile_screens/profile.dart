import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutteraya/view/screens/profile_screens/edit_profile_screen.dart';
import 'package:flutteraya/view/screens/profile_screens/help_center.dart';
import 'package:flutteraya/view/screens/profile_screens/language_screen.dart';
import 'package:flutteraya/view/screens/profile_screens/login_and_security.dart';
import 'package:flutteraya/view/screens/profile_screens/notifications_settings.dart';
import 'package:flutteraya/view/screens/profile_screens/portfolio_screen.dart';
import 'package:flutteraya/view/screens/profile_screens/privacy_policy.dart';
import 'package:flutteraya/view/screens/profile_screens/terms_and_conditions.dart';
import 'package:flutteraya/view/widgets/customed_expanded_container.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List<String> _general = [
    "Edit Profile",
    "Portfolio",
    "Language",
    "Notification",
    "Login and security"
  ];
  List<String> _other = [
    "Accessbility",
    "Help Center",
    "Terms & Conditions",
    "Privacy Policy",
  ];
  List<IconData> _generalIcons = [
    Icons.person,
    Icons.drive_folder_upload,
    FontAwesomeIcons.globe,
    Icons.notifications_none_outlined,
    Icons.lock_open_outlined
  ];
  List<Widget> _generalRoutes=[EditProfile(),PortfolioScreen(),LanguageScreen(),NotificationSettings(),LoginandSecurity()];
  List<Widget> _othersRoutes=[HelpCenter(),HelpCenter(),TermsAndConditions(),PrivacyPolicy()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffD6E4FF),
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              iconTheme: IconThemeData(color: Colors.black),
              title: Text(
                "Profile",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
              ),
              centerTitle: true,
              actions: [
                IconButton(
                  icon: Icon(
                    Icons.logout,
                    color: Colors.red,
                  ),
                  onPressed: () {},
                )
              ],
            )
          ],
          body: ListView(
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            children: [
              SizedBox(
                height: 80.h,
              ),
              Container(
                color: Colors.white,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 70.h),
                    SizedBox(
                      height: 10.h,
                      child: Stack(
                        clipBehavior: Clip.none,
                        alignment: Alignment.topCenter,
                        children: [
                          Positioned(
                            bottom: 20.h,
                            child: Container(
                                padding: EdgeInsets.all(10.sp),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(100)),
                                child: CircleAvatar(
                                    backgroundImage:
                                        AssetImage("images/onboarding1.png"),
                                    radius: 45.sp)),
                          )
                        ],
                      ),
                    ),
                    Text(
                      "Rafif Dian Axelingga",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 18.sp),
                    ),
                    Text(
                      "Senior UI/UX Designer",
                      style: TextStyle(
                          color: Color(0xff6B7280),
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30.w),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        decoration: BoxDecoration(
                            color: Color(0xffFAFAFA),
                            borderRadius: BorderRadius.circular(8)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          // mainAxisSize: MainAxisSize.min,
                          children: [
                            Column(
                              children: [
                                Text(
                                  "Applied",
                                  style: TextStyle(color: Color(0xff6B7280)),
                                ),
                                Text("46")
                              ],
                            ),
                            Text(
                              '|',
                              style: TextStyle(
                                  fontSize: 50.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xffD1D5DB)),
                            ),
                            Column(
                              children: [
                                Text("Reviewed",
                                    style: TextStyle(color: Color(0xff6B7280))),
                                Text("23")
                              ],
                            ),
                            Text(
                              '|',
                              style: TextStyle(
                                  fontSize: 50.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xffD1D5DB)),
                            ),
                            Column(
                              children: [
                                Text("Contacted",
                                    style: TextStyle(color: Color(0xff6B7280))),
                                Text("16")
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      child: ListTile(
                        title: Text("About",
                            style: TextStyle(color: Color(0xff6B7280))),
                        trailing: InkWell(
                            child: Text(
                          "Edit",
                          style: TextStyle(color: Colors.blue),
                        )),
                        onTap: () {},
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Text(
                          "I'm Rafif Dian Axelingga, I’m UI/UX Designer, I have experience designing UI Design for approximately 1 year. I am currently joining the Vektora studio team based in Surakarta, Indonesia.I am a person who has a high spirit and likes to work to achieve what I dream of.",
                          style: TextStyle(color: Color(0xff6B7280)),
                        )),
                    SizedBox(
                      height: 20.h,
                    ),
                    CustomedExpandedContainer("General"),
                    SizedBox(
                      height: 10.h,
                    ),
                    ListView.separated(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5.w),
                            child: ListTile(
                              onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context)=>_generalRoutes[index])),
                              leading: CircleAvatar(
                                  backgroundColor: Colors.blue,
                                  child: Icon(_generalIcons[index])),
                              title: Text(_general[index]),
                              trailing: FaIcon(
                                FontAwesomeIcons.arrowRight,
                                color: Colors.black,
                                size: 12.sp,
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) => Divider(
                              thickness: 2,
                              color: Color(0xffE5E7EB),
                              indent: 20.w,
                              endIndent: 20.w,
                            ),
                        itemCount: 5),
                    SizedBox(
                      height: 20.h,
                    ),
                    CustomedExpandedContainer("Others"),
                    SizedBox(height: 10.h,),
                    ListView.separated(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5.w),
                            child: ListTile(
                              onTap:()=>Navigator.of(context).push(MaterialPageRoute(builder: (context)=>_othersRoutes[index])),
                              title: Text(_other[index]),
                              trailing: FaIcon(
                                FontAwesomeIcons.arrowRight,
                                color: Colors.black,
                                size: 12.sp,
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) => Divider(
                              thickness: 2,
                              color: Color(0xffE5E7EB),
                              indent: 20.w,
                              endIndent: 20.w,
                            ),
                        itemCount: 4),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
