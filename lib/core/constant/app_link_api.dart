class AppLinkApi {
  static const String server = "http://10.0.2.2:3000/api/v1";
  static const String serverImage = "http://10.0.2.2:3000/uploads";

  // images application
  static const String imageCategory = "$serverImage/categories";
  static const String imageUser = "$serverImage/users";

  static const String signUp = "$server/auth/signup";
  static const String category = "$server/category";
  static const String subCategory = "$server/subCategory/category";
  static const String verifyEmail = "$server/auth/verifyEmail";
  static const String forgetPassword = "$server/auth/forgotPassword";
  static const String verifyPasswordResetCode =
      "$server/auth/passwordResetCode";
  static const String resetPassword = "$server/auth/resetPassword";
  static const String logIn = "$server/auth/login";
  static const String user = '$server/user/id/';
}
