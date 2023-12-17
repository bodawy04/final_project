import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class SavedJob extends ChangeNotifier{

  FaIcon? icon=FaIcon(FontAwesomeIcons.bookmark,color: Colors.blue,);
  FaIcon notSaved=FaIcon(FontAwesomeIcons.bookmark,color: Colors.blue,);
  FaIcon Saved=FaIcon(FontAwesomeIcons.solidBookmark,color: Colors.blue,);

  void changeIcon(bool flag){
    if(flag) {
      icon = Saved;
      print(flag);
    }
    if(!flag){
      icon = notSaved;
      print(flag);
    }
    notifyListeners();
  }
}