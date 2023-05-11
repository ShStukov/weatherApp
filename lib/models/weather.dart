
// Данный файл является моделью для получения погоды

class WeatherForecast {
  final int date;
  final int temp;
  final double wind;
  final int humidity;
  final String icon;

  WeatherForecast({
    required this.date,
    required this.temp,
    required this.wind,
    required this.humidity,
    required this.icon,
  });
}

class Weather {
  final String name;
  final int temp;
  final String condition;
  final double wind;
  final int humidity;
  final String icon;
  final List<WeatherForecast> weatherDaysForecast;

  Weather({
    required this.name,
    required this.temp,
    required this.condition,
    required this.wind,
    required this.humidity,
    required this.icon,
    required this.weatherDaysForecast,
  });

  // метод который получает Json и преобразовывает их в объекты Dart
  factory Weather.fromJson(Map<String, dynamic> json) {
    List<WeatherForecast> weatherDaysForecast = [];

    for (int i = 1; i <= 3; i++) {
      var forecast = json['forecast']['forecastday'][i]['day'];
      WeatherForecast weatherForecast = WeatherForecast(
        date: json['forecast']['forecastday'][i]['date_epoch'].toInt(),
        temp: forecast['mintemp_c'].toInt(),
        wind: forecast['maxwind_kph'] / 3.6,
        humidity: forecast['avghumidity'].toInt(),
        icon: forecast['condition']['icon'],
      );
      weatherDaysForecast.add(weatherForecast);
    }

    return Weather(
      name: json['location']['name'],
      temp: json['current']['temp_c'].toInt(),
      condition: json['current']['condition']['text'],
      wind: json['current']['wind_kph'] / 3.6,
      humidity: json['current']['humidity'],
      icon: json['current']['condition']['icon'],
      weatherDaysForecast: weatherDaysForecast,
    );
}
}