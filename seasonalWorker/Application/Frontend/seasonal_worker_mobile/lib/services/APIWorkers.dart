import 'dart:convert' as convert;
import 'package:seasonal_worker_mobile/config/config.dart';
import 'package:seasonal_worker_mobile/models/workerData.dart';
import 'package:http/http.dart' as http;

import '../models/ViewModels/workerInfo.dart';

class APIWorkers {
  static Map<String, String> header = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
  };

  static Future<List<WorkerData>> getAllWorkers() async {
    String url = getAllWorkersUrl;
    final response = await http.get(Uri.parse(url));
    List<WorkerData> allWorkers = new List<WorkerData>();

    if (response.statusCode == 200) {
      var data = convert.jsonDecode(response.body);
      for (var worker in data) {
        allWorkers.add(WorkerData.fromObject(worker));
      }
      return allWorkers;
    } else
      return null;
  }

  static Future<WorkerInfo> getWorkerInfoById(int id) async {
    String url = getWorkerDataUrl + "/" + id.toString();
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var data = convert.jsonDecode(response.body);
      WorkerInfo workerInfo = WorkerInfo.fromObject(data);
      return workerInfo;
    } else
      return null;
  }

  static Future<bool> registration(WorkerData worker) async {
    String url = registerUrl;
    var data = worker.toMap();
    var jsonBody = convert.jsonEncode(data);
    await http.post(Uri.parse(url), headers: header, body: jsonBody);

    return true;
  }

  static Future<bool> changeWorkerData(
      int id,
      String firstName,
      String lastName,
      String username,
      String pass,
      bool sex,
      String profileImageUrl,
      String email,
      DateTime dateOfBirth,
      String cvUrl,
      String coverLetter,
      String phoneNumber,
      int cityId) async {
    String url = updateWorkerUrl;

    WorkerData worker = new WorkerData.id(
        id,
        firstName,
        lastName,
        username,
        pass,
        sex,
        profileImageUrl,
        email,
        dateOfBirth,
        cvUrl,
        coverLetter,
        phoneNumber,
        cityId);

    var data2 = worker.toMap();
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

  static Future<bool> deleteUserById(int id) async {
    var urlUserById = deleteWorkerUrl + "/" + id.toString();

    var res = await http.delete(Uri.parse(urlUserById),
        headers: header = {
          'Content-type': 'application/json',
          'Accept': 'application/json',
        });

    return Future.value(res.statusCode == 201 ? true : false);
  }

  static Future<Object> checkUser(String username, String password) async {
    String url = loginUrl;

    var data = Map();
    data['username'] = username;
    data['password'] = password;

    var jsonBody = convert.jsonEncode(data);
    var res = await http.post(Uri.parse(url), headers: header, body: jsonBody);
    String response = res.body.toString();
    if (res.statusCode != 200) {
      return false;
    }
    return response;
  }
}
