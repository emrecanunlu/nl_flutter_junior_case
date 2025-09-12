import 'package:jr_case_boilerplate/core/base/base_model.dart';

class RegisterRequestModel extends BaseModel<RegisterRequestModel> {
  String name;
  String email;
  String password;

  RegisterRequestModel({this.name = '', this.email = '', this.password = ''});

  factory RegisterRequestModel.fromJson(Map<String, dynamic> json) {
    return RegisterRequestModel(
      name: json['name'],
      email: json['email'],
      password: json['password'],
    );
  }

  @override
  RegisterRequestModel fromJson(Map<String, dynamic> json) {
    return RegisterRequestModel.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return {'name': name, 'email': email, 'password': password};
  }
}
