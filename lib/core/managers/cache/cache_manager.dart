import 'dart:convert';

import 'package:jr_case_boilerplate/core/base/base_model.dart';
import 'package:jr_case_boilerplate/core/managers/cache/i_cache_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheManager implements ICacheManager {
  static final CacheManager _instance = CacheManager._();
  static CacheManager get instance => _instance;

  CacheManager._();

  SharedPreferences? _prefs;

  Future<void> init() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  @override
  T? getModel<T extends BaseModel>(String key, T model) {
    final json = _prefs!.getString(key);
    return json != null ? model.fromJson(jsonDecode(json)) as T : null;
  }

  @override
  String? getString(String key) {
    return _prefs!.getString(key);
  }

  @override
  Future<bool> remove(String key) {
    return _prefs!.remove(key);
  }

  @override
  Future<void> saveModel<T extends BaseModel>(String key, T model) {
    return _prefs!.setString(key, jsonEncode(model.toJson()));
  }

  @override
  Future<void> saveString(String key, String value) {
    return _prefs!.setString(key, value);
  }
}
