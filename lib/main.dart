import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_forecast_app/api/weather_repository.dart';
import 'package:weather_forecast_app/bloc/weather_bloc.dart';
import 'package:weather_forecast_app/screens/search_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // инициализация BloC через BlocProvider
    return BlocProvider(
      // "create" - используется для создания экземпляра "WeatherBloc"
      create: (context) => WeatherBloc(weatherRepository: WeatherRepository()),
      child: MaterialApp(
        title: 'Weather Forecast',
        home: SearchScreen(),
      ),
    );
  }
}