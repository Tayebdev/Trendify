import 'package:get/get.dart';
import 'package:trendify_app/controller/cart_controller.dart';
import 'package:trendify_app/core/constant/app_routes.dart';

abstract class OrderReviewController extends GetxController {
  void goToPaymentSuccess();
}

class OrderReviewControllerImp extends OrderReviewController {
  static final controllerCart = CartControllerImp.instance;
  int? lengthCart;
  @override
  goToPaymentSuccess() {
    Get.toNamed(AppRoutes.paymentSuccess);
  }

  @override
  void onInit() {
    controllerCart.getLoggedUserCart();
    lengthCart=controllerCart.cartList[0].cartItems!.length;
    super.onInit();
  }
}
