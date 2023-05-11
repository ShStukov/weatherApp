import 'package:intl/intl.dart';

// класс для преобразования даты в нужный нам формат

class DateFormatForecast {
  static String getFormattedDate (DateTime dateTime) {
    return DateFormat('EEE, MMM d').format(dateTime);
  }
}