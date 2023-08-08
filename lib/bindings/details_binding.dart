import 'package:get/get.dart';
import 'package:weather_app/presentation/controllers/details_controller.dart';

class DetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DetailsController(Get.find()));
  }
}
