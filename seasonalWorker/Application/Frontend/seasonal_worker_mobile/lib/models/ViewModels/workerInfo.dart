class WorkerInfo {
  int /*?*/ id;
  String /*?*/ firstName;
  String /*?*/ lastName;
  String /*?*/ username;
  String /*?*/ password;
  String /*?*/ sex;
  String /*?*/ profileImageUrl;
  String /*?*/ email;
  DateTime /*?*/ dateOfBirth;
  String /*?*/ cvUrl;
  String /*?*/ coverLetter;
  String /*?*/ phoneNumber;
  int /*?*/ cityId;
  String cityName;
  String countryName;

  int /*?*/ get getId => id;

  set setId(int id) => this.id = id;

  String /*?*/ get getName => firstName;

  set setName(String firstName) => this.firstName = firstName;

  String /*?*/ get getLastname => lastName;

  set setLastname(String lastName) => this.lastName = lastName;

  String /*?*/ get getUsername => username;

  set setUsername(String username) => this.username = username;

  String /*?*/ get getPassword => password;

  set setPassword(String password) => this.password = password;

  String /*?*/ get getEmail => email;

  set setEmail(String email) => this.email = email;

  int /*?*/ get getCityId => cityId;

  set setCityId(int cityId) => this.cityId = cityId;

  String /*?*/ get getPhoneNumber => phoneNumber;

  set setPhoneNumber(String phoneNumber) => this.phoneNumber = phoneNumber;

  String /*?*/ get getprofileImageUrl => profileImageUrl;

  set setprofileImageUrl(String profileImageUrl) =>
      this.profileImageUrl = profileImageUrl;

  DateTime /*?*/ get getDateOfBirth => dateOfBirth;

  set setDateOfBirth(DateTime dateOfBirth) => this.dateOfBirth = dateOfBirth;

  String /*?*/ get getSex => sex;

  set setSex(String sex) => this.sex = sex;

  String /*?*/ get getCvUrl => cvUrl;

  set setCvUrl(String cvUrl) => this.cvUrl = cvUrl;

  String /*?*/ get getCoverLetter => coverLetter;

  set setCoverLetter(String coverLetter) => this.coverLetter = coverLetter;

  String /*?*/ get getCityName => cityName;

  set setCityName(String cityName) => this.cityName = cityName;

  String get getCountryName => countryName;

  set setCountryName(String countryName) => this.countryName = countryName;

  WorkerInfo(
      firstName,
      lastName,
      username,
      password,
      sex,
      profileImageUrl,
      email,
      dateOfBirth,
      cvUrl,
      coverLetter,
      cityId,
      phoneNumber,
      cityName,
      countryName) {
    this.firstName = firstName;
    this.lastName = lastName;
    this.username = username;
    this.password = password;
    this.sex = sex;
    this.profileImageUrl = profileImageUrl;
    this.email = email;
    this.dateOfBirth = dateOfBirth;
    this.cvUrl = cvUrl;
    this.coverLetter = coverLetter;
    this.cityId = cityId;
    this.phoneNumber = phoneNumber;
    this.cityName = cityName;
    this.countryName = countryName;
  }

  WorkerInfo.id(
      id,
      firstName,
      lastName,
      username,
      password,
      sex,
      profileImageUrl,
      email,
      dateOfBirth,
      cvUrl,
      coverLetter,
      cityId,
      phoneNumber,
      cityName,
      countryName) {
    this.id = id;
    this.firstName = firstName;
    this.lastName = lastName;
    this.username = username;
    this.password = password;
    this.sex = sex;
    this.profileImageUrl = profileImageUrl;
    this.email = email;
    this.dateOfBirth = dateOfBirth;
    this.cvUrl = cvUrl;
    this.coverLetter = coverLetter;
    this.cityId = cityId;
    this.phoneNumber = phoneNumber;
    this.cityName = cityName;
    this.countryName = countryName;
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (id != null) map['id'] = id;
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['username'] = username;
    map['password'] = password;
    map['sex'] = sex;
    map['profileImageUrl'] = profileImageUrl;
    map['email'] = email;
    map['dateOfBirth'] = dateOfBirth;
    map['cvUrl'] = cvUrl;
    map['coverLetter'] = coverLetter;
    map['cityId'] = cityId;
    map['phoneNumber'] = phoneNumber;
    map['cityName'] = cityName;
    map['countryName'] = countryName;
    return map;
  }

  WorkerInfo.fromObject(dynamic o) {
    this.id = o['id'];
    this.firstName = o['firstName'];
    this.lastName = o['lastName'];
    this.username = o['username'];
    this.password = o['password'];
    this.sex = o['sex'];
    this.profileImageUrl = o['profileImageUrl'];
    this.email = o['email'];
    this.dateOfBirth = DateTime.tryParse(o['dateOfBirth']);
    this.cvUrl = o['cvUrl'];
    this.coverLetter = o['coverLetter'];
    this.cityId = o['cityId'];
    this.phoneNumber = o['phoneNumber'];
    this.cityName = o['cityName'];
    this.countryName = o['countryName'];
  }
  static Map<String, String> header = {
    'Content-type': 'application/json',
    'Accept': 'application/json'
  };
}
