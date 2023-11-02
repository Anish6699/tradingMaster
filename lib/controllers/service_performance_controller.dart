import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:optional_master/utils/configs.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ServicePerformanceControllers {
  Future<List> getUserPurchasedServices() async {
    var prefs = await SharedPreferences.getInstance();
    var userId = prefs.getString('userId');
    var url =
        Uri.parse('${serverUrl}readwhere_api/tbl_payments/user_id/$userId');

    final response = await http.get(
      url,
      headers: {'Content-Type': 'application/x-www-form-urlencoded'},
    );
    Map a = {};
    List data = [];
    a = json.decode(response.body) as Map;
    print('uuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu');
    print(a);
    data = a['data'];

    return data;
  }

  Future<List> getPerformanceofService(String servicedetail_id) async {
    var url = Uri.parse(
        '${serverUrl}readwhere_api/tbl_performance/servicedetail_id/$servicedetail_id');

    final response = await http.get(
      url,
      headers: {'Content-Type': 'application/x-www-form-urlencoded'},
    );
    Map a = {};
    List data = [];
    a = json.decode(response.body) as Map;
    print('detaillllllllllllllllllllll');
    print(a);
    data = a['data'];

    return data;
  }

  Future<List> getServiceDetails(String servicedetail_id) async {
    var url = Uri.parse(
        '${serverUrl}readwhere_api/tbl_servicedetail/servicedetail_id/$servicedetail_id');

    final response = await http.get(
      url,
      headers: {'Content-Type': 'application/x-www-form-urlencoded'},
    );
    Map a = {};
    List data = [];
    a = json.decode(response.body) as Map;
    print('detaillllllllllllllllllllll');
    print(a);
    data = a['data'];

    return data;
  }

  Future<Map> addPaymentforUser({
    required String companyId,
    required String serviceId,
    required String packageId,
    required String transactionId,
    required String ammount,
  }) async {
    var prefs = await SharedPreferences.getInstance();
    var userId = prefs.getString('userId');
    print('adding in payment tableeeeeeee');
    var url = Uri.parse('${serverUrl}add_api/tbl_payments');
    Map<String, String> formData = {
      "company_id": companyId,
      "service_id": serviceId,
      "package_id": packageId,
      "user_id": userId.toString(),
      "transaction_id": transactionId,
      "amount": ammount,
      "status": "1"
    };
    var body = Uri(queryParameters: formData).query;

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      body: body,
    );
    Map a = {};
    a = json.decode(response.body) as Map;

    return a;
  }
}
