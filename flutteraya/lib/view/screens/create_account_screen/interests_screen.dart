import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutteraya/view/screens/create_account_screen/location_screen.dart';
import 'package:flutteraya/view/widgets/customed_grid.dart';
import 'package:flutteraya/view/widgets/logo.dart';
import 'package:flutter_svg/svg.dart';

class Interests extends StatefulWidget {
  const Interests({super.key});

  @override
  State<Interests> createState() => _InterestsState();
}

class _InterestsState extends State<Interests> {
  List<Widget> _interestLogos = [
    SvgPicture.asset("images/bezier.svg",),
    SvgPicture.asset("images/pen-tool-2.svg"),
    SvgPicture.asset("images/code.svg"),
    SvgPicture.asset("images/graph.svg"),
    SvgPicture.asset("images/monitor-mobbile.svg"),
    SvgPicture.asset("images/cloud-add.svg"),
  ];

  List<String> _interestDesc = [
    "UI/UX Designer",
    "Ilustrator Designer",
    "Developer",
    "Management",
    "Information Technology",
    "Research and Analytics",
  ];

  List<bool> _interestBool =List.generate(6, (index) => false);

  Color _boxColor = Color(0xffFAFAFA);
  Color _boxColor2 = Color(0xffD6E4FF);
  Color _borderColor = Color(0xffD1D5DB);
  Color _borderColor2 = Colors.blue;

  bool pressed = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            iconTheme: IconThemeData(
              color: Colors.black,
            ),
            actions: [
              Logo(
                20,
                mrg: 20.w,
              )
            ],
            backgroundColor: Colors.white,
            elevation: 0,
          ),
          floatingActionButton: SizedBox(
              width: MediaQuery
                  .of(context)
                  .size
                  .width - 40.w,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF3366FF),

                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    padding: EdgeInsets.symmetric(vertical: 12.h)),
                onPressed: () {
                  Navigator
                      .of(context)
                      .pushReplacement(
                      MaterialPageRoute(
                          builder: (context) => Locations())) ;
                  },
                child: Text("Next"),
              )),
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.sp),
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "What type of work are you interested in?",
                      style:
                      TextStyle(fontSize: 26.sp, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                        "Tell us what you’re interested in so we can customise the app for your needs.",
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff6B7280))),
                    SizedBox(
                      height: 10.h,
                    ),
                    CustomedGrid(
                        _interestBool, _interestLogos, _interestDesc, true),
                    SizedBox(height: 65.h,),
                    SizedBox(
                      height: 50.h,),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
