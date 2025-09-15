import 'package:jr_case_boilerplate/core/models/user/response/user_model.dart';

abstract class IAuthManager {
  Future<void> saveSession({required UserModel user, required String token});
  Future<void> updateSession({required UserModel user});
  Future<void> removeSession();
  Future<void> initSession();

  bool get isAuthenticated;
  UserModel get user;
  String get token;
}
