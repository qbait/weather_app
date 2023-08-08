class ForecastEntity {
  final List<ForecastItem> items;

  ForecastEntity(
    this.items,
  );
}

class ForecastItem {
  final DateTime? time;
  final String iconPath;
  final String temperature;
  final String? description;

  ForecastItem(
      this.time,
      this.iconPath,
      this.temperature,
      this.description,
      );
}
