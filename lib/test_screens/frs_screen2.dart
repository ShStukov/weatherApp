import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_forecast_app/bloc/weather_bloc.dart';
import 'package:weather_forecast_app/bloc/weather_event.dart';

class FrstScrn2 extends StatelessWidget {
  final _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _textEditingController,
              decoration: const InputDecoration(
                hintText: 'Enter city name',
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final cityName = _textEditingController.text;
                if (cityName.isNotEmpty) {
                  BlocProvider.of<WeatherBloc>(context)
                      .add(FetchWeather(cityName));
                }
              },
              child: Text('Get Weather'),
            ),
          ],
        ),
      ),
    );
  }
}