import 'package:get/get.dart';
import 'package:trendify_app/core/constant/app_routes.dart';
import 'package:trendify_app/data/model/brand_model.dart';

import '../core/class/my_class.dart';
import '../core/class/status_request.dart';
import '../core/constant/app_link_api.dart';
import '../core/functions/handling_data.dart';
import '../utils/helpers/function_helpers.dart';

abstract class StoreController extends GetxController {
  void goToAllBrands();
  void getAllBrands();
}

class StoreControllerImp extends StoreController {
  //static StoreControllerImp get instance => Get.find();
  MyClass myClass = Get.find<MyClass>();
  StatusRequest statusRequest = StatusRequest.init;
  List<BrandModel> brandList = [];
  @override
  goToAllBrands() {
    Get.toNamed(AppRoutes.allBrands);
  }

  @override
  void getAllBrands() async{
        try {
      statusRequest = StatusRequest.loading;
      var brand = await myClass.getData(AppLinkApi.brand);
      statusRequest = handlingData(brand);
      if (statusRequest == StatusRequest.success && brand["result"] > 0) {
        brandList.addAll(
          (brand['data'] as List)
              .map((value) => BrandModel.fromJson(value))
              .toList(),
        );
      }
      update();
    } catch (e) {
      statusRequest=StatusRequest.serverfailure;
      AppHelperFunctions.errorSnackBar(
        title: "Error",
        message: "Something went wrong. Please try again later.",
      );
    }
  }
  @override
  void onInit() {
    getAllBrands();
    super.onInit();
  }
}
