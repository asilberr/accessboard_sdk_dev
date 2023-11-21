import 'package:shared_preferences/shared_preferences.dart';
import 'dart:math';

class UserUUID {
  Random _random = Random();
  late SharedPreferences _prefs;

  UserUUID();

  Future<void> initSharedPreferences() async {
    _prefs = await SharedPreferences.getInstance();
  }

  String generateUuid() {
    final int uuidLength = 36;

    final List<String> uuidParts = List<String>.generate(uuidLength, (index) {
      if (index == 8 || index == 13 || index == 18 || index == 23) {
        return '-';
      } else if (index == 14) {
        return '4'; // Version 4 UUID
      } else if (index == 19) {
        final int variant = (_random.nextInt(4) + 8); // [8, 9, A, B]
        return variant.toRadixString(16);
      } else {
        return _random.nextInt(16).toRadixString(16);
      }
    });

    final String uuid = uuidParts.join();

    _prefs.setString('uuid', uuid); // Save UUID to SharedPreferences

    return uuid;
  }

  // Added method to retrieve the stored UUID
  String getStoredUuid() {
    return _prefs.getString('uuid') ??
        ''; // Return an empty string if the UUID is not found
  }
}
