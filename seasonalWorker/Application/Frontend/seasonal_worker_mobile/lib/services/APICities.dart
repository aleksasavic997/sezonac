import 'dart:convert' as convert;
import 'package:seasonal_worker_mobile/config/config.dart';
import 'package:seasonal_worker_mobile/models/cityData.dart';
import 'package:http/http.dart' as http;

class APICities {
  static Map<String, String> header = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
  };

  static Future<List<CityData>> getAllCities() async {
    String url = getAllCitiesUrl;
    final response = await http.get(Uri.parse(url));
    List<CityData> allCities = new List<CityData>();

    if (response.statusCode == 200) {
      var data = convert.jsonDecode(response.body);
      for (var city in data) {
        allCities.add(CityData.fromObject(city));
      }
      return allCities;
    } else
      return null;
  }
}
