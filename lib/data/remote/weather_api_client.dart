import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:weather_app/data/dto/forecast_dto.dart';

import '../dto/weather_dto.dart';

part 'weather_api_client.g.dart';

@RestApi(baseUrl: 'https://api.openweathermap.org/data/2.5/')
abstract class WeatherApiClient {
  factory WeatherApiClient(Dio dio, {String baseUrl}) = _WeatherApiClient;

  @GET('weather?units=$_units&appid=$_appId')
  Future<WeatherDto> getWeather(@Query('q') String city);

  @GET('forecast?units=$_units&appid=$_appId')
  Future<ForecastDto> getForecast(@Query('q') String city);
}

const _appId = '30e90e81acda4890cf29346bba889f29';
const _units = 'metric';