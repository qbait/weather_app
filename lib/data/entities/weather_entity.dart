class WeatherEntity {
  final String city;
  final String cityImagePath;
  final String temperature;
  final String iconPath;
  final String animationPath;
  final String? description;
  final num? humidity;
  final num? pressure;

  WeatherEntity(
    this.city,
    this.cityImagePath,
    this.temperature,
    this.iconPath,
    this.animationPath,
    this.description,
    this.humidity,
    this.pressure,
  );
}
