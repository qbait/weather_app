import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:weather_app/data/entities/weather_entity.dart';
import 'package:weather_app/data/repositories/weather_repository.dart';

import '../../core/config.dart';
import 'loading_controller.dart';

class HomeController extends GetxController {
  HomeController(this.repository);

  final WeatherRepository repository;

  final loader = LoadingController();
  final entities = <WeatherEntity>[].obs;

  @override
  void onInit() async {
    loader.loading();

    try {
      entities.value = (await Future.wait(
        cities.map(
              (e) async => await repository.getWeather(e),
        ),
      ))
          .whereType<WeatherEntity>()
          .toList();

      loader.success();

      final daily = await repository.getForecast('london');
    } catch (error) {
      loader.error('$error');
      debugPrint('error: $error');
    }
    super.onInit();
  }
}
