extension DurationExtensions on Duration {
  /// Converts the duration into a readable string
  /// 05:15
  String toHoursMinutes() {
    String twoDigitMinutes = _toTwoDigits(inMinutes.remainder(60));
    return "${_toTwoDigits(inHours)}:$twoDigitMinutes";
  }

  /// Converts the duration into a readable string
  /// 05:15:35
  String toHoursMinutesSeconds() {
    String twoDigitMinutes = _toTwoDigits(inMinutes.remainder(60));
    String twoDigitSeconds = _toTwoDigits(inSeconds.remainder(60));
    return "${_toTwoDigits(inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }

  /// Converts the duration into a readable string
  /// 15:35
  String toMinutesSeconds() {
    String twoDigitMinutes = _toTwoDigits(inMinutes);
    String twoDigitSeconds = _toTwoDigits(inSeconds.remainder(60));
    return isNegative
        ? "-$twoDigitMinutes:$twoDigitSeconds"
        : "$twoDigitMinutes:$twoDigitSeconds";
  }

  String _toTwoDigits(int n) {
    n = n.abs();
    if (n >= 10) {
      return "$n";
    } else {
      return "0$n";
    }
  }

  String format() => '$this'.split('.')[0].padLeft(8, '0');

  String minFormat() {
    var pure = '$this'.split('.')[0].padLeft(8, '0');
    var s = pure.split(':');
    s.removeWhere((element) => element == "00");
    var d = s.join(":");
    return d; // 00:00:12 => 12
  }

  String removeHour() {
    var pure = '$this'.split('.')[0].padLeft(8, '0');
    var s = pure.split(':');
    if (s[0] == "00") {
      s.removeAt(0);
    }
    var d = s.join(":");
    return d; // 00:00:12 => 12
  }

  String durationToString() {
    final twoDigitMinutes = _toTwoDigits(
      inMinutes.remainder(Duration.minutesPerHour),
    );

    final twoDigitSeconds = _toTwoDigits(
      inSeconds.remainder(Duration.secondsPerMinute),
    );

    return '$twoDigitMinutes:$twoDigitSeconds';
  }
}
