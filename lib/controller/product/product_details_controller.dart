import 'package:get/get.dart';
import 'package:trendify_app/data/model/product_model.dart';

import '../../core/class/my_class.dart';
import '../../core/class/status_request.dart';
import '../../core/constant/app_link_api.dart';
import '../../core/constant/app_routes.dart';
import '../../core/functions/handling_data.dart';

abstract class ProductDetailsController extends GetxController {
  void getProductDetails();
  void goToReviewsProduct();
  void changeSelectedIndex(int index);
  void changeSelectedSize(int index);
}

class ProductDetailsControllerImp extends ProductDetailsController {
  ProductModel? product;
  late String productId;
  RxInt item = 0.obs;
  RxInt itemSize=0.obs;
  MyClass myClass = Get.find<MyClass>();
  StatusRequest statusRequest = StatusRequest.init;
  static ProductDetailsControllerImp get instance => Get.find();

  @override
  goToReviewsProduct() {
    Get.toNamed(AppRoutes.productReviews,arguments: {"productId":product?.sId});
  }

  @override
  void getProductDetails() async {
    try {
      statusRequest = StatusRequest.loading;
      update();
      var response = await myClass.getData(
        "${AppLinkApi.productDetails}/$productId",
      );
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response['data'] is Map<String, dynamic>) {
          product = ProductModel.fromJson(response['data']);
        } else if (response['data'] is List && response['data'].isNotEmpty) {
          product = ProductModel.fromJson(response['data'][0]);
        }
      }
      update();
    } catch (e) {
      statusRequest = StatusRequest.serverfailure;
      update();
    }
  }

  @override
  void onInit() {
    productId = Get.arguments['productId'];
    getProductDetails();
    super.onInit();
  }

  @override
  void changeSelectedIndex(int index) {
    item.value = index;
  }
  
  @override
  void changeSelectedSize(int index) {
    itemSize.value=index;
  }
}
