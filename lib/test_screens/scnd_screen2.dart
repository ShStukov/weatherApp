// import 'package:flutter/material.dart';
// import 'package:weather_forecast_app/models/weather.dart';

// class ScndScrn2 extends StatelessWidget {
//   final Weather weather;

//   const ScndScrn2({required this.weather});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(weather.name!),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               '${weather.temp}°C',
//               style: const TextStyle(fontSize: 48),
//             ),
//             SizedBox(height: 16),
//             Text(
//               '${weather.condition}',
//               style: TextStyle(fontSize: 24),
//             ),
//             SizedBox(height: 16),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text('Min temp: ${weather.tempMin}°C'),
//                 SizedBox(width: 16),
//                 Text('Max temp: ${weather.tempMax}°C'),
//               ],
//             ),
//             SizedBox(height: 16),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text('Humidity: ${weather.humidity}%'),
//                 SizedBox(width: 16),
//                 Text('Wind: ${weather.wind} km/h'),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }