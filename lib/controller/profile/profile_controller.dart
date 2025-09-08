import 'package:get/get.dart';
import 'package:trendify_app/data/model/userModel.dart';
import '../../core/class/my_class.dart';
import '../../core/class/status_request.dart';
import '../../core/constant/app_link_api.dart';
import '../../core/functions/handling_data.dart';
import '../../core/services/app_services.dart';
import '../../utils/helpers/function_helpers.dart';

abstract class ProfileController extends GetxController {
  void getUser();
}

class ProfileControllerImp extends ProfileController {
  late String userId;
  AppServices appServices = Get.find<AppServices>();
  MyClass myClass = Get.find<MyClass>();
  UserModel? user;
  StatusRequest statusRequest = StatusRequest.init;

  @override
  void getUser() async {
    try {
      statusRequest = StatusRequest.loading;
      update();
      var response = await myClass.getData("${AppLinkApi.user}$userId");
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response['data'] != null) {
          user = UserModel.fromJson(response['data']);
        } else {
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } catch (e) {
      statusRequest = StatusRequest.serverfailure;
      AppHelperFunctions.errorSnackBar(
        title: "Error",
        message: "Something went wrong. Please try again later.",
      );
      update();
    }
  }

  @override
  void onInit() {
    userId = appServices.sharedPref.getString('userId').toString();
    getUser();
    super.onInit();
  }
}
