import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_forecast_app/bloc/weather_bloc.dart';
import 'package:weather_forecast_app/bloc/weather_event.dart';
import 'package:weather_forecast_app/screens/weather_screen.dart';

// Первый экран с полем для ввода города

class SearchScreen extends StatelessWidget {
  final _textController = TextEditingController(); // переменная для управления ввода текста

  SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WeatherBloc weatherBloc = BlocProvider.of<WeatherBloc>(context); // переменная для получения доступа к BloC
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
              // поле для ввода названия города
              child: TextField( 
                controller: _textController, // обрботчик введенного текста
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
                // В блок мы добавляем состояние с переданным в TextField названием города
                weatherBloc.add(FetchCityEvent(_textController.text)); 
                // с помощью Navigator.push при нажатии кнопки мы переходим на второй экран
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
