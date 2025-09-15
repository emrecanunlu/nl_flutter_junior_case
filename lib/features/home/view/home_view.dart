import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jr_case_boilerplate/core/base/base_view.dart';
import 'package:jr_case_boilerplate/core/controllers/dashboard/home_controller.dart';
import 'package:jr_case_boilerplate/features/home/widgets/home_movie_list_item.dart';

class HomeView extends BaseView<HomeController> {
  const HomeView({super.key});

  @override
  HomeController get controllerType => HomeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (controller.movies.isEmpty) {
          return buildLoader();
        }

        return PageView.builder(
          itemCount: controller.movies.length,
          scrollDirection: Axis.vertical,
          onPageChanged: (index) {
            if (index == controller.movies.length - 1) {
              controller.onScrollEnd();
            }
          },
          itemBuilder: (context, index) {
            final movie = controller.movies[index];
            return HomeMovieListItem(
              movie: movie,
              onFavoritePressed: () {
                controller.onFavoritePressed(movie);
              },
            );
          },
        );
      }),
    );
  }

  Widget buildLoader() {
    return Center(
      child: CircularProgressIndicator(color: Get.theme.colorScheme.primary),
    );
  }
}
