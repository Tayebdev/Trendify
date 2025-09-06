import 'package:get/get.dart';
import 'package:trendify_app/core/constant/app_routes.dart';

abstract class StoreController extends GetxController{
  void goToAllBrands();
}

class StoreControllerImp extends StoreController {
  @override
  goToAllBrands() {
    Get.toNamed(AppRoutes.allBrands);
  }
}