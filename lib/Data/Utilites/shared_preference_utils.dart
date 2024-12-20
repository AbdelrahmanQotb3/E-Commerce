import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
@injectable
class SharedPreferencesUtils{
  Future saveToken(String token) async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("token", token);
  }

  Future<String?> getToken() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("token");
  }
}