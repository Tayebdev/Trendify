class AppLinkApi {
  static const String server = "http://10.0.2.2:3000/api/v1";
  static const String serverImage = "http://10.0.2.2:3000/uploads";

  // images application
  static const String imageCategory = "$serverImage/categories";
  static const String imageBrand = "$serverImage/brands";
  static const String imageUser = "$serverImage/users";
  static const String imageProduct = "$serverImage/products";

  static const String signUp = "$server/auth/signup";
  static const String category = "$server/category";
  static const String brand = "$server/brand";
  static const String subCategory = "$server/subCategory/category";
  static const String verifyEmail = "$server/auth/verifyEmail";
  static const String forgetPassword = "$server/auth/forgotPassword";
  static const String verifyPasswordResetCode =
      "$server/auth/passwordResetCode";
  static const String resetPassword = "$server/auth/resetPassword";
  static const String logIn = "$server/auth/login";
  static const String user = '$server/user/id/';
  static const String editPassword = '$server/user/changePassword';
  static const String product = '$server/product';
  static const String productDetails = '$server/product/id';
  static const String productBySubCategory = "$server/product/subCategoryId";
  static const String review = "$server/review/product";
  static const String rate = "$server/review";
  static const String favoriteAdd = "$server/favorite";
  static const String favoriteDelete = "$server/favorite/productId";
  static const String favoriteList = "$server/favorite/userId";
  static const String address = '$server/address/user';
  static const String addressRemoved = '$server/address/id';
  static const String addressAdd = "$server/address";
}
