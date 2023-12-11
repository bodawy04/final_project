import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class Logo extends StatelessWidget {
  late double fSize;
  late double _margin;

  Logo(double fsize, {double? mrg,super.key}) {
    fSize = fsize;
    _margin = mrg??0;
  }

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisSize: MainAxisSize.min, children: [
      Text(
        "J",
        style: TextStyle(
            color: Colors.black,
            fontSize: fSize.sp,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.2.sp),
      ),
      SvgPicture.asset("images/logo.svg"),
      Text("BSQUE",
          style: TextStyle(
              color: Colors.black,
              fontSize: fSize.sp,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.2.sp,)),
      SizedBox(width: _margin,)
    ]);
  }
}
