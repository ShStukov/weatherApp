import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_forecast_app/models/weather.dart';
import 'package:weather_forecast_app/widgets/weather_display.dart';
import '../bloc/weather_bloc.dart';
import '../bloc/weather_state.dart';

// Экран с отображеним списка погоды за 3 дня

class WeatherListScreen extends StatelessWidget {
  const WeatherListScreen ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather for 3 days'),
        centerTitle: true,
      ),
      body: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          if (state is WeatherLoaded) {
            // здесь происходит сортировка списка погоды по самой низкой температуре
            state.weather.weatherDaysForecast.sort((a,b) => a.temp.compareTo(b.temp));
            return Container(
              height: 415,
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              // "ListView.builder" - принимает два параметра
              // "itemCount" - возвращает количество элементов в списке
              // "itemBuilder" - функция, которая по индексу элемента возвращает соответствующий виджет
              child: ListView.builder(
                itemCount: state.weather.weatherDaysForecast.length,
                itemBuilder: (context, index) {
                  WeatherForecast weatherDay = state.weather.weatherDaysForecast[index];
                  // когда данные загружены, мы вызываем виджет "weatherListDisplay"
                  // в который передаем необходимые данные о погоде для отображения на экране
                  return Column(
                    children: [
                      weatherListDisplay(
                        weatherDay.date,
                        weatherDay.icon,
                        weatherDay.temp,
                        weatherDay.wind,
                        weatherDay.humidity,
                      ),
                      const SizedBox(height: 10)
                    ],
                  );
                },
              ),
            );
          } else if (state is WeatherError) {
            return const Center(
              child: Text(
                'Ошибка получения данных',
                style: TextStyle(fontSize: 24),
              ),
            );
          } 
          return const SizedBox();
        },
      ),
    );
  }
}