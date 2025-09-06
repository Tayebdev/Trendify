import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trendify_app/core/constant/app_colors.dart';
import '../../view/widget/loader/animated_loader.dart';
import '../helpers/function_helpers.dart';


class AppFullScreenLoader{

  static void openLoadingDialog(String text, String animation){
    showDialog(

        context: Get.overlayContext!,
        barrierDismissible: false,
        builder: (_) => PopScope(
          canPop: false,
            child: Container(
              color: AppHelperFunctions.isDarkMode(Get.context!) ? AppColors.dark : AppColors.white,
              width: double.infinity,
              height: double.infinity,
              child: Column(
                children: [
                  const SizedBox(height: 250,),

                  HkAnimationLoader(text: text, animation: animation)
                ],
              ),
            )
        )
    );
  }
  
  static void stopLoading(){
    Navigator.of(Get.overlayContext!).pop();
  }
}