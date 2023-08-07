import 'package:flutter/material.dart';
import 'package:weather_app/data/entities/weather_entity.dart';
import 'package:weather_app/data/mappers/weather_mapper.dart';
import 'package:weather_app/data/remote/weather_api_client.dart';

class WeatherRepository {
  WeatherRepository(this.apiClient);

  final WeatherApiClient apiClient;

  Future<WeatherEntity?> getWeather(String city) async {
    try {
      final dto = await apiClient.getWeather(city);
      return dto.toEntity();
    } on Exception catch (e) {
      debugPrint(e.toString());
      return Future.error(e.toString());
    }
  }
}
