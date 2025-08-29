import 'package:get/get.dart';
import 'package:trendify_app/core/class/crud.dart';

class MyClass {
  Crud crud = Get.find<Crud>();

  postData(String url, Map<String, dynamic> data) async {
    var result = await crud.postDataRequest(url, data);
    return result.fold((left) => left, (right) => right);
  }

  getData(String url) async {
    var result = await crud.getDataRequest(url);
    return result.fold((left) => left, (right) => right);
  }

  deleteData(String url, Map<String, dynamic> data) async {
    var result = await crud.putDataRequest(url, {});
    return result.fold((left) => left, (right) => right);
  }

  putData(String url, Map<String, dynamic> data) async {
    var result = await crud.deleteDataRequest(url);
    return result.fold((left) => left, (right) => right);
  }
}
