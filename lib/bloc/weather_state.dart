import 'package:weather_forecast_app/models/weather.dart';

// файл с состояниями

abstract class WeatherState {}

class WeatherInitial extends WeatherState {} // состояние когда данных нет

class WeatherLoading extends WeatherState {} // состояние когда данные загружаются

class WeatherLoaded extends WeatherState { // состояние когда данные загружены
  final Weather weather;

  WeatherLoaded({required this.weather});
}

class WeatherError extends WeatherState {} // состояние когда произошла ошибка получения данных
