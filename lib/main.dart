import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_forecast_app/api/weather_repository.dart';
import 'package:weather_forecast_app/bloc/weather_bloc.dart';
import 'package:weather_forecast_app/screens/search_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherBloc(weatherRepository: WeatherRepository()),
      child: MaterialApp(
        title: 'Weather with BloC',
        home: SearchScreen(),
      ),
    );
  }
}

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       home: Scaffold(
//         resizeToAvoidBottomInset: false,
//         backgroundColor: Colors.grey[900],
//         body: BlocProvider<WeatherBloc>(
//           create: (context) => WeatherBloc(weatherApi: WeatherApi(httpClient: http.Client())),
//           child: const FrstScrn3(),
//         ),
//       )
//     );
//   }
// }

// void main() {
//   final WeatherApi weatherApi = WeatherApi(httpClient: http.Client());
//   runApp(
//     MultiBlocProvider(
//       providers: [
//         BlocProvider<WeatherBloc>(
//           create: (context) => WeatherBloc(weatherApi: weatherApi),
//         ),
//       ],
//       child: MyApp(weatherApi: weatherApi),
//     ),
//   );
// }

// class MyApp extends StatelessWidget {
//   final WeatherApi weatherApi;
//   const MyApp({super.key, required this.weatherApi});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Weather App',
//       home: BlocProvider(
//         create: (context) => WeatherBloc(weatherApi: weatherApi),
//         child: const FirstScreen(),
//       ),
//     );
//   }
// }


// void main() => runApp(const MyApp());

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   late final WeatherApi weatherApi;
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: BlocProvider(
//         create: (context) => WeatherBloc(weatherApi: weatherApi),
//         child: const FirstScreen(),
//       ),
//     );
//   }
// }


// void main() {
//   final httpClient = http.Client();
//   final weatherApi = WeatherApi(httpClient: httpClient);
//   final weatherBloc = WeatherBloc(weatherApi: weatherApi);

//   runApp(
//     BlocProvider.value(
//       value: weatherBloc,
//       child: MyApp(),
//     ),
//   );
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Weather App',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: BlocBuilder<WeatherBloc, WeatherState>(
//         builder: (context, state) {
//           if (state is WeatherInitial) {
//             return FrstScrn2();
//           } else if (state is WeatherLoading) {
//             return const Scaffold(
//               body: Center(
//                 child: CircularProgressIndicator(),
//               ),
//             );
//           } else if (state is WeatherLoaded) {
//             return ScndScrn2(weather: state.weather);
//           } else {
//             return const Scaffold(
//               body: Center(
//                 child: Text('Failed to load weather data'),
//               ),
//             );
//           }
//         },
//       ),
//     );
//   }
// }