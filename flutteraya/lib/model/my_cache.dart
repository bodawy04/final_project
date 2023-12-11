import 'package:shared_preferences/shared_preferences.dart';

class MyCache{
  static SharedPreferences? preferences;

  static Future<void> initCache() async{
    preferences=await SharedPreferences.getInstance();
  }

  static void setString({required String key,required String value}){
    preferences!.setString(key, value);
  }
  static String getString({required String key}){
    return preferences!.getString(key)??" ";
  }
  static void setBool({required String key,required bool value}){
    preferences!.setBool(key, value);
  }
  static bool getBool({required String key}){
    return preferences!.getBool(key)??false;
  }

  static void removeFromCache ({required String key}){
    preferences!.remove(key);
  }
  static void clearCache ({required String key}){
    preferences!.clear();
  }
}