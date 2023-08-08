extension IconMapper on String {
  String? toAnimationPath() {
    final iconCode = substring(0, 2);

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

  String? toIconPath() {
    final iconCode = substring(0, 2);

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
}