import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_forecast_app/api/weather_repository.dart';
import 'package:weather_forecast_app/bloc/weather_event.dart';
import 'package:weather_forecast_app/bloc/weather_state.dart';
import 'package:weather_forecast_app/models/weather.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;

  WeatherBloc({required this.weatherRepository}) : super(WeatherInitial()) {
    on<FetchWeather>(
      (event, emit) async {
        emit(WeatherLoading());
        try {
          final Weather loadedWeather = await weatherRepository.getWeather(event.cityName);
          emit(WeatherLoaded(weather: loadedWeather));
        } catch (_) {
          emit(WeatherError());
        }
      },
    );
  }
}
