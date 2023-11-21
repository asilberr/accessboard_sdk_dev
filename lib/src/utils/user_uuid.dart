import 'package:uuid/uuid.dart';
import 'package:device_info/device_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserUUID {
  String _deviceIdentifier = '';
  String _customIdentifier = '';
  String _cachedUUID = '';

  static final UserUUID _instance = UserUUID._internal();

  factory UserUUID() {
    return _instance;
  }

  UserUUID._internal() {
    _initDeviceIdentifier().catchError((error) {
      // Handle error during device identifier initialization
      print('Error initializing device identifier: $error');
    });
    _loadCachedUUID().catchError((error) {
      // Handle error during loading of cached UUID
      print('Error loading cached UUID: $error');
    });
  }

  Future<void> _initDeviceIdentifier() async {
    try {
      DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      _deviceIdentifier = androidInfo.androidId;
    } catch (error) {
      // Handle error during device identifier initialization
      print('Error initializing device identifier: $error');
    }
  }

  Future<void> _loadCachedUUID() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      _cachedUUID = prefs.getString('userUUID') ?? '';
    } catch (error) {
      // Handle error during loading of cached UUID
      print('Error loading cached UUID: $error');
    }
  }

  void setCustomIdentifier(String customIdentifier) {
    _customIdentifier = customIdentifier;
    _generateUUID();
  }

  void _generateUUID() {
    String combinedIdentifier = '$_deviceIdentifier:$_customIdentifier';
    _cachedUUID = _simpleHash(combinedIdentifier);
    _saveUUIDToPrefs().catchError((error) {
      // Handle error during saving of UUID to SharedPreferences
      print('Error saving UUID to SharedPreferences: $error');
    });
  }

  Future<void> _saveUUIDToPrefs() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('userUUID', _cachedUUID);
    } catch (error) {
      // Handle error during saving of UUID to SharedPreferences
      print('Error saving UUID to SharedPreferences: $error');
    }
  }

  String _simpleHash(String input) {
    int hash = 0;
    for (int i = 0; i < input.length; i++) {
      hash = (31 * hash + input.codeUnitAt(i)) & 0xFFFFFFFF;
    }
    return const Uuid().v5(Uuid.NAMESPACE_URL, hash.toString());
  }

  String getUserUUID() {
    return _cachedUUID;
  }
}
