import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:service_request/service/test_model_repository.dart';

void main() {
  late final TestModelRepository testModelRepository;
  late final Dio dio;
  setUp(() {
    dio = Dio();
    testModelRepository = TestModelRepository(dio: dio);
    dio.options = BaseOptions(baseUrl: testModelRepository.baseUrl);
  });
  test('Test', () async {
    var tests = await testModelRepository.fetchData();
    if (tests?.isEmpty ?? true) return;
    expect('sunt aut facere repellat provident occaecati excepturi optio reprehenderit', tests![0].title);
  });
}
