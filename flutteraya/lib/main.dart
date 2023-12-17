import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutteraya/model/my_cache.dart';
import 'package:flutteraya/view/screens/applied_job_screens/applied_job_main.dart';
import 'package:flutteraya/view/screens/apply_job_screens/apply_job.dart';
import 'package:flutteraya/view/screens/apply_job_screens/apply_job_2.dart';
import 'package:flutteraya/view/screens/apply_job_screens/biodata_screen.dart';
import 'package:flutteraya/view/screens/apply_job_screens/type_of_work.dart';
import 'package:flutteraya/view/screens/apply_job_screens/upload_portfolio_2.dart';
import 'package:flutteraya/view/screens/create_account_screen/create_account.dart';
import 'package:flutteraya/view/screens/create_account_screen/interests_screen.dart';
import 'package:flutteraya/view/screens/create_account_screen/location_screen.dart';
import 'package:flutteraya/view/screens/home_screens/applied_jobs.dart';
import 'package:flutteraya/view/screens/home_screens/home.dart';
import 'package:flutteraya/view/screens/home_screens/home_search_screen.dart';
import 'package:flutteraya/view/screens/home_screens/main_page.dart';
import 'package:flutteraya/view/screens/home_screens/notifications_screen.dart';
import 'package:flutteraya/view/screens/home_screens/saved_screen.dart';
import 'package:flutteraya/view/screens/apply_job_screens/upload_portfolio.dart';
import 'package:flutteraya/view/screens/login_screens/login.dart';
import 'package:flutteraya/view/screens/profile_screens/edit_profile_screen.dart';
import 'package:flutteraya/view/screens/profile_screens/language_screen.dart';
import 'package:flutteraya/view/screens/profile_screens/profile.dart';
import 'package:flutteraya/view/screens/test.dart';
import 'package:flutteraya/view/widgets/logo.dart';
import 'package:flutteraya/view/screens/starting_screens/splash_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MyCache.initCache();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(fontFamily: 'Manrope'),
            home: SafeArea(child: SplashScreen()));
      },
    );
  }
}
