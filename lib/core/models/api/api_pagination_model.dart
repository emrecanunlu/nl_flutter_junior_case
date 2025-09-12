import 'package:jr_case_boilerplate/core/base/base_model.dart';

class ApiPaginationModel extends BaseModel<ApiPaginationModel> {
  int totalCount;
  int perPage;
  int maxPage;
  int currentPage;

  ApiPaginationModel({
    this.totalCount = 0,
    this.perPage = 0,
    this.maxPage = 0,
    this.currentPage = 0,
  });

  factory ApiPaginationModel.fromJson(Map<String, dynamic> json) {
    return ApiPaginationModel(
      totalCount: json['totalCount'] ?? 0,
      perPage: json['perPage'] ?? 0,
      maxPage: json['maxPage'] ?? 0,
      currentPage: json['currentPage'] ?? 0,
    );
  }

  @override
  ApiPaginationModel fromJson(Map<String, dynamic> json) {
    return ApiPaginationModel.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'totalCount': totalCount,
      'perPage': perPage,
      'maxPage': maxPage,
      'currentPage': currentPage,
    };
  }
}
