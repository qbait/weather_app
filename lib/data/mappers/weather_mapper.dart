import 'package:weather_app/data/entities/weather_entity.dart';

import '../dto/weather_dto.dart';

extension WeatherMapper on WeatherDto {
  WeatherEntity? toEntity() {
    final city = name;
    final cityImagePath = _cityImagePath;
    final formattedTemperature = _formattedTemperature;
    final iconPath = _iconPath;
    final animationPath = _animationPath;

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

  String? get _iconPath {
    final iconCode = weather?.first.icon?.substring(0, 2);

    switch (iconCode) {
      case '01':
        return 'assets/icons/wi_clear-day.svg';
      case '02':
        return 'assets/icons/wi_overcast-day.svg';
      case '03':
        return 'assets/icons/wi_cloudy.svg';
      case '04':
        return 'assets/icons/wi_extreme.svg';
      case '09':
        return 'assets/icons/wi_extreme-rain.svg';
      case '10':
        return 'assets/icons/wi_extreme-day-rain.svg';
      case '11':
        return 'assets/icons/wi_thunderstorms-overcast.svg';
      case '13':
        return 'assets/icons/wi_snow.svg';
      case '50':
        return 'assets/icons/wi_mist.svg';
      default:
        return null;
    }
  }

  String? get _animationPath {
    final iconCode = weather?.first.icon?.substring(0, 2);

    switch (iconCode) {
      case '01':
        return 'assets/animations/clear-day.json';
      case '02':
        return 'assets/animations/partly-cloudy-day.json';
      case '03':
        return 'assets/animations/cloudy.json';
      case '04':
        return 'assets/animations/extreme.json';
      case '09':
        return 'assets/animations/rain.json';
      case '10':
        return 'assets/animations/extreme-day-rain.json';
      case '11':
        return 'assets/animations/thunderstorms-extreme.json';
      case '13':
        return 'assets/animations/snow.json';
      case '50':
        return 'assets/animations/mist.json';
      default:
        return null;
    }
  }
}
