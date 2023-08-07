import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../dto/weather_dto.dart';

part 'weather_api_client.g.dart';

@RestApi(baseUrl: 'https://api.openweathermap.org/data/2.5/')
abstract class WeatherApiClient {
  factory WeatherApiClient(Dio dio, {String baseUrl}) = _WeatherApiClient;

  @GET('weather?units=metric&appid=be7ee777fd9edabedc1e0465133be3a8')
  Future<WeatherDto> getWeather(@Query('q') String city);
}