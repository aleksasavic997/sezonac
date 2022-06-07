class JobAdvertisementData {
  int /*?*/ id;
  DateTime advertisementStartDate;
  DateTime /*?*/ advertisementExpiryDate;
  String /*?*/ advertisementTitle;
  String /*?*/ advertisementDescription;
  bool offeredAccomodation;
  bool /*?*/ offeredFood;
  double /*?*/ salaryFrom;
  double /*?*/ salaryTo;
  int seasonalWorkDurationInDays;
  String methodOfPayment;
  DateTime workingStartDate;
  DateTime workingEndDate;
  int jobId;
  int employerId;
  int /*?*/ cityId;

  int /*?*/ get getId => id;

  set setId(int id) => this.id = id;

  DateTime get getAdvertisementStartDate => advertisementStartDate;

  set setAdvertisementStartDate(DateTime advertisementStartDate) =>
      this.advertisementStartDate = advertisementStartDate;

  DateTime get getAdvertisementExpiryDate => advertisementExpiryDate;

  set setAdvertisementExpiryDate(DateTime advertisementExpiryDate) =>
      this.advertisementExpiryDate = advertisementExpiryDate;

  String get getAdvertisementTitle => advertisementTitle;

  set setAdvertisementTitle(String advertisementTitle) =>
      this.advertisementTitle = advertisementTitle;

  String get getAdvertisementDescription => advertisementDescription;

  set setAdvertisementDescription(String advertisementDescription) =>
      this.advertisementDescription = advertisementDescription;

  bool /*?*/ get getOfferedAccomodation => offeredAccomodation;

  set setOfferedAccomodation(bool offeredAccomodation) =>
      this.offeredAccomodation = offeredAccomodation;

  bool /*?*/ get getOfferedFood => offeredFood;

  set setOfferedFood(bool offeredFood) => this.offeredFood = offeredFood;

  double /*?*/ get getSalaryFrom => salaryFrom;

  set setSalaryFrom(double salaryFrom) => this.salaryFrom = salaryFrom;

  double /*?*/ get getSalaryTo => salaryTo;

  set setSalaryTo(double salaryTo) => this.salaryTo = salaryTo;

  int /*?*/ get getSeasonalWorkDurationInDays => seasonalWorkDurationInDays;

  set setSeasonalWorkDurationInDays(int seasonalWorkDurationInDays) =>
      this.seasonalWorkDurationInDays = seasonalWorkDurationInDays;

  String get getMethodOfPayment => methodOfPayment;

  set setMethodOfPayment(String methodOfPayment) =>
      this.methodOfPayment = methodOfPayment;

  DateTime get getWorkingStartDate => workingStartDate;

  set setWorkingStartDate(DateTime workingStartDate) =>
      this.workingStartDate = workingStartDate;

  DateTime get getWorkingEndDate => workingEndDate;

  set setWorkingEndDate(DateTime workingEndDate) =>
      this.workingEndDate = workingEndDate;

  int /*?*/ get getJobId => jobId;

  set setJobId(int jobId) => this.jobId = jobId;

  int /*?*/ get getEmployerId => employerId;

  set setEmployerId(int employerId) => this.employerId = employerId;

  int /*?*/ get getCityId => cityId;

  set setCityId(int cityId) => this.cityId = cityId;

  JobAdvertisementData(
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
    cityId,
  ) {
    this.advertisementStartDate = advertisementStartDate;
    this.advertisementExpiryDate = advertisementExpiryDate;
    this.advertisementTitle = advertisementTitle;
    this.advertisementDescription = advertisementDescription;
    this.offeredAccomodation = offeredAccomodation;
    this.offeredFood = offeredFood;
    this.salaryFrom = salaryFrom;
    this.salaryTo = salaryTo;
    this.seasonalWorkDurationInDays = seasonalWorkDurationInDays;
    this.methodOfPayment = methodOfPayment;
    this.workingStartDate = workingStartDate;
    this.workingEndDate = workingEndDate;
    this.employerId = employerId;
    this.cityId = cityId;
    this.jobId = jobId;
  }

  JobAdvertisementData.id(
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
      cityId) {
    this.id = id;
    this.advertisementStartDate = advertisementStartDate;
    this.advertisementExpiryDate = advertisementExpiryDate;
    this.advertisementTitle = advertisementTitle;
    this.advertisementDescription = advertisementDescription;
    this.offeredAccomodation = offeredAccomodation;
    this.offeredFood = offeredFood;
    this.salaryFrom = salaryFrom;
    this.salaryTo = salaryTo;
    this.seasonalWorkDurationInDays = seasonalWorkDurationInDays;
    this.methodOfPayment = methodOfPayment;
    this.workingStartDate = workingStartDate;
    this.workingEndDate = workingEndDate;
    this.employerId = employerId;
    this.cityId = cityId;
    this.jobId = jobId;
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (id != null) map['id'] = id;
    map['advertisementStartDate'] = advertisementStartDate;
    map['advertisementExpiryDate'] = advertisementExpiryDate;
    map['advertisementTitle'] = advertisementTitle;
    map['advertisementDescription'] = advertisementDescription;
    map['offeredAccomodation'] = offeredAccomodation;
    map['offeredFood'] = offeredFood;
    map['salaryFrom'] = salaryFrom;
    map['salaryTo'] = salaryTo;
    map['seasonalWorkDurationInDays'] = seasonalWorkDurationInDays;
    map['methodOfPayment'] = methodOfPayment;
    map['workingStartDate'] = workingStartDate;
    map['workingEndDate'] = workingEndDate;
    map['employerId'] = employerId;
    map['cityId'] = cityId;
    map['jobId'] = jobId;
    return map;
  }

  JobAdvertisementData.fromObject(dynamic o) {
    this.id = o['id'];
    this.advertisementStartDate = o['advertisementStartDate'];
    this.advertisementExpiryDate = o['advertisementExpiryDate'];
    this.advertisementTitle = o['advertisementTitle'];
    this.advertisementDescription = o['advertisementDescription'];
    this.offeredAccomodation = o['offeredAccomodation'];
    this.offeredFood = o['offeredFood'];
    this.salaryFrom = o['salaryFrom'];
    this.salaryTo = o['salaryTo'];
    this.seasonalWorkDurationInDays = o['seasonalWorkDurationInDays'];
    this.methodOfPayment = o['methodOfPayment'];
    this.workingStartDate = o['workingStartDate'];
    this.workingEndDate = o['workingEndDate'];
    this.employerId = o['employerId'];
    this.cityId = o['cityId'];
    this.jobId = o['jobId'];
  }
  static Map<String, String> header = {
    'Content-type': 'application/json',
    'Accept': 'application/json'
  };
}
