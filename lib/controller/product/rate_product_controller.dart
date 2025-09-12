import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trendify_app/utils/helpers/function_helpers.dart';

abstract class RateProductController extends GetxController {
  void setRating(int rating);
  void clearRating();
  Future<void> submitFeedback();
}

class RateProductControllerImp extends RateProductController {
  final RxInt selectedRating = 0.obs;
  final RxBool isSubmitting = false.obs;
  final TextEditingController feedbackController = TextEditingController();

  @override
  void onClose() {
    feedbackController.dispose();
    super.onClose();
  }

  @override
  void setRating(int rating) {
    selectedRating.value = rating;
  }

  @override
  void clearRating() {
    selectedRating.value = 0;
    feedbackController.clear();
  }

  @override
  Future<void> submitFeedback() async {
    if (selectedRating.value == 0) return;

    try {
      isSubmitting.value = true;
      await Future.delayed(Duration(milliseconds: 500));
      Get.back();

      AppHelperFunctions.customToast(message: 'Thank you for your feedback!');
      clearRating();
    } catch (e) {
      AppHelperFunctions.errorSnackBar(
        title: "Oops!",
        message: "Failed to submit feedback. Please try again.",
      );
    } finally {
      isSubmitting.value = false;
    }
  }
}
