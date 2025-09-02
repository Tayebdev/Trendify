import 'package:get/get.dart';
import 'package:trendify_app/data/model/sub_category_model.dart';

import '../core/class/my_class.dart';
import '../core/class/status_request.dart';
import '../core/constant/app_link_api.dart';
import '../core/functions/handling_data.dart';
import '../utils/helpers/function_helpers.dart';
import '../utils/popups/full_screen_loader.dart';

abstract class SubCategoryController extends GetxController {
  getAllSubCategory();
}

class SubCategoryControllerImp extends SubCategoryController {
  late String categoryName;
  late String categoryId;
  MyClass myClass = Get.find<MyClass>();
  StatusRequest statusRequest = StatusRequest.init;
  List<subCategoryModel> subCategoryList = [];
  @override
@override
getAllSubCategory() async {
  try {
    statusRequest = StatusRequest.loading;
    update();
    var response = await myClass.getData(
      "${AppLinkApi.subCategory}/$categoryId",
    );
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success && response['data'].isNotEmpty) {
      subCategoryList.clear();
      subCategoryList.addAll(
        (response['data'] as List)
            .map((value) => subCategoryModel.fromJson(value))
            .toList(),
      );
    }else{
      statusRequest=StatusRequest.failure;
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
    categoryName = Get.arguments['nameCategory'];
    categoryId = Get.arguments['categoryId'];
    getAllSubCategory();
    super.onInit();
  }
}
