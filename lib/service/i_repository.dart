import 'dart:io';

import 'package:service_request/service/manager/path_manager.dart';
import 'package:service_request/service/model/service_model.dart';

abstract class IRepository<T extends ServiceModel> with PathManager<T> {
  Future<bool> postData(T data) async {
    final response = await dio.post(path, data: data.toJson());
    return response.statusCode == HttpStatus.created;
  }

  Future<List<T>?> fetchData() async {
    final response = await dio.get(path);
    if (response.statusCode != HttpStatus.ok) return null;
    final datas = response.data;
    if (datas is List) return datas.map((e) => fromJson(e)).toList();
    return null;
  }
}
