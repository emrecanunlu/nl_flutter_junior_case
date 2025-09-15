import 'package:jr_case_boilerplate/core/base/base_model.dart';

class ApiResponseModel extends BaseModel<ApiResponseModel> {
  int code;
  String? message;

  ApiResponseModel({this.code = 0, this.message});

  @override
  ApiResponseModel fromJson(Map<String, dynamic> json) {
    return ApiResponseModel(code: json['code'], message: json['message']);
  }

  @override
  Map<String, dynamic> toJson() {
    return {'code': code, 'message': message};
  }
}
