import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trendify_app/core/constant/app_routes.dart';
import 'package:trendify_app/core/services/app_services.dart';

import '../core/class/my_class.dart';
import '../core/class/status_request.dart';
import '../core/constant/app_link_api.dart';
import '../core/functions/handling_data.dart';
import '../utils/helpers/function_helpers.dart';

abstract class CartController extends GetxController {
  void goToOrderReview();
  void increaseCartItemQuantity();
  void decreaseCartItemQuantity();
  void addProductToCart(String color, String size, String productId);
}

class CartControllerImp extends CartController {
  RxInt quantitySelected = 1.obs;
  late String userId;
  AppServices appServices = Get.find<AppServices>();
  MyClass myClass = Get.find<MyClass>();
  StatusRequest statusRequest = StatusRequest.init;

  @override
  goToOrderReview() {
    Get.toNamed(AppRoutes.orderReview);
  }

  @override
  void decreaseCartItemQuantity() {
    if (quantitySelected > 1) {
      quantitySelected--;
      update();
    }
  }

  @override
  void increaseCartItemQuantity() {
    quantitySelected++;
    update();
  }

  @override
  void onInit() {
    userId = appServices.sharedPref.getString("userId")!;
    super.onInit();
  }

  @override
  void addProductToCart(
    color,
    size,
    productId, {
    VoidCallback? resetSelection,
  }) async {
    try {
      statusRequest = StatusRequest.loading;
      update();

      final response = await myClass.postData(AppLinkApi.addProductToCart, {
        "userId": userId,
        "productId": productId,
        "color": color,
        "size": size,
        "quantity": quantitySelected.value,
      });

      statusRequest = handlingData(response);

      if (statusRequest == StatusRequest.success) {
        if (response["status"] == "success") {
          AppHelperFunctions.customToast(
            duration: 5,
            message: "Product added to cart successfully !",
          );
          quantitySelected.value = 1;
          resetSelection?.call();
          Get.toNamed(AppRoutes.navigationMenu);
        } else {
          AppHelperFunctions.warningSnackBar(
            title: "Oops!",
            message: "Failed to add product to cart.",
          );
        }
      } else {
        AppHelperFunctions.warningSnackBar(
          title: "Oops!",
          message: "Unable to process your request. Please try again.",
        );
      }

      update();
    } catch (e) {
      AppHelperFunctions.errorSnackBar(
        title: "Error",
        message: "Something went wrong. Please try again later.",
      );
    }
  }
}
