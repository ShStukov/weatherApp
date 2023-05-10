import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_forecast_app/bloc/weather_bloc.dart';
import 'package:weather_forecast_app/bloc/weather_state.dart';
import 'package:weather_forecast_app/models/weather.dart';

class SecondScreen extends StatelessWidget {
  final Weather weather;

  const SecondScreen({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather'),
        centerTitle: true,
      ),
      body: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          if (state is WeatherLoaded) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '${state.weather.name}',
                  style: const TextStyle(
                      fontSize: 32, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                Text(
                  DateFormat.yMMMMd().format(DateTime.now()),
                  style: const TextStyle(fontSize: 24),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${state.weather.icon}',
                    ),
                    const SizedBox(height: 20),
                    Column(
                      children: [
                        Text(
                          '${state.weather.temp}',
                          style: const TextStyle(fontSize: 24),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          '${state.weather.condition}',
                          style: const TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.toys),
                    const SizedBox(width: 10),
                    Text(
                      '${state.weather.wind} m/s',
                      style: const TextStyle(fontSize: 24),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.water_damage),
                    const SizedBox(width: 10),
                    Text(
                      '${state.weather.humidity}%',
                      style: const TextStyle(fontSize: 24),
                    ),
                  ],
                ),
              ],
            );
          } else if (state is WeatherLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is WeatherError) {
            return const Center(
              child: Text(
                'Error loading weather data: ',
                style: TextStyle(fontSize: 24),
              ),
            );
          } else {
            return const Center(child: Text('Enter a city name to get started'));
          }
        },
      ),
    );
  }
}
