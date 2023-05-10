// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:weather_forecast_app/bloc/weather_bloc.dart';
// import 'package:weather_forecast_app/bloc/weather_event.dart';
// import 'package:weather_forecast_app/models/weather.dart';

// class ScndScrn3 extends StatelessWidget {
//   final Weather weather;
//   final String city;

//   const ScndScrn3({super.key, required this.city, required this.weather});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Text(city,
//             style: const TextStyle(
//                 color: Colors.white70,
//                 fontSize: 30,
//                 fontWeight: FontWeight.bold)),
//         const SizedBox(height: 10),
//         Text('${weather.temp}C',
//             style: const TextStyle(color: Colors.white70, fontSize: 50)),
//         const Text('Temperature',
//             style: TextStyle(color: Colors.white70, fontSize: 14)),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: <Widget>[
//             Column(
//               children: <Widget>[
//                 Text(
//                   "${weather.tempMin}C",
//                   style: const TextStyle(color: Colors.white70, fontSize: 30),
//                 ),
//                 const Text(
//                   "Min Temprature",
//                   style: TextStyle(color: Colors.white70, fontSize: 14),
//                 ),
//               ],
//             ),
//             Column(
//               children: <Widget>[
//                 Text(
//                   "${weather.tempMax}C",
//                   style: const TextStyle(color: Colors.white70, fontSize: 30),
//                 ),
//                 const Text(
//                   "Max Temprature",
//                   style: TextStyle(color: Colors.white70, fontSize: 14),
//                 ),
//               ],
//             ),
//           ],
//         ),
//         const SizedBox(height: 20),
//         ElevatedButton(
//           onPressed: () {
//             BlocProvider.of<WeatherBloc>(context).add(ResetWeather());
//           },
//           child: const Text('Search'),
//         ),
//       ],
//     );
//   }
// }
