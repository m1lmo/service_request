import 'package:service_request/service/model/service_model.dart';

final class Test with ServiceModel {
  final int? userId;
  final int? id;
  final String? title;
  final String? body;

  Test({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  factory Test.fromJson(Map<String, dynamic> json) => Test(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );
  @override
  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
      };

  @override
  String get key => 'test-$id';
}
