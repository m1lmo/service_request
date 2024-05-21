import 'package:dio/src/dio.dart';
import 'package:service_request/models/test_model.dart';
import 'package:service_request/service/i_repository.dart';

final class TestModelRepository extends IRepository<Test> {
  TestModelRepository({required this.dio});
  @override
  final Dio dio;

  @override
  String get path => '/posts';

  @override
  Test Function(Map<String, dynamic> json) get fromJson => (json) => Test.fromJson(json);
}
