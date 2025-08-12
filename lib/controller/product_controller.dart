import 'package:get/get.dart';
import 'package:trendify_app/core/constant/app_routes.dart';

abstract class ProductController extends GetxController {
  goToDetailsProduct();
}

class ProductControllerImp extends ProductController {
  @override
  goToDetailsProduct() {
    Get.toNamed(AppRoutes.productDetails);
  }
}
