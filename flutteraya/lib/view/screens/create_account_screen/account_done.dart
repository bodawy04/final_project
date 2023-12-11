import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutteraya/view/screens/home_screens/main_page.dart';

import '../../widgets/logo.dart';

class CreateAccDone extends StatelessWidget {
  const CreateAccDone({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(
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
                  MaterialPageRoute(builder: (context) => MainScreen()));
            },
            child: Text("Get Started"),
          )),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset("images/logo14.png"),
            SizedBox(
              height: 5.h,
            ),
            Text(
              "Your account has been set up!",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color(0xff111827),
                  fontWeight: FontWeight.w600,
                  fontSize: 21.sp),
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              "We have customized feeds according to your preferences",
              style: TextStyle(
                color: Color(0xff6B7280),
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
