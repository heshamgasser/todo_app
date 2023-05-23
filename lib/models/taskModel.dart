class TaskModel {
  String id;
  String title;
  String detail;
  int startDate;

  // String startTime;
  // int endDate;
  // String endTime;
  bool status;

  TaskModel(
      {this.id = '',
      required this.title,
      required this.detail,
      required this.startDate,
      // required this.startTime,
      // required this.endDate,
      // required this.endTime,
      required this.status});

  TaskModel.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id'],
          title: json['title'],
          detail: json['detail'],
          startDate: json['startDate'],
          // startTime: json['startTime'],
          // endDate: json['endDate'],
          // endTime: json['endTime'],
          status: json['status'],
        );

  //  TaskModel fromJson(Map<String, dynamic> json) {
  //   TaskModel taskModel = TaskModel(
  //     id: json['id'],
  //     title: json['title'],
  //     detail: json['detail'],
  //     startDate: json['startDate'],
  //     startTime: json['startTime'],
  //     endDate: json['endDate'],
  //     endTime: json['endTime'],
  //     status: json['status'],
  //   );
  //   return taskModel;
  // }

  Map<String, dynamic> tojson() {
    return {
      "id": id,
      "title": title,
      "detail": detail,
      "startDate": startDate,
      // "startTime": startTime,
      // "endDate": endDate,
      // "endTime": endTime,
      "status": status,
    };
  }
}
