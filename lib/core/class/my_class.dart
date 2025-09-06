import 'package:get/get.dart';
import 'package:trendify_app/core/class/crud.dart';

class MyClass {
  Crud crud = Get.find<Crud>();

  Future<dynamic> postData(String url, Map<String, dynamic> data) async {
    var result = await crud.postDataRequest(url, data);
    return result.fold((left) => left, (right) => right);
  }

  Future<dynamic> getData(String url) async {
    var result = await crud.getDataRequest(url);
    return result.fold((left) => left, (right) => right);
  }

  Future<dynamic> deleteData(String url, Map<String, dynamic> data) async {
    var result = await crud.putDataRequest(url, {});
    return result.fold((left) => left, (right) => right);
  }

  Future<dynamic> putData(String url, Map<String, dynamic> data) async {
    var result = await crud.deleteDataRequest(url);
    return result.fold((left) => left, (right) => right);
  }
}
