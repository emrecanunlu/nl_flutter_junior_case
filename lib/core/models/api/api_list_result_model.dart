import 'package:jr_case_boilerplate/core/base/base_model.dart';
import 'package:jr_case_boilerplate/core/models/api/api_response_model.dart';

class ApiListResultModel<T extends BaseModel<T>> {
  ApiResponseModel response;
  List<T> data;

  ApiListResultModel({ApiResponseModel? response, this.data = const []})
    : response = response ?? ApiResponseModel();

  factory ApiListResultModel.fromJson(Map<String, dynamic> json, T model) {
    return ApiListResultModel(
      response: ApiResponseModel().fromJson(json['response']),
      data: json['data'].map((item) => model.fromJson(item)).cast<T>().toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'response': response.toJson(),
      'data': data.map((item) => item.toJson()).toList(),
    };
  }
}
