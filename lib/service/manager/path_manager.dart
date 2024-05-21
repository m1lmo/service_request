import 'package:dio/dio.dart';
import 'package:service_request/service/model/service_model.dart';

 mixin PathManager<T extends ServiceModel> {
  Dio get dio;
  String get path;
  T Function(Map<String, dynamic> json) get fromJson;
  String baseUrl = 'https://jsonplaceholder.typicode.com';
}
