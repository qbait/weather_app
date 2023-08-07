import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:weather_app/data/repositories/weather_repository.dart';
import 'package:weather_app/data/remote/weather_api_client.dart';
import 'package:weather_app/presentation/controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Dio());
    Get.lazyPut(() => WeatherApiClient(Get.find()));
    Get.lazyPut(() => WeatherRepository(Get.find()));
    Get.lazyPut(() => HomeController(Get.find()));
  }
}
