import 'package:uuid/uuid.dart';
import 'package:device_info/device_info.dart';

class UserUUID {
  String _deviceIdentifier = '';
  String _customIdentifier = '';

  // Constructor to initialize device identifier
  UserUUID() {
    _initDeviceIdentifier();
  }

  // Initialize the device identifier using the device_info package
  Future<void> _initDeviceIdentifier() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    _deviceIdentifier = androidInfo.androidId;
  }

  // Set custom identifier for the user
  void setCustomIdentifier(String customIdentifier) {
    _customIdentifier = customIdentifier;
  }

  // Generate the user UUID
  String generateUUID() {
    // Concatenate device identifier and custom identifier
    String combinedIdentifier = '$_deviceIdentifier:$_customIdentifier';

    // Generate a UUID using a simple hash function
    return _simpleHash(combinedIdentifier);
  }

  // Simple hash function to generate a UUID-like string
  String _simpleHash(String input) {
    int hash = 0;
    for (int i = 0; i < input.length; i++) {
      hash = (31 * hash + input.codeUnitAt(i)) & 0xFFFFFFFF;
    }
    return Uuid().v5(Uuid.NAMESPACE_URL, hash.toString());
  }
}

void main() async {
  // Create an instance of UserUUID
  UserUUID userUUID = UserUUID();

  // Set custom identifier (replace with your user's unique identifier)
  userUUID.setCustomIdentifier('john_doe');

  // Generate and print the user UUID
  String uuid = userUUID.generateUUID();
  print('User UUID: $uuid');
}
