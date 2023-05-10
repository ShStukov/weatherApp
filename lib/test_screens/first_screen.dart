// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:weather_forecast_app/api/weather_api.dart';
// import 'package:weather_forecast_app/bloc/weather_bloc.dart';
// import 'package:weather_forecast_app/bloc/weather_event.dart';
// import 'package:http/http.dart' as http;
// import 'package:weather_forecast_app/models/weather.dart';
// import 'package:weather_forecast_app/screens/second_screen.dart';

// class FirstScreen extends StatefulWidget {
//   const FirstScreen({super.key});

//   @override
//   State<FirstScreen> createState() => _FirstScreenState();
// }

// class _FirstScreenState extends State<FirstScreen> {
//   final TextEditingController _textController = TextEditingController();

//   @override
//   void dispose() {
//     _textController.dispose();
//     super.dispose();
//   }

  
//   void _onSubmit() {
//     final cityName = _textController.text.trim();

//     if (cityName.isNotEmpty) {
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => BlocProvider(
//             create: (context) => WeatherBloc(
//               weatherApi: WeatherApi(httpClient: http.Client()),
//             )..add(FetchWeather(cityName)),
//             child: SecondScreen(weather: Weather()),
//           ),
//         ),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Weather App'),
//       ),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               TextField(
//                 controller: _textController,
//                 decoration: const InputDecoration(
//                   hintText: 'Enter a city name',
//                 ),
//                 textAlign: TextAlign.center,
//                 onSubmitted: (_) => _onSubmit(),
//               ),
//               const SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: _onSubmit,
//                 child: const Text('Get Weather'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }