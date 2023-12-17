import 'dart:ffi';

import 'package:card_swiper/card_swiper.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutteraya/model/my_cache.dart';
import 'package:flutteraya/view/screens/home_screens/home.dart';
import 'package:flutteraya/view/screens/home_screens/home_search_screen.dart';
import 'package:flutteraya/view/screens/home_screens/saved_screen.dart';
import 'package:flutteraya/view/screens/profile_screens/profile.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'applied_jobs.dart';

class MainScreen extends StatefulWidget {

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List _screens = [Home(), AppliedJobs(), SavedScreen(), ProfileScreen()];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: MyCache.getString(key: "navigator")==" "?0:int.parse(MyCache.getString(key: "navigator")),
          onTap: (i) {
            setState(() {
              MyCache.setString(key: "navigator", value: i.toString());
            });
          },
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Color(0xff3366FF),
          unselectedItemColor: Color(0xff9CA3AF),
          items: [
            BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.house), label: "Home"),
            BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.briefcase), label: "Applied"),
            BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.bookmark), label: "Saved"),
            BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.user), label: "Profile"),
          ],
        ),
        body: _screens[ MyCache.getString(key: "navigator")==" "?0:int.parse(MyCache.getString(key: "navigator"))],
      ),
    );
  }
}
