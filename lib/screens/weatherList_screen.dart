import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_forecast_app/widgets/weather_display.dart';
import '../bloc/weather_bloc.dart';
import '../bloc/weather_state.dart';

class WeatherListScreen extends StatelessWidget {
  const WeatherListScreen({super.key});

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
            return Container(
              height: 415,
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              child: ListView(
                children: [
                  weatherListDisplay(
                      state.weather.date1,
                      state.weather.icon1,
                      state.weather.temp1,
                      state.weather.wind1,
                      state.weather.humidity1),
                  const SizedBox(height: 10),
                  weatherListDisplay(
                      state.weather.date2,
                      state.weather.icon2,
                      state.weather.temp2,
                      state.weather.wind2,
                      state.weather.humidity2),
                  const SizedBox(height: 10),
                  weatherListDisplay(
                      state.weather.date3,
                      state.weather.icon3,
                      state.weather.temp3,
                      state.weather.wind3,
                      state.weather.humidity3),
                ],
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
