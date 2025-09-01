import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:trendify_app/core/constant/app_routes.dart';
import 'package:trendify_app/core/services/app_services.dart';

abstract class HomeController extends GetxController {
  dotNavigationClick(int index);
  goToCart();
  goToAllProduct();
}

class HomeControllerImp extends HomeController {
  static HomeControllerImp get instance => Get.find();
  late String firstName;
  late String lastName;
  final carouselController = CarouselSliderController();
  RxInt currentPage = 0.obs;
  AppServices appServices = Get.find<AppServices>();

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
    super.onInit();
  }
}
