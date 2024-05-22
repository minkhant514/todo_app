import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FormatHelper {
  FormatHelper._();
  static final FormatHelper _singleton = FormatHelper._();
  factory FormatHelper() => _singleton;

  /// to format date to Month day, Year (May 21,2024)
  static String yMMMMDFormat(DateTime dateTime) {
    return DateFormat.yMMMMd().format(dateTime).toString();
  }

  /// to format date to Year/Month/Day
  static String yMDFormat(DateTime dateTime) {
    return DateFormat.yMd().format(dateTime).toString();
  }

  /// to format time to AM and PM
  static String timeFormat(BuildContext context, TimeOfDay timeOfDay) {
    final localizations = MaterialLocalizations.of(context);
    final time = localizations.formatTimeOfDay(
      timeOfDay,
      alwaysUse24HourFormat: false,
    );
    return time;
  }
}
