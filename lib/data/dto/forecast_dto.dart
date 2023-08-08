import 'package:json_annotation/json_annotation.dart';

part 'forecast_dto.g.dart';

@JsonSerializable()
class ForecastDto {
  List<MyList>? list;

  ForecastDto({this.list});

  factory ForecastDto.fromJson(Map<String, dynamic> json) =>
      _$ForecastDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ForecastDtoToJson(this);
}

@JsonSerializable()
class MyList {
  int? dt;
  Main? main;
  List<Weather>? weather;
  String? dt_txt;

  MyList({
    this.dt,
    this.main,
    this.weather,
    this.dt_txt,
  });

  factory MyList.fromJson(Map<String, dynamic> json) => _$MyListFromJson(json);

  Map<String, dynamic> toJson() => _$MyListToJson(this);
}

@JsonSerializable()
class Weather {
  num? id;
  String? main;
  String? description;
  String? icon;

  Weather({this.id, this.main, this.description, this.icon});

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherToJson(this);
}

@JsonSerializable()
class Main {
  double? temp;
  double? feelsLike;
  double? tempMin;
  double? tempMax;
  num? pressure;
  num? humidity;

  Main(
      {this.temp,
      this.feelsLike,
      this.tempMin,
      this.tempMax,
      this.pressure,
      this.humidity});

  factory Main.fromJson(Map<String, dynamic> json) => _$MainFromJson(json);

  Map<String, dynamic> toJson() => _$MainToJson(this);
}
