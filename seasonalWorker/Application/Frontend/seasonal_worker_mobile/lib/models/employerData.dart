class EmployerData {
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

  set setEmail(String email) => this.email = email;

  String /*?*/ get getEmail => email;

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

  EmployerData(
      employerName,
      employerUsername,
      employerPassword,
      employerDescription,
      profileImageUrl,
      email,
      phoneNumber,
      employerTypeId,
      cityId,
      areaOfActivityId) {
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
  }

  EmployerData.id(
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
      areaOfActivityId) {
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
    return map;
  }

  EmployerData.fromObject(dynamic o) {
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
  }
  static Map<String, String> header = {
    'Content-type': 'application/json',
    'Accept': 'application/json'
  };
}
