import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_forecast_app/api/weather_repository.dart';
import 'package:weather_forecast_app/bloc/weather_event.dart';
import 'package:weather_forecast_app/bloc/weather_state.dart';
import 'package:weather_forecast_app/models/weather.dart';

// класс BloC

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;

  // В конструктор мы передаем на репозиторий с помощью которого будем получать погоду
  // и начальное состояние, когда данных о погоде нет
  WeatherBloc({required this.weatherRepository}) : super(WeatherInitial()) {
    // далее мы реализуем обработчик наших событий
    on<FetchCityEvent>(
      (event, emit) async {
        emit(WeatherLoading()); // генерация загрузки данных о погоде
        try {
          final Weather loadedWeather = await weatherRepository.getWeather(event.cityName);
          emit(WeatherLoaded(weather: loadedWeather)); // генерация погоды при успешной загрузки с переданным названием города
        } catch (_) {
          emit(WeatherError());
        }
      },
    );
  }
}
