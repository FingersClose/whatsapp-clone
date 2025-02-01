import 'package:intl/intl.dart';

class Time {
  static final Time _time = Time._private();
  String get currentTime => getTime();
  Time._private();
  DateTime now = DateTime.now();
  factory Time() {
    return _time;
  }

  String getTime() {
    return DateFormat('hh:mm a').format(now);
  }
}