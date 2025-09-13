import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:jr_case_boilerplate/core/base/base_controller.dart';
import 'package:jr_case_boilerplate/core/managers/auth/auth_manager.dart';
import 'package:jr_case_boilerplate/core/models/movie/movie_model.dart';
import 'package:jr_case_boilerplate/core/models/user/response/user_model.dart';
import 'package:jr_case_boilerplate/core/services/movie_service.dart';

class ProfileController extends BaseController {
  final AuthManager _authManager = AuthManager.instance;
  final MovieService _movieService = MovieService.instance;

  UserModel get user => _authManager.user;

  RxList<MovieModel> favoriteMovies = <MovieModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadFavoriteMovies();
  }

  Future<void> loadFavoriteMovies() async {
    try {
      setLoading(true);

      final result = await _movieService.getFavoriteMovies();
      favoriteMovies.clear();
      favoriteMovies.addAll(result.data);
    } catch (e) {
      debugPrint('loadFavoriteMovies error: $e');
    } finally {
      setLoading(false);
    }
  }
}
