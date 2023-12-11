import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  List<String> _languages = [
    "Enlgish",
    "Indonesian",
    "Arabic",
    "Chinese",
    "Dutch",
    "French",
    "German",
    "Japanese",
    "Korean",
    "Portuguese"
  ];
  List<String> _values = [
    "En",
    "Id",
    "Ar",
    "Cn",
    "Du",
    "Fr",
    "Gr",
    "Jp",
    "Kr",
    "Pr"
  ];
  String _country="En";

  List<dynamic> _countries = [
    CountryFlag.fromCountryCode(
      'GB',
      height: 30.h,
      width: 30.w,
      borderRadius: 10,
    ),
    CountryFlag.fromCountryCode(
      'ID',
      height: 30.h,
      width: 30.w,
      borderRadius: 10,
    ),
    CountryFlag.fromCountryCode(
      'SA',
      height: 30.h,
      width: 30.w,
      borderRadius: 10,
    ),
    CountryFlag.fromCountryCode(
      'CN',
      height: 30.h,
      width: 30.w,
      borderRadius: 10,
    ),
    CountryFlag.fromCountryCode(
      'NL',
      height: 30.h,
      width: 30.w,
      borderRadius: 10,
    ),
    CountryFlag.fromCountryCode(
      'FR',
      height: 30.h,
      width: 30.w,
      borderRadius: 10,
    ),
    CountryFlag.fromCountryCode(
      'DE',
      height: 30.h,
      width: 30.w,
      borderRadius: 10,
    ),
    CountryFlag.fromCountryCode(
      'JP',
      height: 30.h,
      width: 30.w,
      borderRadius: 10,
    ),
    CountryFlag.fromCountryCode(
      'KR',
      height: 30.h,
      width: 30.w,
      borderRadius: 10,
    ),
    CountryFlag.fromCountryCode(
      'PT',
      height: 30.h,
      width: 30.w,
      borderRadius: 10,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "Language",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: ListView.separated(
          shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, i) {
              return RadioListTile(
                controlAffinity: ListTileControlAffinity.trailing,
                value: _values[i] ,
                groupValue: _country,
                onChanged: (value) {
                  setState(() {
                    _country=value!;
                  });
                },
                title: Row(
                  children: [
                    _countries[i],
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(_languages[i]),
                  ],
                ),
              );
            },
            separatorBuilder: (context, i) => Divider(
                  thickness: 1,
                  color: Colors.grey,
                  indent: 10.w,
                  endIndent: 10.w,
                ),
            itemCount: _languages.length),
      ),
    );
  }
}
