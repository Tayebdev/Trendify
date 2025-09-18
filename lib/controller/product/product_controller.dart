import 'package:get/get.dart';
import 'package:trendify_app/controller/wish_list_controller.dart';
import 'package:trendify_app/core/constant/app_routes.dart';
import 'package:trendify_app/data/model/product_model.dart';

import '../../core/class/my_class.dart';
import '../../core/class/status_request.dart';
import '../../core/constant/app_link_api.dart';
import '../../core/functions/handling_data.dart';
import '../../core/services/app_services.dart';
import '../../utils/helpers/function_helpers.dart';
import '../../utils/popups/full_screen_loader.dart';

abstract class ProductController extends GetxController {
  void goToDetailsProduct(String productId);
  void getAllProduct();
  bool isFavorite(String productId);
  void toggleFavorite(String productId);
}

class ProductControllerImp extends ProductController {
  late String userId;
  static ProductControllerImp get instance => Get.find();
  MyClass myClass = Get.find<MyClass>();
  StatusRequest statusRequest = StatusRequest.init;
  AppServices appServices = Get.find<AppServices>();
  List<ProductModel> productList = [];
  var favorites = <String>{}.obs;

  @override
  void goToDetailsProduct(String productId) {
    Get.toNamed(AppRoutes.productDetails, arguments: {"productId": productId});
  }

  @override
  void getAllProduct() async {
    try {
      statusRequest = StatusRequest.loading;
      update();

      var product = await myClass.getData(AppLinkApi.product);
      statusRequest = handlingData(product);
      if (statusRequest == StatusRequest.success && product["result"] > 0) {
        productList.assignAll(
          (product['data'] as List)
              .map((value) => ProductModel.fromJson(value))
              .toList(),
        );
        favorites.addAll(
          productList.where((p) => p.isFavorite == true).map((p) => p.sId!),
        );
      }
    } catch (e) {
      statusRequest = StatusRequest.serverfailure;
    }
    update();
  }

  @override
  void onInit() {
    userId = appServices.sharedPref.getString("userId")!;
    getAllProduct();
    super.onInit();
  }

  @override
  bool isFavorite(String productId) {
    return favorites.contains(productId);
  }

  @override
  void toggleFavorite(String productId) async {
    try {
      final index = productList.indexWhere((p) => p.sId == productId);
      if (index == -1) return;

      if (favorites.contains(productId)) {
        favorites.remove(productId);
        productList[index].isFavorite = false;
        update();

        final response = await myClass.deleteData(
          "${AppLinkApi.favoriteDelete}/$productId",
        );
        var statusRequestFav = handlingData(response);
        if (statusRequestFav == StatusRequest.success) {
          AppHelperFunctions.customToast(message: "Removed from favorites");
        }
      } else {
        favorites.add(productId);
        productList[index].isFavorite = true;
        update();

        final response = await myClass.postData(AppLinkApi.favoriteAdd, {
          "userId": userId,
          "productId": productId,
        });
        var statusRequestFav = handlingData(response);
        if (statusRequestFav == StatusRequest.success) {
          AppHelperFunctions.customToast(message: "Added to favorites");
        }
      }
      final controller = Get.put(WishListControllerImp());
      controller.getAllfavoritefavorite();
    } catch (e) {
      AppFullScreenLoader.stopLoading();
      AppHelperFunctions.errorSnackBar(
        title: "Error",
        message: "Something went wrong. Please try again later.",
      );
    }
  }
}
