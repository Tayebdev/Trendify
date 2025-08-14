import 'package:get/get.dart';
import 'package:trendify_app/core/constant/app_routes.dart';

abstract class AddressController extends GetxController{
  goToAddNewAddress();
}

class AddressControllerImp extends AddressController {
  @override
  goToAddNewAddress() {
    Get.toNamed(AppRoutes.addNewAddress);
  }

}