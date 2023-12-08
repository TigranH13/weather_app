import 'package:intl/intl.dart';

abstract class StringUtil {
  static String getTempAsFormatedString({required double temp}) {
    return '${temp.round()}°';
  }

  static String getWeekDayAsString({required DateTime dateTime}) {
    return DateFormat('EEEE').format(dateTime);
  }

  static String getMonthAndDayAsString({required DateTime dateTime}) {
    return DateFormat('MMMd').format(dateTime);
  }
}
