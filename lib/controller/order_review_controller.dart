import 'package:get/get.dart';
import 'package:trendify_app/core/constant/app_routes.dart';

abstract class OrderReviewController extends GetxController {
  void goToPaymentSuccess();
}

class OrderReviewControllerImp extends OrderReviewController {
  @override
  goToPaymentSuccess() {
    Get.toNamed(AppRoutes.paymentSuccess);
  }
}
