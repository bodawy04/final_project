import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomedGrid extends StatefulWidget {
  late List<bool> _arrBool;
  late List<Widget> _arrLogos;
  late List<String> _arrDesc;
  late bool _isContainer;

  CustomedGrid(List<bool> arrBool, List<Widget> arrLogos, List<String> arrDesc,
      bool isContainer,
      {super.key}) {
    _arrBool = arrBool;
    _arrLogos = arrLogos;
    _arrDesc = arrDesc;
    _isContainer = isContainer;
  }

  @override
  State<CustomedGrid> createState() => _CustomedGridState();
}

class _CustomedGridState extends State<CustomedGrid> {
  @override
  Widget build(BuildContext context) {
    Color _boxColor = Color(0xffFAFAFA);
    Color _boxColor2 = Color(0xffD6E4FF);
    Color _borderColor = Color(0xffD1D5DB);
    Color _borderColor2 = Colors.blue;

    return GridView.builder(
        shrinkWrap: true,
        itemCount: widget._arrLogos.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: widget._isContainer ? 15.sp:5.sp,
            mainAxisSpacing: widget._isContainer ? 15.sp:5.sp,
            childAspectRatio: widget._isContainer ? 20 / 16 : 10 / 3),
        itemBuilder: (context, i) {
          return InkWell(
            onTap: () {
              setState(() {
                widget._arrBool[i] = !widget._arrBool[i];
              });
            },
            child: widget._isContainer
                ? Container(
                    decoration: BoxDecoration(
                      color: widget._arrBool[i] ? _boxColor2 : _boxColor,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                          color:
                              widget._arrBool[i] ? _borderColor2 : _borderColor,
                          width: 2),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 14.sp),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          child: widget._arrLogos[i],
                          padding: EdgeInsets.all(10.sp),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(
                                color: widget._arrBool[i]
                                    ? _borderColor2
                                    : _borderColor,
                                width: 2),
                          ),
                        ),
                        Text(
                          widget._arrDesc[i],
                          style: TextStyle(
                              fontSize: 14.sp, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  )
                : Container(
                    decoration: BoxDecoration(
                        color: widget._arrBool[i] ? _boxColor2 : _boxColor,
                        borderRadius: BorderRadius.circular(12),
                        border:Border.all(color:widget._arrBool[i]?_borderColor2:_borderColor, width: 2),
            ),
                    padding: EdgeInsets.all(5),
                    child: Row(
                      // mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          child: widget._arrLogos[i],
                          padding: EdgeInsets.all(5.sp),
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                          ),
                        ),
                        SizedBox(width: 10.w,),
                        Text(widget._arrDesc[i])
                      ],
                    ),
                  ),
          );
        });
  }
}
