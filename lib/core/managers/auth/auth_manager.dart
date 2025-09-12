import 'package:jr_case_boilerplate/core/managers/auth/i_auth_managert.dart';
import 'package:jr_case_boilerplate/core/models/user/response/user_model.dart';

class AuthManager implements IAuthManager {
  static final AuthManager _instance = AuthManager._();
  static AuthManager get instance => _instance;

  AuthManager._();

  @override
  Future<void> initSession() async {}

  @override
  // TODO: implement isAuthenticated
  bool get isAuthenticated => throw UnimplementedError();

  @override
  Future<void> removeSession() {
    // TODO: implement removeSession
    throw UnimplementedError();
  }

  @override
  Future<void> saveSession({required UserModel user, required String token}) {
    // TODO: implement saveSession
    throw UnimplementedError();
  }

  @override
  // TODO: implement token
  String get token => throw UnimplementedError();

  @override
  Future<void> updateSession({required UserModel user}) {
    // TODO: implement updateSession
    throw UnimplementedError();
  }

  @override
  // TODO: implement user
  UserModel get user => throw UnimplementedError();
}
