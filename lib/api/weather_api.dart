import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_forecast_app/models/weather.dart';

// Данный класс реализует получение данных о погоде с api

class WeatherApi {
  Future<Weather> getCity(String cityName) async { // метод получающий прогноз погоды по названию города
    final url = 'http://api.weatherapi.com/v1/forecast.json?key=youreApiKey&q=$cityName&days=4';

    final response = await http.get(Uri.parse(url)); // выполнение запроса с помощью get 

    // когда наш запрос выполниться, полученный запрос декодируем из Json
    if (response.statusCode == 200) {
      return Weather.fromJson(json.decode(response.body));
    } else {
      throw Exception('Не удалось загрузить город');
    }
  }
}
