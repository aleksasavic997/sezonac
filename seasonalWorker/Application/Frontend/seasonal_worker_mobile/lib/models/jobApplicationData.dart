class JobApplicationData {
  int id;
  int jobAdvertisementId;
  int workerId;
  String motivationalLetter;

  int get getId => id;

  set setId(int id) => this.id = id;

  int get getJobAdvertisementId => jobAdvertisementId;

  set setJobAdvertisementId(int jobAdvertisementId) => this.jobAdvertisementId = jobAdvertisementId;

  int get getWorkerId => workerId;

  set setWorkerId(int workerId) => this.workerId = workerId;

  String get getMotivationalLetter => motivationalLetter;

  set setMotivationalLetter(String motivationalLetter) => this.motivationalLetter = motivationalLetter;


  JobApplicationData(jobAdvertisementId, workerId, motivationalLetter) {
    this.jobAdvertisementId = jobAdvertisementId;
    this.workerId = workerId;
    this.motivationalLetter = motivationalLetter;
  }

  JobApplicationData.id(id, jobAdvertisementId, workerId, motivationalLetter) {
    this.id = id;
    this.jobAdvertisementId = jobAdvertisementId;
    this.workerId = workerId;
    this.motivationalLetter = motivationalLetter;
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (id != null) map['id'] = id;
    map['jobAdvertisementId'] = jobAdvertisementId;
    map['workerId'] = workerId;
    map['motivationalLetter'] = motivationalLetter;
    return map;
  }

  JobApplicationData.fromObject(dynamic o) {
    this.id = o['id'];
    this.jobAdvertisementId = o['jobAdvertisementId'];
    this.workerId = o['workerId'];
    this.motivationalLetter = o['motivationalLetter'];
  }
  static Map<String, String> header = {
    'Content-type': 'application/json',
    'Accept': 'application/json'
  };
}
