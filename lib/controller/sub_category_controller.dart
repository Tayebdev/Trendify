import 'package:get/get.dart';
import 'package:trendify_app/data/model/product_model.dart';
import 'package:trendify_app/data/model/sub_category_model.dart';

import '../core/class/my_class.dart';
import '../core/class/status_request.dart';
import '../core/constant/app_link_api.dart';
import '../core/functions/handling_data.dart';
import '../utils/helpers/function_helpers.dart';
import '../utils/popups/full_screen_loader.dart';

abstract class SubCategoryController extends GetxController {
  Future<void> getAllSubCategory();
  Future<List<ProductModel>> getProductBySubCategory(String subCatId);
  Future<void> getAllProductbySubCategory();
  Future<void> loadData();
}

class SubCategoryControllerImp extends SubCategoryController {
  late String categoryName;
  late String categoryId;
  MyClass myClass = Get.find<MyClass>();
  StatusRequest statusRequest = StatusRequest.init;
  StatusRequest statusRequestSecond = StatusRequest.init;

  List<SubCategoryModel> subCategoryList = [];
  List<String> subCategoryIds = [];
  List<List<ProductModel>> allListProduct = [];

  @override
  void onInit() {
    categoryName = Get.arguments['nameCategory'];
    categoryId = Get.arguments['categoryId'];
    super.onInit();
    loadData();
  }

  @override
  Future<void> loadData() async {
    await getAllSubCategory();
    await getAllProductbySubCategory();
  }

  @override
  Future<void> getAllSubCategory() async {
    try {
      statusRequest = StatusRequest.loading;
      update();

      var response = await myClass.getData(
        "${AppLinkApi.subCategory}/$categoryId",
      );
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success &&
          response['data'].isNotEmpty) {
        subCategoryList.clear();
        subCategoryIds.clear();

        subCategoryList.addAll(
          (response['data'] as List)
              .map((value) => SubCategoryModel.fromJson(value))
              .toList(),
        );
        for (var value in response['data']) {
          subCategoryIds.add(value['_id']);
        }
      } else {
        statusRequest = StatusRequest.failure;
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
  Future<List<ProductModel>> getProductBySubCategory(String subCatId) async {
    try {
      statusRequestSecond = StatusRequest.loading;
      var response = await myClass.getData(
        "${AppLinkApi.productBySubCategory}/$subCatId",
      );
      statusRequestSecond = handlingData(response);
      if (statusRequestSecond == StatusRequest.success &&
          response['data'].isNotEmpty) {
        var products = (response['data'] as List)
            .map((value) => ProductModel.fromJson(value))
            .toList();
        return products;
      }
      return [];
    } catch (e) {
      AppFullScreenLoader.stopLoading();
      AppHelperFunctions.errorSnackBar(
        title: "Error",
        message: "Something went wrong. Please try again later.",
      );
      return [];
    }
  }

  @override
  Future<void> getAllProductbySubCategory() async {
    allListProduct.clear();

    for (var subCatId in subCategoryIds) {
      var products = await getProductBySubCategory(subCatId);
      allListProduct.add(products);
    }
    update();
  }
}
