import 'package:get/get.dart';
import '../controllers/home_controller.dart';

/// Home binding for dependency injection
class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
