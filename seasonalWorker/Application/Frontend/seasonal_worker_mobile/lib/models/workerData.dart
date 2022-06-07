class WorkerData {
  int /*?*/ id;
  String /*?*/ firstName;
  String /*?*/ lastName;
  String /*?*/ username;
  String /*?*/ pass;
  bool /*?*/ sex;
  String /*?*/ profileImageUrl;
  String /*?*/ email;
  DateTime /*?*/ dateOfBirth;
  String /*?*/ cvUrl;
  String /*?*/ coverLetter;
  String /*?*/ phoneNumber;
  int /*?*/ cityId;

  int /*?*/ get getId => id;

  set setId(int id) => this.id = id;

  String /*?*/ get getName => firstName;

  set setName(String firstName) => this.firstName = firstName;

  String /*?*/ get getLastname => lastName;

  set setLastname(String lastName) => this.lastName = lastName;

  String /*?*/ get getUsername => username;

  set setUsername(String username) => this.username = username;

  String /*?*/ get getPassword => pass;

  set setPassword(String pass) => this.pass = pass;

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

  bool /*?*/ get getSex => sex;

  set setSex(bool sex) => this.sex = sex;

  String /*?*/ get getCvUrl => cvUrl;

  set setCvUrl(String cvUrl) => this.cvUrl = cvUrl;

  String /*?*/ get getCoverLetter => coverLetter;

  set setCoverLetter(String coverLetter) => this.coverLetter = coverLetter;

  WorkerData(firstName, lastName, username, pass, sex, profileImageUrl,
      email, dateOfBirth, cvUrl, coverLetter, cityId, phoneNumber) {
    this.firstName = firstName;
    this.lastName = lastName;
    this.username = username;
    this.pass = pass;
    this.sex = sex;
    this.profileImageUrl = profileImageUrl;
    this.email = email;
    this.dateOfBirth = dateOfBirth;
    this.cvUrl = cvUrl;
    this.coverLetter = coverLetter;
    this.cityId = cityId;
    this.phoneNumber = phoneNumber;
  }

  WorkerData.id(
      id,
      firstName,
      lastName,
      username,
      pass,
      sex,
      profileImageUrl,
      email,
      dateOfBirth,
      cvUrl,
      coverLetter,
      cityId,
      phoneNumber) {
    this.id = id;
    this.firstName = firstName;
    this.lastName = lastName;
    this.username = username;
    this.pass = pass;
    this.sex = sex;
    this.profileImageUrl = profileImageUrl;
    this.email = email;
    this.dateOfBirth = dateOfBirth;
    this.cvUrl = cvUrl;
    this.coverLetter = coverLetter;
    this.cityId = cityId;
    this.phoneNumber = phoneNumber;
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (id != null) map['id'] = id;
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['username'] = username;
    map['pass'] = pass;
    map['sex'] = sex;
    map['profileImageUrl'] = profileImageUrl;
    map['email'] = email;
    map['dateOfBirth'] = dateOfBirth.toIso8601String();
    map['cvUrl'] = cvUrl;
    map['coverLetter'] = coverLetter;
    map['cityId'] = cityId;
    map['phoneNumber'] = phoneNumber;
    return map;
  }

  WorkerData.fromObject(dynamic o) {
    this.id = o['id'];
    this.firstName = o['firstName'];
    this.lastName = o['lastName'];
    this.username = o['username'];
    this.pass = o['pass'];
    this.sex = o['sex'];
    this.profileImageUrl = o['profileImageUrl'];
    this.email = o['email'];
    this.dateOfBirth = DateTime.tryParse(o['dateOfBirth']);
    this.cvUrl = o['cvUrl'];
    this.coverLetter = o['coverLetter'];
    this.cityId = o['cityId'];
    this.phoneNumber = o['phoneNumber'];
  }
  static Map<String, String> header = {
    'Content-type': 'application/json',
    'Accept': 'application/json'
  };
}
