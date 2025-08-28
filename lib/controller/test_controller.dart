import 'package:get/get.dart';
import 'package:trendify_app/core/class/my_class.dart';
import 'package:trendify_app/core/class/status_request.dart';
import 'package:trendify_app/core/constant/app_link_api.dart';
import 'package:trendify_app/core/functions/handling_data.dart';

class TestController extends GetxController {
  MyClass myClass = Get.find<MyClass>();
  late StatusRequest statusRequest;
  List data = [];

getCategory() async {
  statusRequest = StatusRequest.loading;
  var category = await myClass.getData(AppLinkApi.category);
  statusRequest = handlingData(category);
  if (statusRequest == StatusRequest.success) {
    data.addAll(category['data']);
  }
  update();
}


  @override
  void onInit() {
    getCategory();
    super.onInit();
  }
}
