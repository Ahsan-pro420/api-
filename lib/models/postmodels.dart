class Postmodels {
  int? userId;
  int? id;
  String? title;
  String? body;

  Postmodels(
      {required this.userId,
      required this.id,
      required this.title,
      required this.body});

  Postmodels.fromJson(Map<dynamic, dynamic> json) {
    if (json["userId"] is int) this.userId = json["userId"];
    if (json["id"] is int) this.id = json["id"];
    if (json["title"] is String) this.title = json["title"];
    if (json["body"] is String) this.body = json["body"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["userId"] = this.userId;
    data["id"] = this.id;
    data["title"] = this.title;
    data["body"] = this.body;
    return data;
  }
}
