import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jr_case_boilerplate/core/constants/app_colors.dart';
import 'package:jr_case_boilerplate/core/models/movie/movie_model.dart';
import 'package:jr_case_boilerplate/core/widgets/cached_network_image/custom_cached_network_image.dart';

class ProfileMovieCard extends StatelessWidget {
  final MovieModel movie;
  final VoidCallback? onTap;

  const ProfileMovieCard({super.key, required this.movie, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: Get.width,
        height: Get.height,
        decoration: const BoxDecoration(color: Colors.black),
        child: Stack(
          children: [
            // Background Image
            _buildBackgroundImage(),
            // Movie Title
            _buildContent(),

            _buildBottomGradient(),
          ],
        ),
      ),
    );
  }

  Widget _buildBackgroundImage() {
    if (movie.poster.isEmpty) {
      return Container(
        color: Colors.grey[900],
        child: const Center(
          child: Icon(Icons.movie, size: 100, color: Colors.grey),
        ),
      );
    }

    return CustomCachedNetworkImage(
      imageUrl: movie.poster,
      width: Get.width,
      height: Get.height,
      fit: BoxFit.cover,
      errorWidget: Container(
        color: Colors.grey[900],
        child: const Center(
          child: Icon(Icons.movie, size: 100, color: Colors.grey),
        ),
      ),
    );
  }

  Widget _buildContent() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(),
            Text(movie.title, style: Get.textTheme.titleLarge),
            // Movie Title
          ],
        ),
      ),
    );
  }

  Widget _buildBottomGradient() {
    return Container(
      height: 100,
      decoration: BoxDecoration(gradient: AppColors.darkBackgroundGradient),
    );
  }
}
