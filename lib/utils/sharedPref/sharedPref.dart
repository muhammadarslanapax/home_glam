// ignore: file_names
import 'package:home_glam/utils/sharedPref/sharedPref_helper.dart';

setOnboarding() {
  SharedPreferencesHelper.setBool(AppKeys.knewUser, true);
}

bool get isNewUser {
  final isNew = SharedPreferencesHelper.getBool(AppKeys.knewUser);
  return isNew != null ? true : false;
}

class AppKeys {
  static String knewUser = "newUser";
}
