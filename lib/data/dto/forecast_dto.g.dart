// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForecastDto _$ForecastDtoFromJson(Map<String, dynamic> json) => ForecastDto(
      list: (json['list'] as List<dynamic>?)
          ?.map((e) => MyList.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ForecastDtoToJson(ForecastDto instance) =>
    <String, dynamic>{
      'list': instance.list,
    };

MyList _$MyListFromJson(Map<String, dynamic> json) => MyList(
      dt: json['dt'] as int?,
      main: json['main'] == null
          ? null
          : Main.fromJson(json['main'] as Map<String, dynamic>),
      weather: (json['weather'] as List<dynamic>?)
          ?.map((e) => Weather.fromJson(e as Map<String, dynamic>))
          .toList(),
      dtTxt: json['dt_txt'] as String?,
    );

Map<String, dynamic> _$MyListToJson(MyList instance) => <String, dynamic>{
      'dt': instance.dt,
      'main': instance.main,
      'weather': instance.weather,
      'dt_txt': instance.dtTxt,
    };

Weather _$WeatherFromJson(Map<String, dynamic> json) => Weather(
      id: json['id'] as num?,
      main: json['main'] as String?,
      description: json['description'] as String?,
      icon: json['icon'] as String?,
    );

Map<String, dynamic> _$WeatherToJson(Weather instance) => <String, dynamic>{
      'id': instance.id,
      'main': instance.main,
      'description': instance.description,
      'icon': instance.icon,
    };

Main _$MainFromJson(Map<String, dynamic> json) => Main(
      temp: (json['temp'] as num?)?.toDouble(),
      feelsLike: (json['feelsLike'] as num?)?.toDouble(),
      tempMin: (json['tempMin'] as num?)?.toDouble(),
      tempMax: (json['tempMax'] as num?)?.toDouble(),
      pressure: json['pressure'] as num?,
      humidity: json['humidity'] as num?,
    );

Map<String, dynamic> _$MainToJson(Main instance) => <String, dynamic>{
      'temp': instance.temp,
      'feelsLike': instance.feelsLike,
      'tempMin': instance.tempMin,
      'tempMax': instance.tempMax,
      'pressure': instance.pressure,
      'humidity': instance.humidity,
    };
