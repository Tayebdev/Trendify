import 'package:get/get.dart';
import 'package:trendify_app/data/model/product_model.dart';

import '../../core/class/my_class.dart';
import '../../core/class/status_request.dart';
import '../../core/constant/app_link_api.dart';
import '../../core/constant/app_routes.dart';
import '../../core/functions/handling_data.dart';
import '../../core/services/app_services.dart';
import '../../utils/helpers/function_helpers.dart';
import '../../utils/popups/full_screen_loader.dart';

abstract class ProductDetailsController extends GetxController {
  void getProductDetails();
  void goToReviewsProduct();
  void changeSelectedIndex(int index);
  void changeSelectedSize(int index);
  bool isFavorite(String productId);
  void toggleFavorite(String productId);
}

class ProductDetailsControllerImp extends ProductDetailsController {
  late String userId;
  ProductModel? product;
  late String productId;
  RxInt item = 0.obs;
  RxInt itemSize = 0.obs;
  MyClass myClass = Get.find<MyClass>();
  AppServices appServices = Get.find<AppServices>();
  StatusRequest statusRequest = StatusRequest.init;
  var favorites = <String>{}.obs;
  static ProductDetailsControllerImp get instance => Get.find();

  @override
  goToReviewsProduct() {
    Get.toNamed(
      AppRoutes.productReviews,
      arguments: {"productId": product?.sId},
    );
  }

  @override
  void getProductDetails() async {
    try {
      statusRequest = StatusRequest.loading;
      update();
      var response = await myClass.getData(
        "${AppLinkApi.productDetails}/$productId",
      );
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response['data'] is Map<String, dynamic>) {
          product = ProductModel.fromJson(response['data']);
        } else if (response['data'] is List && response['data'].isNotEmpty) {
          product = ProductModel.fromJson(response['data'][0]);
        }
      }
      update();
    } catch (e) {
      statusRequest = StatusRequest.serverfailure;
      update();
    }
  }

  @override
  void onInit() {
    productId = Get.arguments['productId'];
    userId = appServices.sharedPref.getString("userId")!;
    getProductDetails();
    super.onInit();
  }

  @override
  void changeSelectedIndex(int index) {
    item.value = index;
  }

  @override
  void changeSelectedSize(int index) {
    itemSize.value = index;
  }

  @override
  bool isFavorite(String productId) {
    return favorites.contains(productId);
  }

  @override
  void toggleFavorite(String productId) async {
    try {
      if (favorites.contains(productId)) {
        favorites.remove(productId);
        final response = await myClass.deleteData(
          "${AppLinkApi.favoriteDelete}/$productId",
        );
        var statusRequestFav = handlingData(response);
        if (statusRequestFav == StatusRequest.success) {
          AppHelperFunctions.customToast(message: "Removed from favorites");
        }
      } else {
        favorites.add(productId);
        final response = await myClass.postData(AppLinkApi.favoriteAdd, {
          "userId": userId,
          "productId": productId,
        });

        var statusRequestFav = handlingData(response);
        if (statusRequestFav == StatusRequest.success) {
          AppHelperFunctions.customToast(message: "Added to favorites");
        }
      }
    } catch (e) {
      AppFullScreenLoader.stopLoading();
      AppHelperFunctions.errorSnackBar(
        title: "Error",
        message: "Something went wrong. Please try again later.",
      );
    }
  }
}
