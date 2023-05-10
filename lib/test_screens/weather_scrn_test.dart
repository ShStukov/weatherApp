import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_forecast_app/bloc/weather_bloc.dart';
import 'package:weather_forecast_app/bloc/weather_state.dart';
import 'package:weather_forecast_app/screens/weatherList_screen.dart';
import 'package:weather_forecast_app/widgets/weather_display.dart';

class WeatherScreenTest extends StatefulWidget {
  const WeatherScreenTest({super.key});

  @override
  State<WeatherScreenTest> createState() => _WeatherScreenTestState();
}

class _WeatherScreenTestState extends State<WeatherScreenTest> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    key: _scaffoldKey;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather today'),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: IconButton(
              icon: const Icon(
                Icons.view_headline,
              ),
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
      body: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          if (state is WeatherLoaded) {
            return weatherDisplay(
                state.weather.name,
                state.weather.icon,
                state.weather.temp,
                state.weather.condition,
                state.weather.wind,
                state.weather.humidity);
          } else if (state is WeatherLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is WeatherError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Ошибка получения данных')),
            );
            
            // return const Center(
            //   child: Text(
            //     'Ошибка получения данных',
            //     style: TextStyle(fontSize: 24),
            //   ),
            // );
          } else {
            return const Center(
              child: Text('Введите название города, чтобы получить погоду'),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }

}