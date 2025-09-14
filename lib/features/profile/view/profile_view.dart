import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jr_case_boilerplate/core/base/base_view.dart';
import 'package:jr_case_boilerplate/core/controllers/dashboard/profile_controller.dart';
import 'package:jr_case_boilerplate/core/widgets/container/gradient_container.dart';
import 'package:jr_case_boilerplate/features/profile/widgets/profile_header.dart';
import 'package:jr_case_boilerplate/features/profile/widgets/profile_movie_card.dart';
import 'package:jr_case_boilerplate/core/constants/app_spacing.dart';

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
              // Profile Header
              buildProfileHeader(context),
              // Spacer
              AppSpacing.verticalLg,
              // Favorite Movies List
              buildFavoriteMoviesList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildProfileHeader(BuildContext context) {
    return ProfileHeader(
      user: controller.user,
      onAddPhotoPressed: controller.onAddPhotoPressed,
      onOfferPressed: () => controller.showOfferBottomSheet(context),
    );
  }

  Widget buildFavoriteMoviesList() {
    return Expanded(
      child: Padding(
        padding: AppSpacing.screenPadding,
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

            AppSpacing.verticalXs,

            // Favorite Movies List
            Obx(() {
              if (controller.favoriteMovies.isEmpty &&
                  !controller.isLoading.value) {
                return buildEmptyState();
              }

              if (controller.isLoading.value) {
                return buildLoader();
              }

              return Expanded(
                child: GridView.builder(
                  padding: AppSpacing.homeGridPadding,
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 0.6,
                    mainAxisSpacing: AppSpacing.gridMainAxisSpacing,
                    crossAxisSpacing: AppSpacing.gridCrossAxisSpacing,
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

  Widget buildEmptyState() {
    return Expanded(child: Center(child: Text('common.noFavoriteMovies'.tr)));
  }
}
