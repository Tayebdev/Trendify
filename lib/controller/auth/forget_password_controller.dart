import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ForgetPasswordController extends GetxController {}

class ForgetPasswordControllerImp extends ForgetPasswordController {
  late TextEditingController? email;

  @override
  void onInit() {
    email = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email!.dispose();
    super.dispose();
  }
}
