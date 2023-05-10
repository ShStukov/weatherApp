import 'package:intl/intl.dart';

class DateFormatForecast {
  static String getFormattedDate (DateTime dateTime) {
    return DateFormat('EEE, MMM d').format(dateTime);
  }
}