import 'package:hive_flutter/hive_flutter.dart';

/// Register Hive Adaptor
Future initHiveDatabase() async {
  await Hive.initFlutter();
}
