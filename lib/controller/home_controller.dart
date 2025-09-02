import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:trendify_app/core/class/status_request.dart';
import 'package:trendify_app/core/constant/app_link_api.dart';
import 'package:trendify_app/core/constant/app_routes.dart';
import 'package:trendify_app/core/services/app_services.dart';
import 'package:trendify_app/data/model/category_model.dart';

import '../core/class/my_class.dart';
import '../core/functions/handling_data.dart';
import '../utils/helpers/function_helpers.dart';
import '../utils/popups/full_screen_loader.dart';

abstract class HomeController extends GetxController {
  dotNavigationClick(int index);
  goToCart();
  goToAllProduct();
  getAllCategory();
}

class HomeControllerImp extends HomeController {
  static HomeControllerImp get instance => Get.find();
  late String firstName;
  late String lastName;
  final carouselController = CarouselSliderController();
  RxInt currentPage = 0.obs;
  AppServices appServices = Get.find<AppServices>();
  MyClass myClass = Get.find<MyClass>();
  StatusRequest statusRequest=StatusRequest.init;
  List<categoryModel> categoryList = [];

  @override
  dotNavigationClick(index) {
    currentPage.value = index;
  }

  @override
  goToCart() {
    Get.toNamed(AppRoutes.cart);
  }

  @override
  goToAllProduct() {
    Get.toNamed(AppRoutes.allProduct);
  }

  @override
  void onInit() {
    firstName = appServices.sharedPref.getString('firstName')!;
    lastName = appServices.sharedPref.getString('lastName')!;
    getAllCategory();
    super.onInit();
  }

  @override
  getAllCategory() async {
    try {
      statusRequest = StatusRequest.loading;
      var category = await myClass.getData(AppLinkApi.category);
      statusRequest = handlingData(category);
      if (statusRequest == StatusRequest.success && category["result"] > 0) {
        categoryList.addAll(
          (category['data'] as List)
              .map((value) => categoryModel.fromJson(value))
              .toList(),
        );
      }
      update();
    } catch (e) {
      statusRequest=StatusRequest.serverfailure;
      AppFullScreenLoader.stopLoading();
      AppHelperFunctions.errorSnackBar(
        title: "Error",
        message: "Something went wrong. Please try again later.",
      );
    }
  }
}
