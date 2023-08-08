import '../dto/forecast_dto.dart';
import '../entities/forecast_entity.dart';
import 'package:weather_app/data/mappers/icon_mapper.dart';

extension ForecastMapper on ForecastDto {
  ForecastEntity? toEntity() {
    return ForecastEntity(list!
        .map((dto) {
          final time = dto.dtTxt != null ? DateTime.parse(dto.dtTxt!) : null;

          return ForecastItem(
              time,
              dto.weather?.first.icon?.toIconPath() ?? '',
              '${dto.main?.temp?.round()}º',
              dto.weather?.first.description,
            );
        })
        .toList());
  }
}
