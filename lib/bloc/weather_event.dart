
// событие отвечающее за получения города 

abstract class WeatherEvent {}

class FetchCityEvent extends WeatherEvent {
  final String cityName;

  FetchCityEvent(this.cityName);
}