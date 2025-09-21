import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:trendify_app/core/constant/app_routes.dart';
import 'package:trendify_app/data/model/address_model.dart';
import '../../core/class/my_class.dart';
import '../../core/class/status_request.dart';
import '../../core/constant/app_images.dart';
import '../../core/constant/app_link_api.dart';
import '../../core/functions/handling_data.dart';
import '../../core/services/app_services.dart';
import '../../utils/helpers/function_helpers.dart';
import '../../utils/popups/full_screen_loader.dart';

abstract class AddressController extends GetxController {
  void goToAddNewAddress();
  void getAllAddressForUser();
  void deleteAddressUser(String addressId);
  void addAddress();
  void selectedAddress(String addressId);
}

class AddressControllerImp extends AddressController {
  late String userId;
  TextEditingController? name;
  TextEditingController? phone;
  TextEditingController? street;
  TextEditingController? postalCode;
  TextEditingController? city;
  TextEditingController? state;
  TextEditingController? country;
  List<AddressModel> addressList = [];
  AppServices appServices = Get.find<AppServices>();
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  MyClass myClass = Get.find<MyClass>();
  StatusRequest statusRequest = StatusRequest.init;
  static AddressControllerImp get instance => Get.find();

  @override
  void onInit() {
    userId = appServices.sharedPref.getString("userId")!;
    name = TextEditingController();
    phone = TextEditingController();
    street = TextEditingController();
    postalCode = TextEditingController();
    city = TextEditingController();
    state = TextEditingController();
    country = TextEditingController();
    getAllAddressForUser();
    super.onInit();
  }

  @override
  void dispose() {
    name!.dispose();
    phone!.dispose();
    street!.dispose();
    postalCode!.dispose();
    city!.dispose();
    state!.dispose();
    country!.dispose();
    super.dispose();
  }

  @override
  goToAddNewAddress() {
    Get.toNamed(AppRoutes.addNewAddress);
  }

  @override
  void getAllAddressForUser() async {
    try {
      statusRequest = StatusRequest.loading;
      update();
      var response = await myClass.getData("${AppLinkApi.address}/$userId");
      statusRequest = handlingData(response);
      addressList.clear();
      if (statusRequest == StatusRequest.success) {
        if (response["data"] != null && (response["data"] as List).isNotEmpty) {
          addressList.addAll(
            (response["data"] as List)
                .map((value) => AddressModel.fromJson(value))
                .toList(),
          );
        } else {
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } catch (e) {
      statusRequest = StatusRequest.serverfailure;
      update();
      AppHelperFunctions.errorSnackBar(
        title: "Error",
        message: "Something went wrong. Please try again later.",
      );
    }
  }

  @override
  void deleteAddressUser(addressId) async {
    try {
      statusRequest = StatusRequest.loading;
      update();
      var response = await myClass.deleteData(
        "${AppLinkApi.addressRemoved}/$addressId",
      );
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        getAllAddressForUser();
      }
      update();
    } catch (e) {
      statusRequest = StatusRequest.serverfailure;
      update();
      AppHelperFunctions.errorSnackBar(
        title: "Error",
        message: "Something went wrong. Please try again later.",
      );
    }
  }

  @override
  void addAddress() async {
    if (!formState.currentState!.validate()) {
      return;
    }
    try {
      statusRequest = StatusRequest.loading;
      AppFullScreenLoader.openLoadingDialog(
        'We are processing your information...',
        AppImages.docerAnimation,
      );
      update();

      final response = await myClass.postData(AppLinkApi.addressAdd, {
        "userId": userId,
        "name": name!.text.trim(),
        "phone": phone!.text.trim(),
        "street": street!.text.trim(),
        "postalCode": postalCode!.text.trim(),
        "city": city!.text.trim(),
        "state": state!.text.trim(),
        "country": country!.text.trim(),
      });
      statusRequest = handlingData(response);
      AppFullScreenLoader.stopLoading();
      if (statusRequest == StatusRequest.success) {
        AppHelperFunctions.successSnackBar(
          title: "Success",
          message: "Your address has been added successfully.",
        );
        Get.toNamed(AppRoutes.addressUser);
        getAllAddressForUser();
      } else {
        AppHelperFunctions.warningSnackBar(
          title: "Oops!",
          message: "Could not add address. Please try again.",
        );
      }
      update();
    } catch (e) {
      AppFullScreenLoader.stopLoading();
      AppHelperFunctions.errorSnackBar(
        title: "Error",
        message: "Something went wrong. Please try again later.",
      );
    }
  }

  @override
  void selectedAddress(addressId) async {
    try {
      statusRequest = StatusRequest.loading;
      update();
      var response = await myClass.putData(
        "${AppLinkApi.addressSelected}/$addressId",
        {},
      );
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        getAllAddressForUser();
      }
      update();
    } catch (e) {
      statusRequest = StatusRequest.serverfailure;
      update();
      AppHelperFunctions.errorSnackBar(
        title: "Error",
        message: "Something went wrong. Please try again later.",
      );
    }
  }
}
