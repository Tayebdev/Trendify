import 'package:get/get.dart';
import 'package:trendify_app/core/constant/app_routes.dart';
import 'package:trendify_app/data/model/product_model.dart';

import '../../core/class/my_class.dart';
import '../../core/class/status_request.dart';
import '../../core/constant/app_link_api.dart';
import '../../core/functions/handling_data.dart';

abstract class ProductController extends GetxController {
  void goToDetailsProduct(String productId);
  void getAllProduct();
}

class ProductControllerImp extends ProductController {
  static ProductControllerImp get instance => Get.find();
  MyClass myClass = Get.find<MyClass>();
  StatusRequest statusRequest = StatusRequest.init;
  List<ProductModel> productList = [];

  @override
  goToDetailsProduct(productId) {
    Get.toNamed(AppRoutes.productDetails, arguments: {"productId": productId});
  }

  @override
  void getAllProduct() async {
    try {
      statusRequest = StatusRequest.loading;
      var product = await myClass.getData(AppLinkApi.product);
      statusRequest = handlingData(product);
      if (statusRequest == StatusRequest.success && product["result"] > 0) {
        productList.addAll(
          (product['data'] as List)
              .map((value) => ProductModel.fromJson(value))
              .toList(),
        );
      }
      update();
    } catch (e) {
      statusRequest = StatusRequest.serverfailure;
      update();
    }
  }

  @override
  void onInit() async {
    getAllProduct();
    super.onInit();
  }
}
