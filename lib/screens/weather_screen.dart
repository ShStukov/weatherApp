import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_forecast_app/bloc/weather_bloc.dart';
import 'package:weather_forecast_app/bloc/weather_state.dart';
import 'package:weather_forecast_app/screens/weatherList_screen.dart';
import 'package:weather_forecast_app/widgets/weather_display.dart';

// Экран с отображением погоды в выбранном городе

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather for today'),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 5),
            // В AppBar реализована IconButton для перехода на страницу с погодой за 3 дня
            child: IconButton(
              icon: const Icon(Icons.view_headline),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const WeatherListScreen(),
                  ),
                );
              },
            ),
          )
        ],
      ),
      // BlocBuilder для построения пользовательского интерфейса на основе состояний
      body: BlocBuilder<WeatherBloc, WeatherState>(
        // "builder" - принимает текущее состояние и возвращает виджет
        builder: (context, state) {
          
          // если состояние является "WeatherLoaded", т.е. погода загружена, то мы вызываем виджет "weatherDisplay"
          // в который передаем необходимые данные о погоде для отображения на экране
          if (state is WeatherLoaded) {
            return weatherDisplay(
                state.weather.name,
                state.weather.icon,
                state.weather.temp,
                state.weather.condition,
                state.weather.wind,
                state.weather.humidity);

            // иначе если состояние является "WeatherLoading", т.е. данные загружаются
            // мы отображаем "CircularProgressIndicator"
          } else if (state is WeatherLoading) {
            return const Center(child: CircularProgressIndicator());

            // иначе если состояние является "WeatherError", т.е. состояние ошибки при получении данных
            // мы отображаем SnackBar и текст "Ошибка получения данных"
          } else if (state is WeatherError) {
            // "Future.delayed(Duration.zero, () {}" - используется для отображения SnackBar после построения виджета
            Future.delayed(Duration.zero, () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  duration: Duration(seconds: 2),
                  behavior: SnackBarBehavior.floating,
                  backgroundColor: Colors.blue,
                  margin: EdgeInsets.only(bottom: 320, left: 20, right: 20),
                  content: Center(
                    child: Text(
                      'Ошибка получения данных',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              );
            });
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
