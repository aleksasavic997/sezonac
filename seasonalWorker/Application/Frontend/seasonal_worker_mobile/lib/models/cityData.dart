class CityData {
  int id;
  String cityName;
  int zip;
  String county;
  int countryId;

  int get getId => id;

  set setId(int id) => this.id = id;

  String get getCityName => cityName;

  set setCityName(String cityName) => this.cityName = cityName;

  int get getZip => zip;

  set setZip(int zip) => this.zip = zip;

  String get getCounty => county;

  set setCounty(String county) => this.county = county;

  int get getCountryId => countryId;

  set setCountryId(int countryId) => this.countryId = countryId;

  CityData(cityName, zip, county, countryId) {
    this.cityName = cityName;
    this.zip = zip;
    this.county = county;
    this.countryId = countryId;
  }

  CityData.id(id, cityName, zip, county, countryId) {
    this.id = id;
    this.cityName = cityName;
    this.zip = zip;
    this.county = county;
    this.countryId = countryId;
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (id != null) map['id'] = id;
    map['cityName'] = cityName;
    map['zip'] = zip;
    map['county'] = county;
    map['countryId'] = countryId;
    return map;
  }

  CityData.fromObject(dynamic o) {
    this.id = o['id'];
    this.cityName = o['cityName'];
    this.zip = o['zip'];
    this.county = o['county'];
    this.countryId = o['countryId'];
  }
  static Map<String, String> header = {
    'Content-type': 'application/json',
    'Accept': 'application/json'
  };
}
