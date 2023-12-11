import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomedTogglebar extends StatefulWidget {

  late List<String> _titles;
  late int _tabTextIndexSelected;


  CustomedTogglebar(List<String> t,int tabIndex){
    this._titles=t;
    this._tabTextIndexSelected=tabIndex;
  }

  @override
  _CustomedTogglebarState createState() => _CustomedTogglebarState();
}

class _CustomedTogglebarState extends State<CustomedTogglebar> {

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color(0xffF4F4F5),
          borderRadius: BorderRadius.circular(50)),
      height: 50.h,
      child: Row(children:
        List.generate(widget._titles.length, (index) => Expanded(
          child: InkWell(
            child: Container(
              alignment: Alignment.center,
              child: Text(
                widget._titles[index],
                style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: widget._tabTextIndexSelected == index
                        ? Colors.white
                        : Color(0xff6B7280)),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: widget._tabTextIndexSelected == index
                    ? Color(0xff091A7A)
                    : Color(0xffF4F4F5),
              ),
              height: 50.h,
            ),
            onTap: () {
              setState(() => widget._tabTextIndexSelected = index);
            },
          ),
        ))
        // Expanded(
        //   child: InkWell(
        //     child: Container(
        //       alignment: Alignment.center,
        //       child: Text(
        //         "Active",
        //         style: TextStyle(
        //             fontSize: 14.sp,
        //             fontWeight: FontWeight.w500,
        //             color: _tabTextIndexSelected == 0
        //                 ? Colors.white
        //                 : Color(0xff6B7280)),
        //       ),
        //       decoration: BoxDecoration(
        //         borderRadius: BorderRadius.circular(50),
        //         color: _tabTextIndexSelected == 0
        //             ? Color(0xff091A7A)
        //             : Color(0xffF4F4F5),
        //       ),
        //       height: 50.h,
        //     ),
        //     onTap: () {
        //       setState(() => _tabTextIndexSelected = 0);
        //     },
        //   ),
        // ),
        // Expanded(
        //   child: InkWell(
        //     child: Container(
        //       alignment: Alignment.center,
        //       child: Text(
        //         "Rejected",
        //         style: TextStyle(
        //             color: _tabTextIndexSelected == 1
        //                 ? Colors.white
        //                 : Color(0xff6B7280)),
        //       ),
        //       decoration: BoxDecoration(
        //         borderRadius: BorderRadius.circular(50),
        //         color: _tabTextIndexSelected == 1
        //             ? Color(0xff091A7A)
        //             : Color(0xffF4F4F5),
        //       ),
        //       height: 50.h,
        //     ),
        //     onTap: () {
        //       setState(() => _tabTextIndexSelected = 1);
        //     },
        //   ),
        // )
      ),
    );
  }
}
