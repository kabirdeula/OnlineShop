import 'package:hive_flutter/hive_flutter.dart';

class HiveUtil {
  /// Opens a Hive box with the given [boxName].
  /// If the box is not already open, it will be opened.
  ///
  /// [T] is the type of the data stored in the box.
  static Future<Box<T>> openHiveBox<T>(String boxName) async {
    if (!Hive.isBoxOpen(boxName)) {
      return await Hive.openBox<T>(boxName);
    }
    return Hive.box<T>(boxName);
  }
}
