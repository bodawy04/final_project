import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PeoplePart extends StatefulWidget {
  const PeoplePart({super.key});

  @override
  State<PeoplePart> createState() => _PeoplePartState();
}

class _PeoplePartState extends State<PeoplePart> {
  String _dropdown1 = "UI/UX Designer";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Row(children: [Column()],),
        ListTile(
            title: Text("6 employees for"),
            subtitle: Text("UI/Ux Design"),
            trailing: Container(
              margin: EdgeInsets.symmetric(horizontal: 5.w),
              decoration: BoxDecoration(
                  // color: Color(0xff091A7A),
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: Color(0xffD1D5DB))),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 1.h),
                  items: [
                    DropdownMenuItem(
                      child: Text("UI/UX Designer  "),
                      value: "UI/UX Designer",
                    ),
                    DropdownMenuItem(
                      child: Text("Onsite   "),
                      value: "Onsite",
                    ),
                    DropdownMenuItem(
                      child: Text("Hybrid   "),
                      value: "Hybrid",
                    )
                  ],
                  value: _dropdown1,
                  onChanged: (String? value) {
                    setState(() {
                      _dropdown1 = value!;
                    });
                  },
                  icon: FaIcon(
                    FontAwesomeIcons.chevronDown,
                    color: Colors.black,
                  ),
                  iconSize: 16.sp,
                  style: TextStyle(color: Colors.black),
                ),
              ),
            )),
        SizedBox(
          height: 10.h,
        ),
        ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FaIcon(FontAwesomeIcons.userAstronaut),
                    Column(
                      // mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Bodaaaa",
                          style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                          "Senior UI/UX Designer at Twitter",
                          style: TextStyle(
                              fontSize: 12.sp,
                              color: Colors.grey,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      // mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Work during",
                          style: TextStyle(color: Colors.grey),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                          "5 years",
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ],
                ),
            separatorBuilder: (context, i) {
              return Divider(
                thickness: 2,
                height: 20.h,
              );
            },
            itemCount: 5),
      ],
    );
  }
}
