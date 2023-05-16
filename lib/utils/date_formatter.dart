import 'package:intl/intl.dart';

class DateFormatter {
  static DateFormatter instance = DateFormatter();

  String format(DateTime dateTime) {
    return DateFormat('dd-MM-yyyy HH:mm:ss').format(dateTime);
  }
}
