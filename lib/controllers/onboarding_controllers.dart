import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:optional_master/utils/configs.dart';

class OnboardingControllers {
  registerApi(
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

    // {"response":1,"message":"success",
    // "data":{"user_id":"12","company_id":"0","role_id":"0",
    // "fullname":"Anish Gunjal","email":"anishgunjal.43@gmail.com"}}
    if (response.statusCode == 200) {
      print('Request successful');
    } else {
      print('Request failed with status: ${response.statusCode}');
    }
    print('aaaaaaaaaaaaaaaaaa');
    print(a);

    //  {"response":1,"message":"success","data":{"user_id":"12"}}
    if (response.statusCode == 200) {
      print('Request successful');
    } else {
      print('Request failed with status: ${response.statusCode}');
    }
    return a;
  }

  Future<Map> loginApi(String mobile, String password) async {
    var url = Uri.parse('${serverUrl}login_api');
    Map<String, String> formData = {
      'mobile': mobile,
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
    if (response.statusCode == 200) {
      print('Request successful');
    } else {
      print('Request failed with status: ${response.statusCode}');
    }
    print('aaaaaaaaaaaaaaaaaa');
    print(a);
    return a;
  }
}
