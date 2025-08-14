import 'package:get/get.dart';
import 'package:trendify_app/core/constant/app_routes.dart';

abstract class CartController extends GetxController {
  goToOrderReview();
}

class CartControllerImp extends CartController {
  @override
  goToOrderReview() {
    Get.toNamed(AppRoutes.orderReview);
  }
}
