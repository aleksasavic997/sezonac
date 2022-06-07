class JobData {
  int id;
  String jobName;
  String jobDescription;
  int categoryId;
  int areaOfActivityId;

  int get getId => id;

  set setId(int id) => this.id = id;

  String get getJobName => jobName;

  set setJobName(String jobName) => this.jobName = jobName;

  String get getJobDescription => jobDescription;

  set setJobDescription(String jobDescription) =>
      this.jobDescription = jobDescription;

  int get getCategoryId => categoryId;

  set setCategoryId(int categoryId) => this.categoryId = categoryId;

  int get getAreaOfActivityId => areaOfActivityId;

  set setAreaOfActivityId(int areaOfActivityId) =>
      this.areaOfActivityId = areaOfActivityId;

  JobData(jobName, jobDescription, categoryId, areaOfActivityId) {
    this.jobName = jobName;
    this.jobDescription = jobDescription;
    this.categoryId = categoryId;
    this.areaOfActivityId = areaOfActivityId;
  }

  JobData.id(id, jobName, jobDescription, categoryId, areaOfActivityId) {
    this.id = id;
    this.jobName = jobName;
    this.jobDescription = jobDescription;
    this.categoryId = categoryId;
    this.areaOfActivityId = areaOfActivityId;
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (id != null) map['id'] = id;
    map['jobName'] = jobName;
    map['jobDescription'] = jobDescription;
    map['categoryId'] = categoryId;
    map['areaOfActivityId'] = areaOfActivityId;
    return map;
  }

  JobData.fromObject(dynamic o) {
    this.id = o['id'];
    this.jobName = o['jobName'];
    this.jobDescription = o['jobDescription'];
    this.categoryId = o['categoryId'];
    this.areaOfActivityId = o['areaOfActivityId'];
  }
  static Map<String, String> header = {
    'Content-type': 'application/json',
    'Accept': 'application/json'
  };
}
