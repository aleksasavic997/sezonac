import 'dart:convert' as convert;
import 'package:seasonal_worker_mobile/config/config.dart';
import 'package:http/http.dart' as http;
import 'package:seasonal_worker_mobile/models/ViewModels/jobAdvertisementInfo.dart';
import '../models/jobAdvertisementData.dart';

class APIJobAdvertisements {
  static Map<String, String> header = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
  };

  static Future<List<JobAdvertisementData>> getAllJobAdvertisements() async {
    String url = getAllJobAdvertisementsUrl;
    final response = await http.get(Uri.parse(url));
    List<JobAdvertisementData> allJobAdvertisements =
        new List<JobAdvertisementData>();

    if (response.statusCode == 200) {
      var data = convert.jsonDecode(response.body);
      for (var jobAdvertisement in data) {
        allJobAdvertisements
            .add(JobAdvertisementData.fromObject(jobAdvertisement));
      }
      return allJobAdvertisements;
    } else
      return null;
  }

  static Future<JobAdvertisementData> getJobAdvertisementInfoById(
      int id) async {
    String url = getJobAdvertisementDataUrl + "/" + id.toString();
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var data = convert.jsonDecode(response.body);
      JobAdvertisementData jobAdvertisement =
          JobAdvertisementData.fromObject(data);
      return jobAdvertisement;
    } else
      return null;
  }

  static Future<bool> addJobAdvertisement(
      JobAdvertisementData jobAdvertisement) async {
    var url = addJobAdvertisementUrl;
    var data2 = jobAdvertisement.toMap();
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

  static Future<bool> changeJobAdvertisementData(
      int /*?*/ id,
      DateTime advertisementStartDate,
      DateTime /*?*/ advertisementExpiryDate,
      String /*?*/ advertisementTitle,
      String /*?*/ advertisementDescription,
      bool offeredAccomodation,
      bool /*?*/ offeredFood,
      double /*?*/ salaryFrom,
      double /*?*/ salaryTo,
      int seasonalWorkDurationInDays,
      String methodOfPayment,
      DateTime workingStartDate,
      DateTime workingEndDate,
      int jobId,
      int employerId,
      int /*?*/ cityId) async {
    String url = updateJobAdvertisementUrl;

    JobAdvertisementData jobAdvertisement = new JobAdvertisementData.id(
        id,
        advertisementStartDate,
        advertisementExpiryDate,
        advertisementTitle,
        advertisementDescription,
        offeredAccomodation,
        offeredFood,
        salaryFrom,
        salaryTo,
        seasonalWorkDurationInDays,
        methodOfPayment,
        workingStartDate,
        workingEndDate,
        jobId,
        employerId,
        cityId);

    var data2 = jobAdvertisement.toMap();
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

  static Future<bool> deleteJobAdvertisementById(int id) async {
    var urlJobAdvertisementById =
        deleteJobAdvertisementUrl + "/" + id.toString();

    var res = await http.delete(Uri.parse(urlJobAdvertisementById),
        headers: header = {
          'Content-type': 'application/json',
          'Accept': 'application/json',
        });

    return Future.value(res.statusCode == 201 ? true : false);
  }

  static Future<List<JobAdvertisementInfo>> getFilteredJobAdvertisement(
      int areaOfActivityID,
      int cityID,
      DateTime desiredStartDate,
      DateTime desiredEndDate,
      bool offeredFood,
      bool offeredAccomodation) async {
    var url = getFilteredJobAdvertisementURL +
        "/areaOfActivityID=" +
        areaOfActivityID.toString() +
        "/cityID=" +
        cityID.toString() +
        "/desiredStartDate=" +
        desiredStartDate.toString() +
        "/desiredEndDate=" +
        desiredEndDate.toString() +
        "/offeredFood=" +
        offeredFood.toString() +
        "/offeredAccomodation=" +
        offeredAccomodation.toString();

    List<Map<String, dynamic>> data2 = List<Map<String, dynamic>>();

    //if(data2 == null) data2 = categories;
    var jsonBody = convert.jsonEncode(data2);

    var res = await http.post(Uri.parse(url),
        headers: header = {
          'Content-type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonBody);

    List<JobAdvertisementInfo> jobAdvertisementList =
        new List<JobAdvertisementInfo>();

    if (res.statusCode == 200) {
      var data1 = convert.jsonDecode(res.body);

      for (var jobAdvertisement in data1) {
        jobAdvertisementList
            .add(JobAdvertisementInfo.fromObject(jobAdvertisement));
      }
      return jobAdvertisementList;
    }
    return null;
  }

  static Future<List<JobAdvertisementInfo>> getJobAdvertisementInfoByUserId(
      int employerId) async {
    String url = getJobAdvertisementByUserID + "/" + employerId.toString();
    List<Map<String, dynamic>> data2 = List<Map<String, dynamic>>();

    //if(data2 == null) data2 = categories;
    var jsonBody = convert.jsonEncode(data2);

    var res = await http.post(Uri.parse(url),
        headers: header = {
          'Content-type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonBody);

    List<JobAdvertisementInfo> jobAdvertisementList =
        new List<JobAdvertisementInfo>();

    if (res.statusCode == 200) {
      var data1 = convert.jsonDecode(res.body);

      for (var jobAdvertisement in data1) {
        jobAdvertisementList
            .add(JobAdvertisementInfo.fromObject(jobAdvertisement));
      }
      return jobAdvertisementList;
    }
    return null;
  }
}
