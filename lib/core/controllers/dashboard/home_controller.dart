import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:jr_case_boilerplate/core/base/base_controller.dart';
import 'package:jr_case_boilerplate/core/models/movie/movie_model.dart';
import 'package:jr_case_boilerplate/core/services/movie_service.dart';

class HomeController extends BaseController {
  final MovieService _movieService = MovieService.instance;

  RxList<MovieModel> movies = <MovieModel>[].obs;
  RxInt currentPage = 1.obs;
  RxBool hasMoreData = true.obs;

  @override
  void onInit() {
    loadMovies();
    super.onInit();
  }

  Future<void> loadMovies() async {
    if (isLoading.value) return;

    try {
      isLoading.value = true;
      final result = await _movieService.getMovies(page: currentPage.value);

      if (result.response.code == 200) {
        movies.addAll(result.data);
        hasMoreData.value = currentPage.value < result.pagination.maxPage;
        currentPage.value++;

        // Sonraki sayfayı önceden yükle
        if (hasMoreData.value) {
          final nextResult = await _movieService.getMovies(
            page: currentPage.value,
          );
          if (nextResult.response.code == 200) {
            movies.addAll(nextResult.data);
            hasMoreData.value =
                currentPage.value < nextResult.pagination.maxPage;
            currentPage.value++;
          }
        }
      }
    } catch (e) {
      debugPrint('loadMovies error: $e');
    } finally {
      isLoading.value = false;
    }
  }

  void onScrollEnd() {
    if (hasMoreData.value && !isLoading.value) {
      loadMovies();
    }
  }

  void onFavoritePressed(MovieModel movie) {
    debugPrint('Favorite pressed: ${movie.title}');
  }
}
