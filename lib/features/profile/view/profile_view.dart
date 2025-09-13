import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jr_case_boilerplate/core/base/base_view.dart';
import 'package:jr_case_boilerplate/core/controllers/dashboard/profile_controller.dart';
import 'package:jr_case_boilerplate/core/widgets/container/gradient_container.dart';
import 'package:jr_case_boilerplate/features/profile/widgets/profile_header.dart';
import 'package:jr_case_boilerplate/features/profile/widgets/profile_movie_card.dart';

class ProfileView extends BaseView<ProfileController> {
  const ProfileView({super.key});

  @override
  ProfileController get controllerType => ProfileController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientContainer(
        showRadialGradient: false,
        child: SafeArea(
          child: Column(
            children: [
              buildProfileHeader(),
              const SizedBox(height: 16),
              buildFavoriteMoviesList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildProfileHeader() {
    return ProfileHeader(user: controller.user, onAddPhotoPressed: () {});
  }

  Widget buildFavoriteMoviesList() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Favorite Movies Title
            Text(
              'Beğendiklerim'.tr,
              style: Get.textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 4),

            // Favorite Movies List
            Obx(() {
              if (controller.isLoading.value) {
                return buildLoader();
              }

              return Expanded(
                child: GridView.builder(
                  padding: EdgeInsets.only(bottom: 24, top: 20),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 0.6,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    crossAxisCount: 2,
                  ),
                  itemCount: controller.favoriteMovies.length,
                  itemBuilder: (context, index) {
                    return ProfileMovieCard(
                      movie: controller.favoriteMovies[index],
                    );
                  },
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget buildLoader() {
    return Expanded(
      child: Center(
        child: CircularProgressIndicator(color: Get.theme.colorScheme.primary),
      ),
    );
  }
}
