import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutteraya/model/my_cache.dart';
import '../../widgets/logo.dart';
import '../login_screens/login.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  List<Widget> _images = [
    Image.asset("images/onboarding1.png"),
    Image.asset("images/onboarding2.png"),
    Image.asset("images/onboarding3.png")
  ];
  final List<String> _imagesText = [
    "Find a job, and=your career from now on",
    "Hundreds of jobs are waiting for you to=",
    "Get the best=you've always dreamed of",
  ];
  List<String> _boldedText = [
    " start building ",
    " join together",
    " choice for the job ",
  ];
  List<String> _imagesDesc = [
    "Explore over 25,924 available job roles and upgrade your operator now.",
    "Immediately join us and start applying for the job you are interested in.",
    "The better the skills you have, the greater the good job opportunities for you.",
  ];

  int _curIndex = 0;

  void getStarted(){
    MyCache.setBool(key: "onBoardingDone", value: true);
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(
            builder: (context) => Login()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Logo(20),
          actions: [
            MaterialButton(
              onPressed: () {
                MyCache.setBool(key: "onBoardingDone", value: true);
                setState(() {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => Login()));
                });
              },
              child: Text(
                "Skip",
                style:
                    TextStyle(color: Colors.grey, fontWeight: FontWeight.w600),
              ),
            )
          ],
        ),
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.only(top: 20),
          child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _images[_curIndex],
                    Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: RichText(
                          text: TextSpan(
                            style: TextStyle(
                                fontSize: 28.13.sp,
                                fontWeight: FontWeight.w600),
                            children: <TextSpan>[
                              TextSpan(
                                  text:
                                      ("${_imagesText[_curIndex].substring(0, _imagesText[_curIndex].indexOf("="))}"),
                                  style: TextStyle(color: Colors.black)),
                              TextSpan(
                                  text: ("${_boldedText[_curIndex]}"),
                                  style: TextStyle(color: Colors.blue)),
                              TextSpan(
                                  text:
                                      ("${_imagesText[_curIndex].substring(_imagesText[_curIndex].indexOf("=") + 1)}"),
                                  style: TextStyle(color: Colors.black)),
                            ],
                          ),
                        )),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Text(
                        "${_imagesDesc[_curIndex]}",
                        style: TextStyle(fontSize: 14.sp, color: Colors.grey),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 40,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF3366FF),
                          padding: EdgeInsets.symmetric(vertical: 12.h),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100))),
                      onPressed: () {
                        _curIndex != 2
                            ? setState(() {
                                _curIndex++;
                              })
                            :
                            getStarted();
                        },
                      child:
                          _curIndex != 2 ? Text('Next',style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w600),) : Text('Get Started',style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w600))),
                ),
                DotsIndicator(
                  dotsCount: _images.length,
                  position: _curIndex,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  decorator: DotsDecorator(activeColor: Color(0xFF3366FF)),
                )
              ]),
        ));
  }
}
