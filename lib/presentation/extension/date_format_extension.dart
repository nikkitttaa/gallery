import 'package:intl/intl.dart';

extension DateTimeX on DateTime{
  String formatDate() => DateFormat('dd.MM.yyyy', 'ru').format(this);
}

