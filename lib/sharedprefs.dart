import 'package:shared_preferences/shared_preferences.dart';
import 'package:task3/screens/loginScreen.dart';

class sharedPrefs {
  sharedPrefs._privateConstructor();
  static final sharedPrefs instance = sharedPrefs._privateConstructor();
  setStringValue(String key, String value) async {
    SharedPreferences myPrefs = await SharedPreferences.getInstance();
    myPrefs.setString(key, value);
  }

  Future<String> getStringValue(String key) async {
    SharedPreferences myPrefs = await SharedPreferences.getInstance();
    return myPrefs.getString(key);
  }
}
