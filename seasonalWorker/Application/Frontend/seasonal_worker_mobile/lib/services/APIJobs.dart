import 'dart:convert' as convert;
import 'package:seasonal_worker_mobile/config/config.dart';
import 'package:http/http.dart' as http;
import 'package:seasonal_worker_mobile/models/jobData.dart';

class APICities {
  static Map<String, String> header = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
  };

  static Future<List<JobData>> getAllJobs() async {
    String url = getAllJobsUrl;
    final response = await http.get(Uri.parse(url));
    List<JobData> allJobs = new List<JobData>();

    if (response.statusCode == 200) {
      var data = convert.jsonDecode(response.body);
      for (var job in data) {
        allJobs.add(JobData.fromObject(job));
      }
      return allJobs;
    } else
      return null;
  }
}
