import 'dart:convert' as convert;
import 'package:seasonal_worker_mobile/config/config.dart';
import 'package:http/http.dart' as http;
import 'package:seasonal_worker_mobile/models/ViewModels/employerInfo.dart';

import '../models/employerData.dart';

class APIEmployers {
  static Map<String, String> header = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
  };

  static Future<List<EmployerData>> getAllEmployers() async {
    String url = getAllEmployersUrl;
    final response = await http.get(Uri.parse(url));
    List<EmployerData> allEmployers = new List<EmployerData>();

    if (response.statusCode == 200) {
      var data = convert.jsonDecode(response.body);
      for (var employer in data) {
        allEmployers.add(EmployerData.fromObject(employer));
      }
      return allEmployers;
    } else
      return null;
  }

  static Future<EmployerInfo> getEmployerInfoById(int id) async {
    String url = getEmployerDataUrl + "/" + id.toString();
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var data = convert.jsonDecode(response.body);
      EmployerInfo employerInfo = EmployerInfo.fromObject(data);
      return employerInfo;
    } else
      return null;
  }

  static Future<bool> registration(EmployerData employer) async {
    var url = registerEmployerUrl;
    print(url);
    var data2 = employer.toMap();
    var jsonBody = convert.jsonEncode(data2);
    var res = await http.post(Uri.parse(url),
        headers: header = {
          'Content-type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonBody);

    if (res.body == 'true')
      return true;
    else
      return false;
  }

  static Future<bool> changeEmployerData(
      int id,
      String employerName,
      String employerUsername,
      String employerPassword,
      String employerDescription,
      String profileImageUrl,
      String email,
      String phoneNumber,
      int employerTypeId,
      int cityId,
      int areaOfActivityId) async {
    String url = updateEmployerUrl;

    EmployerData employer = new EmployerData.id(
        id,
        employerName,
        employerUsername,
        employerPassword,
        employerDescription,
        profileImageUrl,
        email,
        phoneNumber,
        employerTypeId,
        cityId,
        areaOfActivityId);

    var data2 = employer.toMap();
    var jsonBody = convert.jsonEncode(data2);
    var res = await http.post(Uri.parse(url),
        headers: header = {
          'Content-type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonBody);

    if (res.body == 'true')
      return true;
    else
      return false;
  }

  static Future<bool> deleteEmployerById(int id) async {
    var urlEmployerById = deleteEmployerUrl + "/" + id.toString();

    var res = await http.delete(Uri.parse(urlEmployerById),
        headers: header = {
          'Content-type': 'application/json',
          'Accept': 'application/json',
        });

    return Future.value(res.statusCode == 201 ? true : false);
  }

  static Future<String> checkEmployer(String username, String password) async {
    String url = loginEmployerUrl;

    var data = Map();
    data['username'] = username;
    data['password'] = password;

    var jsonBody = convert.jsonEncode(data);
    var res = await http.post(Uri.parse(url), headers: header, body: jsonBody);
    String response = res.body.toString();
    if (res.statusCode != 200) return ('false');
    return response;
  }
}
