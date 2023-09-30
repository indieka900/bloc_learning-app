import 'dart:convert';

import 'package:bloc_app/common/entities/entities.dart';
import 'package:bloc_app/common/values/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  late final SharedPreferences _prefernces;
  Future<StorageService> init() async {
    _prefernces = await SharedPreferences.getInstance();
    return this;
  }

  Future<bool> setBool(String key, bool value) async {
    return await _prefernces.setBool(key, value);
  }

  Future<bool> setString(String key, String value) async {
    return await _prefernces.setString(key, value);
  }

  bool getDeviceFirstOpen() {
    return _prefernces.getBool(AppConst.STORAGE_DEVICE_OPEN_FIRST_TIME) ??
        false;
  }

  bool getIsLoggedIn() {
    return _prefernces.getString(AppConst.STORAGE_USER_TOKEN_KEY) == null
        ? false
        : true;
  }

  Future<bool> remove(String key) {
    return _prefernces.remove(key);
  }

  String getUserToken() {
    return _prefernces.getString(AppConst.STORAGE_USER_TOKEN_KEY) ?? "";
  }

  User getUserProfile() {
    var profileOffline = _prefernces.getString(
          AppConst.STORAGE_USER_PROFILE_KEY,
        ) ??
        "";
    if (profileOffline.isNotEmpty) {
      return User.fromJson(jsonDecode(profileOffline));
    }
    return User();
  }
}
