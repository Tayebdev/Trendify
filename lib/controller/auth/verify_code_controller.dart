import 'package:get/get.dart';
import 'package:trendify_app/core/constant/app_routes.dart';

abstract class VerifyCodeController extends GetxController{
  goToForgetPassword();
  goToSuccesCreated();
}

class VerifyCodeControllerImp extends VerifyCodeController{
  @override
  goToForgetPassword() {
    Get.toNamed(AppRoutes.forgetPassword);
  }
  
  @override
  goToSuccesCreated() {
    Get.offAllNamed(AppRoutes.successCreated);
  }

}