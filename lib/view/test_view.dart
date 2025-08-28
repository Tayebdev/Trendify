import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trendify_app/controller/test_controller.dart';
import 'package:trendify_app/core/class/status_request.dart';
import 'package:trendify_app/core/handle_data_view/widget/app_failure.dart';
import 'package:trendify_app/core/handle_data_view/widget/app_loading.dart';
import 'package:trendify_app/core/handle_data_view/widget/app_offline_failure.dart';
import 'package:trendify_app/core/handle_data_view/widget/app_server_failure.dart';

class TestView extends StatelessWidget {
  const TestView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TestController());
    return Scaffold(
      body: GetBuilder<TestController>(
        builder: (controller) =>
            controller.statusRequest == StatusRequest.loading
            ? AppLoading()
            : controller.statusRequest == StatusRequest.serverfailure
            ? AppServerFailure()
            : controller.statusRequest == StatusRequest.failure
            ? AppFailure()
            : controller.statusRequest == StatusRequest.offlinefailure
            ? AppOfflineFailure()
            : Center(child: Text("${controller.data[0]['name']}")),
      ),
    );
  }
}
