import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trendify_app/controller/test_controller.dart';
import 'package:trendify_app/core/handle_data_view/handle_data_view.dart';
import 'package:trendify_app/core/handle_data_view/widget/app_failure.dart';

class TestView extends StatelessWidget {
  const TestView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TestController());
    return Scaffold(
      body: GetBuilder<TestController>(
        builder: (controller) => HandleDataView(
          statusRequest: controller.statusRequest,
          widget: controller.data.isNotEmpty
              ? Center(child: Text("${controller.data[2]['name']}"))
              : const AppFailure(),
        ),
      ),
    );
  }
}
