import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutteraya/view/screens/applied_job_screens/applied_biodata.dart';
import 'package:flutteraya/view/screens/applied_job_screens/applied_type_of_work.dart';
import 'package:flutteraya/view/screens/applied_job_screens/applied_upload_portfolio.dart';
import 'package:flutteraya/view/screens/home_screens/applied_jobs.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppliedJobMain extends StatefulWidget {
  const AppliedJobMain({Key? key}) : super(key: key);

  @override
  _AppliedJobMainState createState() => _AppliedJobMainState();
}

class _AppliedJobMainState extends State<AppliedJobMain> {
  int activeStep = 0;
  List<String> _stepperTitle = [
    'Biodata',
    "Type of work",
    "Upload portfolio",
    ""
  ];

  List _stepperWidgets = [
    AppliedBiodata(),
    AppliedTypeOfWork(),
    AppliedUploadPortfolio()
  ];

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
          width: MediaQuery.of(context).size.width - 40.w,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff2C2CF5),
                padding: EdgeInsets.symmetric(vertical: 10.h),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50))),
            onPressed: () {
              setState(() {
                activeStep == 2
                    ? Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => AppliedJobs()))
                    : activeStep++;
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
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.blue,
                    radius: 24.sp,
                    child: FaIcon(FontAwesomeIcons.discord),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    "UI/UX Designer",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    "Discord • Jakarta, Indonesia ",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                ],
              ),
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
                  (index) => EasyStep(
                        finishIcon: Icon(Icons.done),
                        icon: index == 0
                            ? Icon(FontAwesomeIcons.one)
                            : index == 1
                                ? Icon(FontAwesomeIcons.two)
                                : Icon(FontAwesomeIcons.three),
                        title: "Data",
                      )),
              onStepReached: (index) => setState(() => activeStep = index),
            ),
            SizedBox(
              height: 10.h,
            ),
            _stepperWidgets[activeStep],
            SizedBox(
              height: 60.h,
            )
          ]),
    );
  }
}
