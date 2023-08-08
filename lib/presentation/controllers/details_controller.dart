import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:weather_app/data/entities/forecast_entity.dart';
import 'package:weather_app/data/entities/weather_entity.dart';
import 'package:weather_app/data/repositories/weather_repository.dart';

import 'loading_controller.dart';

class DetailsController extends GetxController {
  DetailsController(this.repository);

  final WeatherRepository repository;

  final loader = LoadingController();
  WeatherEntity get weatherEntity => Get.arguments as WeatherEntity;
  final forecastEntity = Rxn<ForecastEntity>();

  @override
  void onInit() async {
    loader.loading();

    try {
      forecastEntity.value = await repository.getForecast(weatherEntity.city);
      loader.success();
    } catch (error) {
      loader.error('$error');
      debugPrint('error: $error');
    }
    super.onInit();
  }
}
