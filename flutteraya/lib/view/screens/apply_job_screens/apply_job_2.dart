import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutteraya/view/screens/apply_job_screens/biodata_screen.dart';
import 'package:flutteraya/view/screens/apply_job_screens/type_of_work.dart';
import 'package:flutteraya/view/screens/apply_job_screens/upload_portfolio.dart';
import 'package:flutteraya/view/screens/apply_job_screens/upload_portfolio_2.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ApplyJob1 extends StatefulWidget {
  const ApplyJob1({super.key});

  @override
  State<ApplyJob1> createState() => _ApplyJob1State();
}

class _ApplyJob1State extends State<ApplyJob1> {
  int activeStep = 0;
  List<String> _stepperTitle = [
    'Biodata',
    "Type of work",
    "Upload portfolio",
    ""
  ];

  List _stepperWidgets = [BiodataScreen(), TypeOfWork(), UploadPortfolio()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          "Apply Job",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      floatingActionButton: SizedBox(
          width: MediaQuery
              .of(context)
              .size
              .width - 40.w,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff2C2CF5),
                padding: EdgeInsets.symmetric(vertical: 10.h),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50))),
            onPressed: () {
              activeStep == 2 ? Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => UploadPortfolio2())):
              setState(() {
                activeStep++;
              });
            },
            child: Text("Next"),
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: ListView(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          children: [
            SizedBox(
              height: 20.h,
            ),
            EasyStepper(
              activeStep: activeStep,
              activeStepBackgroundColor: Colors.white,
              activeStepTextColor: Colors.blue,
              activeStepIconColor: Colors.blue,
              finishedStepTextColor: Colors.blue,
              internalPadding: 20,
              showLoadingAnimation: false,
              fitWidth: true,
              disableScroll: true,
              stepRadius: 20.sp,
              showStepBorder: true,
              borderThickness: 5,
              stepShape: StepShape.circle,
              defaultStepBorderType: BorderType.normal,
              steps: List.generate(
                  3,
                      (index) =>
                      EasyStep(
                        finishIcon: Icon(Icons.done),
                        icon: index == 0 ? Icon(FontAwesomeIcons.one) : index ==
                            1 ? Icon(FontAwesomeIcons.two) : Icon(
                            FontAwesomeIcons.three),
                        title: _stepperTitle[index],
                      )
              ),
              onStepReached: (index) => setState(() => activeStep = index),
            ),
            SizedBox(
              height: 10.h,
            ),
            _stepperWidgets[activeStep],
          ]),
    );
  }
}
