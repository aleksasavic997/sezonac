import 'package:seasonal_worker_mobile/config/config.dart';
import 'package:seasonal_worker_mobile/models/areaOfActivity.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class APIAreaOfActivities {
  static Map<String, String> header = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
  };

  static Future<List<AreaOfActivityData>> getAllAreaOfActivities() async {
    String url = getAllAreaOfActivitiesUrl;
    final response = await http.get(Uri.parse(url));
    List<AreaOfActivityData> allAreaOfActivities =
        new List<AreaOfActivityData>();

    if (response.statusCode == 200) {
      var data = convert.jsonDecode(response.body);
      for (var area in data) {
        allAreaOfActivities.add(AreaOfActivityData.fromObject(area));
      }
      return allAreaOfActivities;
    } else
      return null;
  }
}
