import 'package:jr_case_boilerplate/core/managers/network/network_manager.dart';
import 'package:jr_case_boilerplate/core/models/api/api_list_result_model.dart';
import 'package:jr_case_boilerplate/core/models/api/api_paginated_list_result_model.dart';
import 'package:jr_case_boilerplate/core/models/api/api_result_model.dart';
import 'package:jr_case_boilerplate/core/models/movie/movie_model.dart';

class MovieService {
  static MovieService? _instance;
  static MovieService get instance => _instance ??= MovieService._();

  MovieService._();

  Future<ApiPaginatedListResultModel<MovieModel>> getMovies({
    int page = 1,
  }) async {
    final response = await NetworkManager.instance.dio.get(
      '/movie/list',
      queryParameters: {'page': page},
    );

    return ApiPaginatedListResultModel<MovieModel>.fromJson(
      response.data,
      MovieModel(),
      'movies',
    );
  }

  Future<ApiListResultModel<MovieModel>> getFavoriteMovies() async {
    final response = await NetworkManager.instance.dio.get('/movie/favorites');
    return ApiListResultModel<MovieModel>.fromJson(response.data, MovieModel());
  }

  Future<ApiResultModel<MovieModel>> favoriteMovie(String id) async {
    final response = await NetworkManager.instance.dio.post(
      '/movie/favorite/$id',
    );
    return ApiResultModel<MovieModel>.fromJson(response.data, MovieModel());
  }
}
