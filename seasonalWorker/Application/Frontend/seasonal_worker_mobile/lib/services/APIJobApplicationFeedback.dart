import 'dart:convert' as convert;
import 'package:seasonal_worker_mobile/config/config.dart';
import 'package:http/http.dart' as http;

import '../models/jobApplicationFeedbackData.dart';

class APIJobApplicationFeedback {
  static Map<String, String> header = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
  };

  static Future<JobApplicationFeedbackData> getJobApplicationFeedbackById(
      int id) async {
    String url = getJobApplicationFeedbackByIdUrl + "/" + id.toString();
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var data = convert.jsonDecode(response.body);
      JobApplicationFeedbackData jobApplicationFeedbackData =
          JobApplicationFeedbackData.fromObject(data);
      return jobApplicationFeedbackData;
    } else
      return null;
  }

  static Future<bool> addJobApplicationFeedback(
      JobApplicationFeedbackData jobApplicationFeedbackData) async {
    var url = addJobApplicationFeedbackUrl;
    var data2 = jobApplicationFeedbackData.toMap();
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

  static Future<bool> changeJobApplicationFeedback(int id,
      int jobAdvertisementId, int workerId, String motivationalLetter) async {
    String url = updateJobApplicationFeedbackUrl;

    JobApplicationFeedbackData jobApplicationData =
        new JobApplicationFeedbackData.id(
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

  static Future<bool> deleteJobApplicationFeedbackById(int id) async {
    var url = deleteJobApplicationFeedbackUrl + "/" + id.toString();

    var res = await http.delete(Uri.parse(url),
        headers: header = {
          'Content-type': 'application/json',
          'Accept': 'application/json',
        });

    return Future.value(res.statusCode == 201 ? true : false);
  }
}
