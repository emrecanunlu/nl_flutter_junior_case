import 'package:jr_case_boilerplate/core/base/base_model.dart';
import 'package:jr_case_boilerplate/core/models/api/api_response_model.dart';

class ApiResultModel<T extends BaseModel<T>> {
  ApiResponseModel response;
  T? data;

  ApiResultModel({ApiResponseModel? response, this.data})
    : response = response ?? ApiResponseModel();

  factory ApiResultModel.fromJson(Map<String, dynamic> json, T model) {
    return ApiResultModel(
      response: ApiResponseModel().fromJson(json['response']),
      data: model.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {'response': response.toJson(), 'data': data?.toJson()};
  }
}
