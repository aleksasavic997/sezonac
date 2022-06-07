class AreaOfActivityData {
  int id;
  String areaOfActivityName;

  int get getId => id;

  set setId(int id) => this.id = id;

  String get getAreaOfActivityName => areaOfActivityName;

  set setAreaOfActivityName(String areaOfActivityName) =>
      this.areaOfActivityName = areaOfActivityName;

  AreaOfActivityData(areaOfActivityName) {
    this.areaOfActivityName = areaOfActivityName;
  }

  AreaOfActivityData.id(id, areaOfActivityName) {
    this.id = id;
    this.areaOfActivityName = areaOfActivityName;
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (id != null) map['id'] = id;
    map['areaOfActivityName'] = areaOfActivityName;
    return map;
  }

  AreaOfActivityData.fromObject(dynamic o) {
    this.id = o['id'];
    this.areaOfActivityName = o['areaOfActivityName'];
  }
  static Map<String, String> header = {
    'Content-type': 'application/json',
    'Accept': 'application/json'
  };
}
