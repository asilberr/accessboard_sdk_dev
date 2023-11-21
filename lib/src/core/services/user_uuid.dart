// user_uuid.dart

import 'package:uuid/uuid.dart';
import 'package:device_info/device_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserUUID {
  String _deviceIdentifier = '';
  String _customIdentifier = '';
  String _cachedUUID = '';

  // Singleton pattern for the UserUUID class
  static final UserUUID _instance = UserUUID._internal();

  factory UserUUID() {
    return _instance;
  }

  UserUUID._internal() {
    _initDeviceIdentifier();
    _loadCachedUUID();
  }

  // Initialize the device identifier using the device_info package
  Future<void> _initDeviceIdentifier() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    _deviceIdentifier = androidInfo.androidId;
  }

  // Load cached UUID from SharedPreferences
  Future<void> _loadCachedUUID() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _cachedUUID = prefs.getString('userUUID') ?? '';
  }

  // Set custom identifier for the user
  void setCustomIdentifier(String customIdentifier) {
    _customIdentifier = customIdentifier;
    _generateUUID(); // Regenerate UUID when custom identifier changes
  }

  // Generate and cache the user UUID
  void _generateUUID() {
    // Concatenate device identifier and custom identifier
    String combinedIdentifier = '$_deviceIdentifier:$_customIdentifier';

    // Generate a UUID using a simple hash function
    _cachedUUID = _simpleHash(combinedIdentifier);

    // Save the UUID to SharedPreferences for persistence
    _saveUUIDToPrefs();
  }

  // Save the UUID to SharedPreferences
  Future<void> _saveUUIDToPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('userUUID', _cachedUUID);
  }

  // Simple hash function to generate a UUID-like string
  String _simpleHash(String input) {
    int hash = 0;
    for (int i = 0; i < input.length; i++) {
      hash = (31 * hash + input.codeUnitAt(i)) & 0xFFFFFFFF;
    }
    return Uuid().v5(Uuid.NAMESPACE_URL, hash.toString());
  }

  // Get the current user UUID
  String getUserUUID() {
    return _cachedUUID;
  }
}
