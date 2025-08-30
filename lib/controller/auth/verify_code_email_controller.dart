import 'package:get/get.dart';
import 'package:trendify_app/core/constant/app_routes.dart';

abstract class VerifyCodeEmailController extends GetxController{
  goToForgetPassword();
  goToSuccesCreated();
}

class VerifyCodeEmailControllerImp extends VerifyCodeEmailController{
  @override
  goToForgetPassword() {
    Get.toNamed(AppRoutes.forgetPassword);
  }
  
  @override
  goToSuccesCreated() {
    Get.offAllNamed(AppRoutes.successCreated);
  }

}