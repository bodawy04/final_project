import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DescriptionPart extends StatelessWidget {
  const DescriptionPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: ListView(shrinkWrap: true, children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10.h,
              ),
              Text(
                "Job Description",
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                "Your role as the UI Designer is to use interactive components on various platforms (web, desktop and mobile). This will include producing high-fidelity mock-ups, iconography, UI illustrations/graphics, and other graphic elements. As the UI Designer, you will be supporting the wider design team with the internal Design System, tying together the visual language. You will with other UI and UX Designers, Product Managers, and Engineering teams in a highly customer-focused agile environment to help define the vision of the products.",
                style: TextStyle(
                    color: Color(0xff4B5563), fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                "Skill Required",
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                """A strong visual portfolio with clear understanding of UI methodologies
Ability to create hi-fidelity mock-ups in Figma
Ability to create various graphics for the web e.g. illustrations and icons
Able to facilitate workshops and liaise with stakeholders
Proficiency in the Adobe Creative Suite
Confident communicator with an analytical mindset
Design library/Design system experience
4+ years of commercial experience in UI/Visual Design""",
                style: TextStyle(
                    color: Color(0xff4B5563), fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 60.h,
              )
            ],
          )
        ]));
  }
}
