import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutteraya/model/my_cache.dart';
import 'package:flutteraya/view/screens/profile_screens/change_password.dart';
import 'package:flutteraya/view/screens/profile_screens/email_edit.dart';
import 'package:flutteraya/view/screens/profile_screens/phone_number.dart';
import 'package:flutteraya/view/widgets/customed_expanded_container.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginandSecurity extends StatefulWidget {
  const LoginandSecurity({super.key});

  @override
  State<LoginandSecurity> createState() => _LoginandSecurityState();
}

class _LoginandSecurityState extends State<LoginandSecurity> {
  List<String> _loginTitles = [
    "Email Address",
    "Phone Number",
    "Change Password",
    "Two-step verification",
    "Face ID"
  ];
  List<String> _loginTitlesData = [
    MyCache.getString(key: "email"),
    MyCache.getString(key: "mobile"),
    "",
    "Non active",
    ""
  ];
  List<Widget> _routes=[EmailEdit(),PhoneNumberEdit(),ChangePassword()];

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
          CustomedExpandedContainer("Account access"),
          SizedBox(
            height: 10.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context)=>_routes[index])),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(_loginTitles[index]),
                        Text(
                          _loginTitlesData[index],
                          style: TextStyle(
                              color: Color(0xff6B7280), fontSize: 12.sp),
                        )
                      ],
                    ),
                    trailing: FaIcon(
                      FontAwesomeIcons.arrowRight,
                      color: Colors.black,
                      size: 12.sp,
                    ),
                  );
                },
                separatorBuilder: (context, index) => Divider(
                      thickness: 2,
                      color: Color(0xffE5E7EB),
                      indent: 12.w,
                      endIndent: 10.w,
                    ),
                itemCount: 5),
          ),
        ],
      ),
    );
  }
}
