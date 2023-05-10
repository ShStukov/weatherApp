class Weather {
  final String? name;
  final int? temp;
  final String? condition;
  final double? wind;
  final int? humidity;
  final String? icon;

  final int? temp1;
  final int? temp2;
  final int? temp3;

  final double? wind1;
  final double? wind2;
  final double? wind3;

  final int? humidity1;
  final int? humidity2;
  final int? humidity3;

  final String? icon1;
  final String? icon2;
  final String? icon3;

  final int? date1;
  final int? date2;
  final int? date3;

  Weather({
    this.name,
    this.temp,
    this.condition,
    this.wind,
    this.humidity,
    this.icon,
    this.temp1,
    this.temp2,
    this.temp3,
    this.wind1,
    this.wind2,
    this.wind3,
    this.humidity1,
    this.humidity2,
    this.humidity3,
    this.icon1,
    this.icon2,
    this.icon3,
    this.date1,
    this.date2,
    this.date3,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      name: json['location']['name'],
      temp: json['current']['temp_c'].toInt(),
      condition: json['current']['condition']['text'],
      wind: json['current']['wind_kph'] / 3.6,
      humidity: json['current']['humidity'],
      icon: json['current']['condition']['icon'],

      temp1: json['forecast']['forecastday'][1]['day']['mintemp_c'].toInt(),
      wind1: json['forecast']['forecastday'][1]['day']['maxwind_kph'] / 3.6,
      humidity1: json['forecast']['forecastday'][1]['day']['avghumidity'].toInt(),
      icon1: json['forecast']['forecastday'][1]['day']['condition']['icon'],
      date1: json['forecast']['forecastday'][1]['date_epoch'].toInt(),

      temp2: json['forecast']['forecastday'][2]['day']['mintemp_c'].toInt(),
      wind2: json['forecast']['forecastday'][2]['day']['maxwind_kph'] / 3.6,
      humidity2: json['forecast']['forecastday'][2]['day']['avghumidity'].toInt(),
      icon2: json['forecast']['forecastday'][2]['day']['condition']['icon'],
      date2: json['forecast']['forecastday'][2]['date_epoch'].toInt(),

      temp3: json['forecast']['forecastday'][3]['day']['mintemp_c'].toInt(),
      wind3: json['forecast']['forecastday'][3]['day']['maxwind_kph'] / 3.6,
      humidity3: json['forecast']['forecastday'][3]['day']['avghumidity'].toInt(),
      icon3: json['forecast']['forecastday'][3]['day']['condition']['icon'],
      date3: json['forecast']['forecastday'][3]['date_epoch'].toInt(),
    );
  }
}
