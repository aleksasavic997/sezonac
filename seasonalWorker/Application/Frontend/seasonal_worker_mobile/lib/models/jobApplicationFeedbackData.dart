class JobApplicationFeedbackData {
  int id;
  bool accepted;
  String comment;
  int jobApplicationId;

  int get getId => id;

  set setId(int id) => this.id = id;

  int get getJobApplicationId => jobApplicationId;

  set setJobApplicationId(int jobApplicationId) =>
      this.jobApplicationId = jobApplicationId;

  bool get getAccepted => accepted;

  set setAccepted(bool accepted) => this.accepted = accepted;

  String get getComment => comment;

  set setComment(String comment) => this.comment = comment;

  JobApplicationFeedbackData(accepted, comment, jobApplicationId) {
    this.accepted = accepted;
    this.comment = comment;
    this.jobApplicationId = jobApplicationId;
  }

  JobApplicationFeedbackData.id(id, accepted, comment, jobApplicationId) {
    this.id = id;
    this.accepted = accepted;
    this.comment = comment;
    this.jobApplicationId = jobApplicationId;
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (id != null) map['id'] = id;
    map['accepted'] = accepted;
    map['comment'] = comment;
    map['jobApplicationId'] = jobApplicationId;
    return map;
  }

  JobApplicationFeedbackData.fromObject(dynamic o) {
    this.id = o['id'];
    this.accepted = o['accepted'];
    this.comment = o['comment'];
    this.jobApplicationId = o['jobApplicationId'];
  }
  static Map<String, String> header = {
    'Content-type': 'application/json',
    'Accept': 'application/json'
  };
}
