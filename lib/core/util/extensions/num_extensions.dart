extension NumExtensions on num {
  Duration get ms => Duration(milliseconds: toInt());
  Duration get sec => Duration(seconds: toInt());
  Duration get min => Duration(minutes: toInt());
  Duration get days => Duration(days: toInt());

  Future get msDelay => Future.delayed(ms);
  Future get secDelay => Future.delayed(sec);
  Future get minDelay => Future.delayed(min);

  int get length => toString().length;

}