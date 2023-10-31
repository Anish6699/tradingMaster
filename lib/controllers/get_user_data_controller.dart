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

  // Future<List> updateUserData() async {
  //   var prefs = await SharedPreferences.getInstance();
  //   var userId = prefs.getString('userId');
  //   var url = Uri.parse('${serverUrl}update_api/tbl_users/user_id/$userId');
  //
  //   final response = await http.post(
  //     url,
  //     headers: {'Content-Type': 'application/x-www-form-urlencoded'},
  //   );
  //   Map a = {};
  //   List data = [];
  //   a = json.decode(response.body) as Map;
  //   data = a['data'];
  //
  //   print('user Data');
  //   print(data);
  //
  //   return data;
  // }

  Future<Map> updateUserData({required var adhar, required var pan}) async {
    var prefs = await SharedPreferences.getInstance();
    var userId = prefs.getString('userId');
    var url = Uri.parse('${serverUrl}update_api/tbl_users/user_id/$userId');
    Map<String, String> formData = {
      'adhar': adhar,
      'pan': pan,
    };
    var body = Uri(queryParameters: formData).query;

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      body: body,
    );
    print(response.body);
    Map a = {};
    a = json.decode(response.body) as Map;
    print(a);
    return a;
  }
}
