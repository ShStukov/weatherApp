import 'package:weather_forecast_app/api/weather_api.dart';
import 'package:weather_forecast_app/models/weather.dart';

class WeatherRepository {
  final WeatherApi _weatherApi = WeatherApi();
  Future<Weather> getWeather(String cityName) => _weatherApi.getCity(cityName);
}
