import 'package:jr_case_boilerplate/core/base/base_model.dart';

class LoginRequestModel extends BaseModel<LoginRequestModel> {
  String email;
  String password;

  LoginRequestModel({this.email = '', this.password = ''});

  factory LoginRequestModel.fromJson(Map<String, dynamic> json) {
    return LoginRequestModel(email: json['email'], password: json['password']);
  }

  @override
  LoginRequestModel fromJson(Map<String, dynamic> json) {
    return LoginRequestModel.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return {'email': email, 'password': password};
  }
}
