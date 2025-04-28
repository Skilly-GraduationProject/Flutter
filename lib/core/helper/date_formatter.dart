import 'package:intl/intl.dart';

class DateFormatter {
  static String formatDate(String date) {
    DateTime dateTime = DateTime.parse(date);
    return DateFormat('dd/MM/yyyy').format(dateTime);
  }

}
