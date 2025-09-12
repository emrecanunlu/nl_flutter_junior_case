import 'package:jr_case_boilerplate/core/managers/network/network_manager.dart';
import 'package:jr_case_boilerplate/core/models/auth/request/login_request_model.dart';
import 'package:jr_case_boilerplate/core/models/auth/request/register_request_model.dart';
import 'package:jr_case_boilerplate/core/models/api/api_result_model.dart';
import 'package:jr_case_boilerplate/core/models/user/response/user_model.dart';

class UserService {
  static UserService? _instance;
  static UserService get instance => _instance ??= UserService._();

  UserService._();

  Future<ApiResultModel<UserModel>> login(LoginRequestModel model) async {
    final response = await NetworkManager.instance.dio.post(
      '/user/login',
      data: model.toJson(),
    );
    return ApiResultModel<UserModel>.fromJson(response.data, UserModel());
  }

  Future<ApiResultModel<UserModel>> register(RegisterRequestModel model) async {
    final response = await NetworkManager.instance.dio.post(
      '/user/register',
      data: model.toJson(),
    );
    return ApiResultModel<UserModel>.fromJson(response.data, UserModel());
  }
}
