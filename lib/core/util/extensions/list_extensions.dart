import 'package:connectivity_plus/connectivity_plus.dart';

extension ListExtension<T> on Iterable<T> {
  Iterable<T?> takeOrNull(int count) {
    if (length >= count) return take(count);

    return List<T?>.generate(count, (index) {
      return elementAtOrNull(index);
    });
  }

  Iterable<T?> shouldSkipNulls(bool skip) {
    if (skip) return where((element) => element != null);

    return this;
  }

  T? firstWhereOrNull(bool Function(T) test) {
    for (var item in this) {
      if (test(item)) return item;
    }
    return null;
  }

  List<T> divideBy(T Function(int) separatorBuilder) {
    final list = <T>[];
    for (int i = 0; i < length; i++) {
      list.add(elementAt(i));
      if (i < length - 1) {
        list.add(separatorBuilder(i));
      }
    }

    return list.toList();
  }

  List<R> mapIndexed<R>(R Function(int, T) mapper) {
    final list = <R>[];
    for (int i = 0; i < length; i++) {
      list.add(mapper(i, elementAt(i)));
    }

    return list;
  }
}

extension ConnectivityExtension on List<ConnectivityResult>? {
  bool get hasConnection {
    if (this == null) return true;
    return !this!.contains(ConnectivityResult.none);
  }
}
