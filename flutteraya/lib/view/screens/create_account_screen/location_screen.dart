import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutteraya/view/screens/create_account_screen/account_done.dart';
import 'package:flutteraya/view/widgets/customed_togglebar.dart';
import '../../widgets/customed_grid.dart';
import '../../widgets/logo.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';

class Locations extends StatefulWidget {
  const Locations({super.key});

  @override
  State<Locations> createState() => _LocationsState();
}

class _LocationsState extends State<Locations> {
  List<Widget> _countriesLogos = [
    CountryFlag.fromCountryCode(
      'US',
      height: 30,
      width: 30,
      borderRadius: 50,
    ),
    CountryFlag.fromCountryCode(
      'ES',
      height: 30,
      width: 30,
      borderRadius: 50,
    ),
    CountryFlag.fromCountryCode(
      'SG',
      height: 30,
      width: 30,
      borderRadius: 50,
    ),
    CountryFlag.fromCountryCode(
      'ID',
      height: 30,
      width: 30,
      borderRadius: 50,
    ),
    CountryFlag.fromCountryCode(
      'PH',
      height: 30,
      width: 30,
      borderRadius: 50,
    ),
    CountryFlag.fromCountryCode(
      'PL',
      height: 30,
      width: 30,
      borderRadius: 50,
    ),
    CountryFlag.fromCountryCode('IN', height: 30, width: 30, borderRadius: 50),
    CountryFlag.fromCountryCode(
      'VN',
      height: 30,
      width: 30,
      borderRadius: 50,
    ),
    CountryFlag.fromCountryCode(
      'CN',
      height: 30,
      width: 30,
      borderRadius: 50,
    ),
    CountryFlag.fromCountryCode(
      'CA',
      height: 30,
      width: 30,
      borderRadius: 50,
    ),
    CountryFlag.fromCountryCode(
      'AR',
      height: 30,
      width: 30,
      borderRadius: 50,
    ),
    CountryFlag.fromCountryCode(
      'BR',
      height: 30,
      width: 30,
      borderRadius: 50,
    ),
  ];

  List<String> _countries = [
    "United States",
    "Spain",
    "Singapore",
    "Indonesia",
    "Poland",
    "Philippines",
    "India",
    "Vietnam",
    "China",
    "Canada",
    "Argentiana",
    "Brazil"
  ];

  List<String> _listTextTabToggle = ["Work From Office", "Remote Work"];
  int _tabTextIndexSelected = 0;

  List<bool> _countryBool = List.generate(12, (index) => false);

  Color _boxColor = Color(0xffFAFAFA);
  Color _boxColor2 = Color(0xffD6E4FF);
  Color _borderColor = Color(0xffD1D5DB);
  Color _borderColor2 = Colors.blue;

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
          width: MediaQuery.of(context).size.width - 40.w,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF3366FF),

                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                padding: EdgeInsets.symmetric(vertical: 12.h)),
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => CreateAccDone()));
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
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Where are you prefefred Location?",
                  style:
                      TextStyle(fontSize: 26.sp, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                    "Let us know, where is the work location you want at this time, so we can adjust it.",
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff6B7280))),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Color(0xffF4F4F5),
                      borderRadius: BorderRadius.circular(50)),
                  height: 50.h,
                  child: Row(
                      children: List.generate(
                          _listTextTabToggle.length,
                          (index) => Expanded(
                                child: InkWell(
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: Text(
                                      _listTextTabToggle[index],
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500,
                                          color: _tabTextIndexSelected == index
                                              ? Colors.white
                                              : Color(0xff6B7280)),
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: _tabTextIndexSelected == index
                                          ? Color(0xff091A7A)
                                          : Color(0xffF4F4F5),
                                    ),
                                    height: 50.h,
                                  ),
                                  onTap: () {
                                    setState(
                                        () => _tabTextIndexSelected = index);
                                  },
                                ),
                              ))
                      ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text("Select the country you want for your job",
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff737379))),
                SizedBox(
                  height: 20.h,
                ),
                CustomedGrid(_countryBool, _countriesLogos, _countries, false),
                SizedBox(
                  height: 40.h,
                ),
                SizedBox(
                  height: 50.h,
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
