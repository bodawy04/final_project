import 'package:flutter/material.dart';
import 'package:flutteraya/model/my_cache.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class UploadedPdf extends ChangeNotifier{

  String pdfName=" ";
  void uploaded(String cvName){
    pdfName=cvName;
    notifyListeners();
  }
}