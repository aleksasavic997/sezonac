import '../models/jobApplicationData.dart';
import 'dart:convert' as convert;
import 'package:seasonal_worker_mobile/config/config.dart';
import 'package:http/http.dart' as http;

class APIJobApplication {
  static Map<String, String> header = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
  };

  static Future<JobApplicationData> getJobApplicationById(int id) async {
    String url = getJobApplicationByIdUrl + "/" + id.toString();
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var data = convert.jsonDecode(response.body);
      JobApplicationData jobApplicationData =
          JobApplicationData.fromObject(data);
      return jobApplicationData;
    } else
      return null;
  }

  static Future<bool> addJobApplication(
      JobApplicationData jobApplicationData) async {
    var url = addJobApplicationUrl;
    var data2 = jobApplicationData.toMap();
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

  static Future<bool> changeJobApplication(int id, int jobAdvertisementId,
      int workerId, String motivationalLetter) async {
    String url = updateJobApplicationUrl;

    JobApplicationData jobApplicationData = new JobApplicationData.id(
        id, jobAdvertisementId, workerId, motivationalLetter);

    var data2 = jobApplicationData.toMap();
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

  static Future<bool> deleteJobApplicationById(int id) async {
    var url = deleteJobApplicationUrl + "/" + id.toString();

    var res = await http.delete(Uri.parse(url),
        headers: header = {
          'Content-type': 'application/json',
          'Accept': 'application/json',
        });

    return Future.value(res.statusCode == 201 ? true : false);
  }
}
