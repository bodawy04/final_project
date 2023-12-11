import 'package:flutter/material.dart';
import 'package:flutteraya/model/my_cache.dart';
import 'package:flutteraya/view/screens/home_screens/main_page.dart';
import 'package:flutteraya/view/screens/login_screens/login.dart';
import 'package:flutteraya/view/widgets/logo.dart';
import 'package:flutteraya/view/screens/starting_screens/onboarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 4), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (_) => MyCache.getBool(key: "onBoardingDone")
              ? (MyCache.getString(key: "token") == null ||
                      MyCache.getString(key: "token") == "")
                  ? Login()
                  : MainScreen()
              : Onboarding()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
              gradient: RadialGradient(colors: [
            Color(0xFFD6E4FF).withOpacity(0.9),
            Color(0xFFD6E4FF).withOpacity(0.6),
            Color(0xFFD6E4FF).withOpacity(0.4),
            Color(0xFFD6E4FF).withOpacity(0.2)
          ], stops: [
            0.4,
            0.6,
            0.8,
            0.9
          ])),
          child: Center(child: Logo(24))),
    );
  }
}
