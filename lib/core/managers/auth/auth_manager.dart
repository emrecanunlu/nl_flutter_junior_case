import 'package:flutter/material.dart';
import 'package:jr_case_boilerplate/core/enums/app/app_local_storage_keys.dart';
import 'package:jr_case_boilerplate/core/managers/auth/i_auth_managert.dart';
import 'package:jr_case_boilerplate/core/managers/cache/cache_manager.dart';
import 'package:jr_case_boilerplate/core/models/user/response/user_model.dart';
import 'package:jr_case_boilerplate/core/services/user_service.dart';

class AuthManager implements IAuthManager {
  final UserService _userService = UserService.instance;
  final CacheManager _cacheManager = CacheManager.instance;

  static final AuthManager _instance = AuthManager._();
  static AuthManager get instance => _instance;

  AuthManager._();

  UserModel? _user;
  String? _token;

  @override
  Future<void> initSession() async {
    try {
      final user = _cacheManager.getModel<UserModel>(
        AppLocalStorageKeys.user.key,
        UserModel(),
      );
      final token = _cacheManager.getString(AppLocalStorageKeys.token.key);

      if (user == null || token == null) {
        return;
      }

      _token = token;

      final result = await _userService.getProfile();

      if (result.data != null) {
        _user = result.data;
        _token = result.data?.token ?? "";
      }
    } catch (e) {
      debugPrint('initSession error: $e');
    }
  }

  @override
  bool get isAuthenticated => _user != null && _token != null;

  @override
  Future<void> removeSession() async {
    _user = null;
    _token = null;

    await _cacheManager.remove(AppLocalStorageKeys.user.key);
    await _cacheManager.remove(AppLocalStorageKeys.token.key);
  }

  @override
  Future<void> saveSession({
    required String token,
    required UserModel user,
  }) async {
    _token = token;
    _user = user;

    await _cacheManager.saveString(AppLocalStorageKeys.token.key, token);
    await _cacheManager.saveModel<UserModel>(
      AppLocalStorageKeys.user.key,
      user,
    );
  }

  @override
  String get token => _token ?? '';

  @override
  Future<void> updateSession({required UserModel user}) async {
    _user = user;
    await _cacheManager.saveModel<UserModel>(
      AppLocalStorageKeys.user.key,
      user,
    );
  }

  @override
  UserModel get user => _user ?? UserModel();
}
