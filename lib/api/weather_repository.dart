import 'package:weather_forecast_app/api/weather_api.dart';
import 'package:weather_forecast_app/models/weather.dart';

// через WeatherRepository мы будем работать с нашим api

class WeatherRepository {
  final WeatherApi _weatherApi = WeatherApi();
  Future<Weather> getWeather(String cityName) => _weatherApi.getCity(cityName);
}
