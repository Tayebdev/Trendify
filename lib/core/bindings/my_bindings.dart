import 'package:get/get.dart';
import 'package:trendify_app/core/class/crud.dart';
import 'package:trendify_app/core/class/my_class.dart';

class MyBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(Crud());
    Get.put(MyClass());
  }
}