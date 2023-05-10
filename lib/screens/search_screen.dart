import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_forecast_app/bloc/weather_bloc.dart';
import 'package:weather_forecast_app/bloc/weather_event.dart';
import 'package:weather_forecast_app/bloc/weather_state.dart';
import 'package:weather_forecast_app/screens/weather_screen.dart';

class SearchScreen extends StatelessWidget {
  final _textController = TextEditingController();

  SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WeatherBloc weatherBloc = BlocProvider.of<WeatherBloc>(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/earth.png',
              scale: 2.5,
            ),
            const SizedBox(height: 10),
            const Text(
              'Search Weather',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: TextField(
                controller: _textController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                  ),
                  hintText: 'Enter city name',
                  fillColor: Color.fromARGB(255, 215, 226, 235),
                  filled: true,
                ),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                weatherBloc.add(FetchWeather(_textController.text));
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const WeatherScreen(),
                  ),
                );
              },
              child: const Text('Get Weather'),
            ),
          ],
        ),
      ),
    );
  }
}
