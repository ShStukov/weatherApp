import 'dart:convert';
import 'package:weather_forecast_app/models/weather.dart';
import 'package:http/http.dart' as http;

class WeatherApi {
  Future<Weather> getCity(String cityName) async {
    final url =
        'http://api.weatherapi.com/v1/forecast.json?key=069313f893c844b8bb761542230605&q=$cityName&days=4&aqi=no&alerts=no';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return Weather.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load city');
    }
  }
}
