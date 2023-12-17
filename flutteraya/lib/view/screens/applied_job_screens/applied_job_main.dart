import 'package:dio/dio.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutteraya/view/screens/applied_job_screens/applied_biodata.dart';
import 'package:flutteraya/view/screens/applied_job_screens/applied_type_of_work.dart';
import 'package:flutteraya/view/screens/applied_job_screens/applied_upload_portfolio.dart';
import 'package:flutteraya/view/screens/home_screens/applied_jobs.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../model/job_model.dart';
import '../../../model/my_cache.dart';
import '../home_screens/main_page.dart';

class AppliedJobMain extends StatefulWidget {
  late JobModel jobModel;

  AppliedJobMain({required this.jobModel}) {
    jobModel = jobModel;
    MyCache.setString(key: "jobID", value: jobModel.id!.toString());
    MyCache.setString(key: "jobType", value: jobModel.jobType!);
    MyCache.setString(key: "jobName", value: jobModel.name!);
    MyCache.setString(key: "jobImage", value: jobModel.image!);
  }

  @override
  _AppliedJobMainState createState() => _AppliedJobMainState();
}

class _AppliedJobMainState extends State<AppliedJobMain> {
  saveData() async {
    Dio dio = Dio();
    try {
      Response resp = await dio.post(
        "https://project2.amit-learning.com/api/apply",
        options: Options(headers: {
          "Authorization": "Bearer ${MyCache.getString(key: "token")}"
        }),
        data: {
          "cv_file": "${MyCache.getString(key: "cv_filename")}",
          "name": "${MyCache.getString(key: "name")}",
          "email": "${MyCache.getString(key: "email")}",
          "mobile": "${MyCache.getString(key: "mobile")}",
          "work_type": "${MyCache.getString(key: "chosen_jobType")}",
          "job_id": "${MyCache.getString(key: "jobID")}",
          "user_id": "${MyCache.getString(key: "userID")}",
        },
      );

      if (resp.statusCode == 200) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => MainScreen()));
      } else {}
    } on DioException catch (e) {
      // Handle exceptions here
      // print("An error occurred: ${e.response!.data}");
      print("An error occurred: ${e.response!.data!.toString()}");
    }
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => MainScreen()));
  }

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
                    ? saveData()
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
                  SizedBox(
                    height: 100.h,
                    width: 100.w,
                    child: ClipRRect(child: Image.network(
                        widget.jobModel.image!),
                      borderRadius: BorderRadius.circular(8),),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    widget.jobModel.name!,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                      "${widget.jobModel
                          .compName!} • ${widget.jobModel.location!.substring(0,
                          widget.jobModel.location!
                              .indexOf(','))}",
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
                        title: _stepperTitle[index],
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
