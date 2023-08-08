import 'package:weather_app/data/entities/weather_entity.dart';
import 'package:weather_app/data/mappers/icon_mapper.dart';

import '../dto/weather_dto.dart';

extension WeatherMapper on WeatherDto {
  WeatherEntity? toEntity() {
    final city = name;
    final cityImagePath = _cityImagePath;
    final formattedTemperature = _formattedTemperature;
    final iconPath = weather?.first.icon?.toIconPath();
    final animationPath = weather?.first.icon?.toAnimationPath();

    if (city == null ||
        formattedTemperature == null ||
        iconPath == null ||
        cityImagePath == null ||
        animationPath == null) {
      return null;
    } else {
      return WeatherEntity(
        city,
        cityImagePath,
        formattedTemperature,
        iconPath,
        animationPath,
        weather?.first.description,
        main?.humidity,
        main?.pressure,
      );
    }
  }

  String? get _cityImagePath => name != null ? 'assets/images/${name!.toLowerCase()}.jpeg' : null;

  String? get _formattedTemperature => main?.temp != null ? '${main!.temp!.round()}º' : null;
}
