import 'package:flutter/material.dart';
import 'package:trendify_app/core/class/status_request.dart';
import 'package:trendify_app/core/handle_data_view/widget/app_failure.dart';
import 'package:trendify_app/core/handle_data_view/widget/app_loading.dart';
import 'package:trendify_app/core/handle_data_view/widget/app_offline_failure.dart';
import 'package:trendify_app/core/handle_data_view/widget/app_server_failure.dart';

// ignore: must_be_immutable
class HandleDataView extends StatelessWidget {
  StatusRequest statusRequest;
  Widget widget;
  HandleDataView({
    super.key,
    required this.statusRequest,
    required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? AppLoading()
        : statusRequest == StatusRequest.failure
        ? AppFailure()
        : statusRequest == StatusRequest.serverfailure
        ? AppServerFailure()
        : statusRequest == StatusRequest.offlinefailure
        ? AppOfflineFailure()
        : widget;
  }
}
