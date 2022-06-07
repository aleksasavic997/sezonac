class EmployerInfo {
  int /*?*/ id;
  String /*?*/ employerName;
  String /*?*/ employerUsername;
  String /*?*/ employerPassword;
  String employerDescription;
  String /*?*/ profileImageUrl;
  String /*?*/ email;
  String /*?*/ phoneNumber;
  int employerTypeId;
  int /*?*/ cityId;
  int areaOfActivityId;
  String cityName;
  String employerTypeName;
  String employerTypeDescription;
  String areaOfActivityName;

  int /*?*/ get getId => id;

  set setId(int id) => this.id = id;

  String get getEmployerName => employerName;

  set setEmployerName(String employerName) => this.employerName = employerName;

  String get getEmployerUsername => employerUsername;

  set setEmployerUsername(String employerUsername) =>
      this.employerUsername = employerUsername;

  String get getEmployerPassword => employerPassword;

  set setEmployerPassword(String employerPassword) =>
      this.employerPassword = employerPassword;

  String get getEmployerDescription => employerDescription;

  set setEmployerDescription(String employerDesription) =>
      this.employerDescription = employerDesription;

  String /*?*/ get getprofileImageUrl => profileImageUrl;

  set setprofileImageUrl(String profileImageUrl) =>
      this.profileImageUrl = profileImageUrl;

  String /*?*/ get getEmail => email;

  set setEmail(String email) => this.email = email;

  String /*?*/ get getPhoneNumber => phoneNumber;

  set setPhoneNumber(String phoneNumber) => this.phoneNumber = phoneNumber;

  int /*?*/ get getEmployerTypeId => employerTypeId;

  set setEmployerTypeId(int employerTypeId) =>
      this.employerTypeId = employerTypeId;

  int /*?*/ get getCityId => cityId;

  set setCityId(int cityId) => this.cityId = cityId;

  int /*?*/ get getAreaOfActivityId => areaOfActivityId;

  set setAreaOfActivityId(int areaOfActivityId) =>
      this.areaOfActivityId = areaOfActivityId;

  String /*?*/ get getCityName => cityName;

  set setCityName(String cityName) => this.cityName = cityName;

  String /*?*/ get getEmployerTypeName => employerTypeName;

  set setEmployerTypeName(String employerTypeName) =>
      this.employerTypeName = employerTypeName;

  String /*?*/ get getEmployerTypeDescription => employerTypeDescription;

  set setEmployerTypeDescription(String employerTypeDescription) =>
      this.employerTypeDescription = employerTypeDescription;

  String /*?*/ get getAreaOfActivityName => areaOfActivityName;

  set setAreaOfActivityName(String areaOfActivityName) =>
      this.areaOfActivityName = areaOfActivityName;

  EmployerInfo(
      employerName,
      employerUsername,
      employerPassword,
      employerDescription,
      profileImageUrl,
      email,
      phoneNumber,
      employerTypeId,
      cityId,
      areaOfActivityId,
      cityName,
      employerTypeName,
      employerTypeDescription,
      areaOfActivityName) {
    this.employerName = employerName;
    this.employerUsername = employerUsername;
    this.employerPassword = employerPassword;
    this.employerDescription = employerDescription;
    this.profileImageUrl = profileImageUrl;
    this.email = email;
    this.phoneNumber = phoneNumber;
    this.employerTypeId = employerTypeId;
    this.cityId = cityId;
    this.areaOfActivityId = areaOfActivityId;
    this.cityName = cityName;
    this.employerTypeName = employerTypeName;
    this.employerTypeDescription = employerTypeDescription;
    this.areaOfActivityName = areaOfActivityName;
  }

  EmployerInfo.id(
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
      areaOfActivityId,
      cityName,
      employerTypeName,
      employerTypeDescription,
      areaOfActivityName) {
    this.id = id;
    this.employerName = employerName;
    this.employerUsername = employerUsername;
    this.employerPassword = employerPassword;
    this.employerDescription = employerDescription;
    this.profileImageUrl = profileImageUrl;
    this.email = email;
    this.phoneNumber = phoneNumber;
    this.employerTypeId = employerTypeId;
    this.cityId = cityId;
    this.areaOfActivityId = areaOfActivityId;
    this.cityName = cityName;
    this.employerTypeName = employerTypeName;
    this.employerTypeDescription = employerTypeDescription;
    this.areaOfActivityName = areaOfActivityName;
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (id != null) map['id'] = id;
    map['employerName'] = employerName;
    map['employerUsername'] = employerUsername;
    map['employerPassword'] = employerPassword;
    map['employerDescription'] = employerDescription;
    map['profileImageUrl'] = profileImageUrl;
    map['email'] = email;
    map['phoneNumber'] = phoneNumber;
    map['employerTypeId'] = employerTypeId;
    map['cityId'] = cityId;
    map['areaOfActivityId'] = areaOfActivityId;
    map['cityName'] = cityName;
    map['employerTypeName'] = employerTypeName;
    map['employerTypeDescription'] = employerTypeDescription;
    map['areaOfActivityName'] = areaOfActivityName;
    return map;
  }

  EmployerInfo.fromObject(dynamic o) {
    this.id = o['id'];
    this.employerName = o['employerName'];
    this.employerUsername = o['employerUsername'];
    this.employerPassword = o['employerPassword'];
    this.employerDescription = o['employerDescription'];
    this.profileImageUrl = o['profileImageUrl'];
    this.email = o['email'];
    this.phoneNumber = o['phoneNumber'];
    this.employerTypeId = o['employerTypeId'];
    this.cityId = o['cityId'];
    this.areaOfActivityId = o['areaOfActivityId'];
    this.cityName = o['cityName'];
    this.employerTypeName = o['employerTypeName'];
    this.employerTypeDescription = o['employerTypeDescription'];
    this.areaOfActivityName = o['areaOfActivityName'];
  }
  static Map<String, String> header = {
    'Content-type': 'application/json',
    'Accept': 'application/json'
  };
}
