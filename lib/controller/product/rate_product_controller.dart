import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trendify_app/data/model/review_model.dart';
import 'package:trendify_app/utils/helpers/function_helpers.dart';

import '../../core/class/my_class.dart';
import '../../core/class/status_request.dart';
import '../../core/constant/app_link_api.dart';
import '../../core/functions/handling_data.dart';
import '../../core/services/app_services.dart';
import '../../utils/popups/full_screen_loader.dart';

abstract class RateProductController extends GetxController {
  void setRating(int rating);
  void clearRating();
  void getRating();
  Future<void> submitFeedback();
}

class RateProductControllerImp extends RateProductController {
  late String productId;
  late String userId;
  final RxDouble selectedRating = 0.0.obs; // ✅ keep rating as double
  final RxBool isSubmitting = false.obs;
  TextEditingController feedbackController = TextEditingController();
  MyClass myClass = Get.find<MyClass>();
  StatusRequest statusRequest = StatusRequest.init;
  AppServices appServices = Get.find<AppServices>();
  List<ReviewModel> reviewList = [];

  @override
  void onClose() {
    feedbackController.dispose();
    super.onClose();
  }

  @override
  void setRating(int rating) {
    selectedRating.value = rating.toDouble();
  }

  @override
  void clearRating() {
    selectedRating.value = 0.0;
    feedbackController.clear();
  }

  @override
  Future<void> submitFeedback() async {
    if (selectedRating.value == 0.0) return;
    try {
      isSubmitting.value = true;
      final payload = {
        "review": feedbackController.text.trim(),
        "rating": selectedRating.value.toDouble(),
        "user": userId,
        "product": productId,
      };
      final response = await myClass.postData(AppLinkApi.rate, payload);
      var statusRating = handlingData(response);
      if (statusRating == StatusRequest.success) {
        AppHelperFunctions.customToast(message: 'Thank you for your feedback!');
        clearRating();
        Get.back();
        reviewList.clear();
        getRating();
      }
      update();
    } catch (e) {
      AppHelperFunctions.errorSnackBar(
        title: "Oops!",
        message: "Failed to submit feedback. Please try again.",
      );
    } finally {
      isSubmitting.value = false;
    }
  }

  @override
  void getRating() async {
    try {
      statusRequest = StatusRequest.loading;
      var review = await myClass.getData("${AppLinkApi.review}/$productId");
      statusRequest = handlingData(review);

      if (statusRequest == StatusRequest.success && review["results"] > 0) {
        reviewList.addAll(
          (review['data'] as List)
              .map((value) => ReviewModel.fromJson(value))
              .toList(),
        );
      }
      update();
    } catch (e) {
      statusRequest = StatusRequest.serverfailure;
      AppFullScreenLoader.stopLoading();
      AppHelperFunctions.errorSnackBar(
        title: "Error",
        message: "Something went wrong. Please try again later.",
      );
    }
  }

  @override
  void onInit() {
    productId = Get.arguments['productId'];
    feedbackController = TextEditingController();
    userId = appServices.sharedPref.getString('userId')!;
    getRating();
    super.onInit();
  }
}
