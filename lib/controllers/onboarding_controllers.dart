import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:optional_master/utils/configs.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingControllers {
  Future<Map> registerApi(
    String fname,
    String email,
    String lname,
    String mobile,
    String password,
  ) async {
    var url = Uri.parse('${serverUrl}register_api');
    Map<String, String> formData = {
      'fname': fname,
      'lname': lname,
      'email': email,
      'mobile': mobile,
      'password': password,
      'company_id': '2',
      'role_id' : '3'
    };
    var body = Uri(queryParameters: formData).query;

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      body: body,
    );
    print('rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr');
    Map a = {};
    a = json.decode(response.body) as Map;
    var prefs = await SharedPreferences.getInstance();
    var userId = a['data']['user_id'];
    print(userId);
    prefs.setString('userId', userId);
    //  {"response":1,"message":"success","data":{"user_id":"12"}}

    return a;
  }

  Future<Map> loginApi(String email, String password) async {
    print('loginnnnnnnnnnnnnnnnnnnnnn');
    print(email);
    print(password);
    var url = Uri.parse('${serverUrl}login_api');
    Map<String, String> formData = {
      'email': email,
      'password': password,
    };
    var body = Uri(queryParameters: formData).query;

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      body: body,
    );
    print('loginnnnnnnn');
    print(response.body);
    Map a = {};
    a = json.decode(response.body) as Map;

    // {"response":1,"message":"success",
    // "data":{"user_id":"12","company_id":"0","role_id":"0",
    // "fullname":"Anish Gunjal","email":"anishgunjal.43@gmail.com"}}
    var prefs = await SharedPreferences.getInstance();
    var userId = a['data']['user_id'];
    print(userId);
    prefs.setString('userId', userId);
    print('aaaaaaaaaaaaaaaaaa');
    print(a);
    return a;
  }
}
