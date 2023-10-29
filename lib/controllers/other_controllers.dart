import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:optional_master/utils/configs.dart';

class AllControllers {
  Future<List> getAllPackages() async {
    var url = Uri.parse('${serverUrl}read_api/tbl_packages');

    final response = await http.get(
      url,
      headers: {'Content-Type': 'application/x-www-form-urlencoded'},
    );
    Map a = {};
    List data = [];
    a = json.decode(response.body) as Map;
    data = a['data'];

    print('all packagesssssssssss');
    print(data);

    return data;
  }
}
