import 'package:shared_preferences/shared_preferences.dart';

Future<String?> getLoggedInToken() async {
  return 'dab4113c48b59df9c747ef94a4b56e9a0884137f';
}

Future<String?> getLanguage() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final language = prefs.getString('locale') ?? 'en';
  if (language.contains('_')) {
    return language.substring(0, language.indexOf('_'));
  }

  return language;
}
