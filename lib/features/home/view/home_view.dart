import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jr_case_boilerplate/core/base/base_view.dart';
import 'package:jr_case_boilerplate/core/controllers/dashboard/home_controller.dart';
import 'package:jr_case_boilerplate/core/models/movie/movie_model.dart';
import 'package:jr_case_boilerplate/core/widgets/cached_network_image/custom_cached_network_image.dart';
import 'package:jr_case_boilerplate/features/profile/widgets/profile_movie_card.dart';

class HomeView extends BaseView<HomeController> {
  const HomeView({super.key});

  @override
  HomeController get controllerType => HomeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (controller.isLoading.value && controller.movies.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(color: Colors.white),
          );
        }

        if (controller.movies.isEmpty) {
          return const Center(
            child: Text(
              'Film bulunamadı',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          );
        }

        return PageView.builder(
          itemCount:
              controller.movies.length + (controller.hasMoreData.value ? 1 : 0),
          scrollDirection: Axis.vertical,
          onPageChanged: (index) {
            // Son filmdeyken yeni sayfa yükle
            if (index == controller.movies.length - 1) {
              controller.onScrollEnd();
            }
          },
          itemBuilder: (context, index) {
            // Loading indicator for last item
            if (index == controller.movies.length) {
              return const Center(
                child: CircularProgressIndicator(color: Colors.white),
              );
            }

            final movie = controller.movies[index];
            return ProfileMovieCard(
              movie: movie,
              onTap: () {
                debugPrint('Movie tapped: ${movie.title}');
              },
            );
          },
        );
      }),
    );
  }
}
