import 'package:jr_case_boilerplate/core/base/base_model.dart';
import 'package:jr_case_boilerplate/core/models/api/api_response_model.dart';
import 'package:jr_case_boilerplate/core/models/api/api_pagination_model.dart';

class ApiPaginatedListResultModel<T extends BaseModel<T>> {
  ApiResponseModel response;
  List<T> data;
  ApiPaginationModel pagination;

  ApiPaginatedListResultModel({
    ApiResponseModel? response,
    this.data = const [],
    ApiPaginationModel? pagination,
  }) : response = response ?? ApiResponseModel(),
       pagination = pagination ?? ApiPaginationModel();

  factory ApiPaginatedListResultModel.fromJson(
    Map<String, dynamic> json,
    T model,
    String dataKey,
  ) {
    final List<dynamic> dataList = json['data'][dataKey] ?? [];

    return ApiPaginatedListResultModel(
      response: ApiResponseModel().fromJson(json['response']),
      data: dataList.map((item) => model.fromJson(item)).toList(),
      pagination: ApiPaginationModel().fromJson(json['data']['pagination']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'response': response.toJson(),
      'data': data.map((item) => item.toJson()).toList(),
      'pagination': pagination.toJson(),
    };
  }
}
