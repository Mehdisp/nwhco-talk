import 'package:easy_localization/easy_localization.dart';

extension DateTimeExtensions on DateTime {
  String toTimeString() {
    final DateFormat formatter = DateFormat('HH:mm');
    return formatter.format(this);
  }

  String toNormalDate() {
    final DateFormat formatter = DateFormat('EEE, MMM d, yyyy');
    return formatter.format(this);
  }

  String toMonthDay() {
    final DateFormat formatter = DateFormat('MMM d');
    return formatter.format(this);
  }
}
