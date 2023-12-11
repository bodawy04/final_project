import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  TextEditingController _passwordController = TextEditingController();
  GlobalKey<FormState> _formkey = new GlobalKey<FormState>();
  Color _borderColor = Color(0xffD1D5DB);
  bool _obs = true;
  bool _obsConst = true;

  void _updateBorderColor(Color color) {
    setState(() {
      _borderColor = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child:
          Container(
            decoration: BoxDecoration(color: Colors.grey,borderRadius:BorderRadius.circular(20)),
            padding: EdgeInsets.all(5),
            child: Row(
              // mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [Container(
              child: CountryFlag.fromCountryCode("US",height: 20,width: 20,),
              padding: EdgeInsets.all(5.sp),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                    color: Colors.blue, width: 2),
              ),
            ),Text("United States")],),
          )
      ),
    ));
  }
}
