import 'package:get/get.dart';
import 'package:trendify_app/data/model/favorite_model.dart';

import '../core/class/my_class.dart';
import '../core/class/status_request.dart';
import '../core/constant/app_link_api.dart';
import '../core/constant/app_routes.dart';
import '../core/functions/handling_data.dart';
import '../core/services/app_services.dart';

abstract class WishListController extends GetxController {
  void getAllfavoritefavorite();
  void goToDetailsProduct(String productId);
}

class WishListControllerImp extends WishListController {
  late String userId;
  AppServices appServices = Get.find<AppServices>();
  MyClass myClass = Get.find<MyClass>();
  StatusRequest statusRequest = StatusRequest.init;
  List<FavoriteModel> favoriteList = [];

  @override
  void onInit() {
    userId = appServices.sharedPref.getString('userId')!;
    getAllfavoritefavorite();
    super.onInit();
  }

  @override
  void goToDetailsProduct(productId) {
    Get.toNamed(AppRoutes.productDetails, arguments: {"productId": productId});
  }

  @override
  void getAllfavoritefavorite() async {
    try {
      statusRequest = StatusRequest.loading;
      update();
      var favorite = await myClass.getData(
        "${AppLinkApi.favoriteList}/$userId",
      );
      statusRequest = handlingData(favorite);
      if (statusRequest == StatusRequest.success) {
        final data = favorite['data'];
        if (data != null && data is List && data.isNotEmpty) {
          favoriteList.assignAll(
            data.map((value) => FavoriteModel.fromJson(value)).toList(),
          );
        } else {
          favoriteList.clear();
        }
      }
    } catch (e) {
      statusRequest = StatusRequest.serverfailure;
    }
    update();
  }
}
