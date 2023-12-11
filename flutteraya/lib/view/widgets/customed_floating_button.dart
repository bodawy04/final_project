import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomedFloatingButton extends StatelessWidget {

  CustomedFloatingButton(this._title,this._onpressing);
  final String _title;
  final dynamic _onpressing;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width - 40.w,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)),
              padding: EdgeInsets.symmetric(vertical: 12.h)),
          onPressed: () {
            _onpressing;
          },
          child: Text(_title),
        ));
  }
}

