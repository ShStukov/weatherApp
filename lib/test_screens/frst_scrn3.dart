// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:weather_forecast_app/bloc/weather_bloc.dart';
// import 'package:weather_forecast_app/bloc/weather_event.dart';
// import 'package:weather_forecast_app/bloc/weather_state.dart';
// import 'package:weather_forecast_app/models/weather.dart';
// import 'package:weather_forecast_app/test_screens/scnd_scrn3.dart';

// class FrstScrn3 extends StatelessWidget {
//   const FrstScrn3({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final weatherBloc = BlocProvider.of<WeatherBloc>(context);
//     var cityController = TextEditingController();

//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         Center(
//           child: BlocBuilder<WeatherBloc, WeatherState>(
//             builder: ((context, state) {
//               if (state is WeatherInitial) {
//                 return Column(
//                   children: [
//                     const Text(
//                       "Search Weather",
//                       style: TextStyle(
//                           fontSize: 40,
//                           fontWeight: FontWeight.w500,
//                           color: Colors.white70),
//                     ),
//                     const Text(
//                       "Instanly",
//                       style: TextStyle(
//                           fontSize: 40,
//                           fontWeight: FontWeight.w200,
//                           color: Colors.white70),
//                     ),
//                     const SizedBox(height: 24),
//                     TextFormField(
//                       controller: cityController,
//                       decoration: const InputDecoration(
//                         prefixIcon: Icon(Icons.search),
//                         enabledBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.all(Radius.circular(10)),
//                           borderSide: BorderSide(
//                               color: Colors.white70, style: BorderStyle.solid),
//                         ),
//                         hintText: 'City Name',
//                         hintStyle: TextStyle(color: Colors.white70),
//                       ),
//                       style: const TextStyle(color: Colors.white70),
//                     ),
//                     const SizedBox(height: 20),
//                     ElevatedButton(
//                       onPressed: () {
//                         weatherBloc.add(FetchWeather(cityController.text));
//                       },
//                       child: const Text(
//                         'Search',
//                         style: TextStyle(color: Colors.white70, fontSize: 16),
//                       ),
//                     ),
//                   ],
//                 );
//               } else if (state is WeatherLoading) {
//                 return const Center(child: CircularProgressIndicator());
//               } else if (state is WeatherLoaded) {
//                 return ScndScrn3(city: cityController.text, weather: Weather(name: cityController.text));
//               } else {
//                 return const Text('Error', style: TextStyle(color: Colors.white, fontSize: 20));
//               }
//             }),
//           ),
//         ),
//       ],
//     );
//   }
// }
