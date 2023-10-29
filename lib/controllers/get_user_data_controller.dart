import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:optional_master/utils/configs.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserDataController {
  Future<List> getUserData() async {
    var prefs = await SharedPreferences.getInstance();
    var userId = prefs.getString('userId');
    var url = Uri.parse('${serverUrl}readwhere_api/tbl_users/user_id/$userId');

    final response = await http.get(
      url,
      headers: {'Content-Type': 'application/x-www-form-urlencoded'},
    );
    Map a = {};
    List data = [];
    a = json.decode(response.body) as Map;
    data = a['data'];

    print('user Data');
    print(data);

    return data;
  }
}
