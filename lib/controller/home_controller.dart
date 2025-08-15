import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:trendify_app/core/constant/app_routes.dart';

abstract class HomeController extends GetxController {
  dotNavigationClick(int index);
  goToCart();
  goToAllProduct();
}

class HomeControllerImp extends HomeController {
  static HomeControllerImp get instance => Get.find();
  final carouselController = CarouselSliderController();
  RxInt currentPage = 0.obs;

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
}
