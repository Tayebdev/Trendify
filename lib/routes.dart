import 'package:get/get.dart';
import 'package:trendify_app/core/middleware/onboarding_middleware.dart';
import 'package:trendify_app/navigation_menu.dart';
import 'package:trendify_app/utils/splash/splash_screen.dart';
import 'package:trendify_app/view/screen/address/add_new_address_view.dart';
import 'package:trendify_app/view/screen/address/address_view.dart';
import 'package:trendify_app/view/screen/auth/success_created_view.dart';
import 'package:trendify_app/view/screen/auth/update_password_view.dart';
import 'package:trendify_app/view/screen/auth/verify_code_password_view.dart';
import 'package:trendify_app/view/screen/cart/cart_view.dart';
import 'package:trendify_app/view/screen/cart/order_review_view.dart';
import 'package:trendify_app/view/screen/cart/payment_success_view.dart';
import 'package:trendify_app/view/screen/home/sub_category_view.dart';
import 'package:trendify_app/view/screen/product/all_product_view.dart';
import 'package:trendify_app/view/screen/product/product_details_view.dart';
import 'package:trendify_app/view/screen/product/product_reviews.dart';
import 'package:trendify_app/view/screen/profile/order_view.dart';
import 'package:trendify_app/view/screen/profile/profile_view.dart';
import 'package:trendify_app/view/screen/store/all_brand_view.dart';
import 'package:trendify_app/view/screen/store/brand_product_view.dart';
import 'package:trendify_app/view/test_view.dart';
import 'view/screen/auth/verify_code_email_view.dart';
import '../view/screen/auth/verify_email_view.dart';
import '../view/screen/auth/forget_password_view.dart';
import '../view/screen/auth/signup_view.dart';
import '../core/constant/app_routes.dart';
import '../view/screen/auth/login_view.dart';

List<GetPage<dynamic>>? getPages = [
  GetPage(
    name: AppRoutes.route,
    page: () => SplashScreen(),
    middlewares: [OnboardingMiddleware()],
  ),
  GetPage(name: AppRoutes.login, page: () => LoginView()),
  GetPage(name: AppRoutes.signUp, page: () => SignupView()),
  GetPage(name: AppRoutes.forgetPassword, page: () => ForgetPasswordView()),
  GetPage(name: AppRoutes.verifyEmail, page: () => VerifyEmailView()),
  GetPage(name: AppRoutes.verifyCodeEmail, page: () => VerifyCodeEmailView()),
  GetPage(name: AppRoutes.verifyCodePassword, page: ()=>VerifyCodePasswordView()),
  GetPage(name: AppRoutes.updatePassword, page: ()=>UpdatePasswordView()),
  GetPage(name: AppRoutes.successCreated, page: () => SuccessCreatedView()),
  GetPage(name: AppRoutes.navigationMenu, page: () => NavigationMenu()),
  GetPage(name: AppRoutes.profile, page: () => ProfileView()),
  GetPage(name: AppRoutes.productDetails, page: () => ProductDetailsView()),
  GetPage(name: AppRoutes.productReviews, page: () => ProductReviews()),
  GetPage(name: AppRoutes.addressUser, page: () => AddressView()),
  GetPage(name: AppRoutes.addNewAddress, page: () => AddNewAddressView()),
  GetPage(name: AppRoutes.cart, page: () => CartView()),
  GetPage(name: AppRoutes.orderReview, page: () => OrderReviewView()),
  GetPage(name: AppRoutes.paymentSuccess, page: () => PaymentSuccessView()),
  GetPage(name: AppRoutes.subCetgory, page: () => SubCategoryView()),
  GetPage(name: AppRoutes.allProduct, page: () => AllProductView()),
  GetPage(name: AppRoutes.allBrands, page: () => AllBrandView()),
  GetPage(name: AppRoutes.brandProduct, page: () => BrandProductView()),
  GetPage(name: AppRoutes.order, page: () => OrderView()),

  //test
  //GetPage(name: AppRoutes.test, page: () => TestView()),
];
