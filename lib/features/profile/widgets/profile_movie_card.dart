import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:jr_case_boilerplate/core/enums/assets/app_icons.dart';
import 'package:jr_case_boilerplate/core/enums/assets/app_images.dart';
import 'package:jr_case_boilerplate/core/models/movie/movie_model.dart';
import 'package:jr_case_boilerplate/core/widgets/cached_network_image/custom_cached_network_image.dart';

class ProfileMovieCard extends StatefulWidget {
  final MovieModel movie;
  final VoidCallback onFavoritePressed;
  const ProfileMovieCard({
    super.key,
    required this.movie,
    required this.onFavoritePressed,
  });

  @override
  State<ProfileMovieCard> createState() => _ProfileMovieCardState();
}

class _ProfileMovieCardState extends State<ProfileMovieCard> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height,
      decoration: const BoxDecoration(color: Colors.black),
      child: Stack(
        children: [
          // Background Image
          _buildBackgroundImage(),
          // Bottom Gradient
          _buildBottomGradient(),
          // Movie Title
          _buildContent(),
          // Favorite Button
          buildFavoriteButton(),
        ],
      ),
    );
  }

  Widget _buildBackgroundImage() {
    if (widget.movie.poster.isEmpty) {
      return Container(
        color: Colors.grey[900],
        child: const Center(
          child: Icon(Icons.movie, size: 100, color: Colors.grey),
        ),
      );
    }

    return CustomCachedNetworkImage(
      imageUrl: widget.movie.poster,
      width: Get.width,
      height: Get.height,
      fit: BoxFit.cover,
    );
  }

  Widget _buildBottomGradient() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        height: 150,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              Get.theme.colorScheme.surface.withValues(alpha: 0.1),
              Get.theme.colorScheme.surface.withValues(alpha: 0.3),
              Get.theme.colorScheme.surface.withValues(alpha: 0.6),
              Get.theme.colorScheme.surface,
            ],
            stops: const [0.0, 0.3, 0.6, 0.8, 1.0],
          ),
        ),
      ),
    );
  }

  Widget _buildContent() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32),
        child: Column(
          children: [
            const Spacer(),
            Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Get.theme.colorScheme.primary,
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child: Image.asset(
                    AppImages.appIcon.path,
                    width: 20,
                    height: 20,
                  ),
                ),

                const SizedBox(width: 16),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.movie.title,
                        style: Get.textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 8),
                      _buildPlotText(),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlotText() {
    if (widget.movie.plot.isEmpty) return const SizedBox.shrink();

    final plotText = widget.movie.plot;

    if (isExpanded) {
      return GestureDetector(
        onTap: () {
          setState(() {
            isExpanded = false;
          });
        },
        child: Text(
          plotText,
          style: Get.textTheme.bodyMedium?.copyWith(
            color: Get.theme.colorScheme.onSurface.withValues(alpha: 0.8),
          ),
        ),
      );
    }

    return GestureDetector(
      onTap: () {
        setState(() {
          isExpanded = true;
        });
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            plotText,
            style: Get.textTheme.bodyMedium?.copyWith(
              color: Get.theme.colorScheme.onSurface.withValues(alpha: 0.8),
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          Text(
            'Devamını oku',
            style: Get.textTheme.bodyMedium?.copyWith(
              color: Get.theme.colorScheme.onSecondary,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildFavoriteButton() {
    bool isFavorite = widget.movie.isFavorite;

    return Positioned(
      bottom: 150,
      right: 24,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
          child: SizedBox(
            width: 52,
            height: 72,
            child: FilledButton(
              onPressed: widget.onFavoritePressed,
              style: FilledButton.styleFrom(
                padding: EdgeInsets.zero,
                backgroundColor: Get.theme.colorScheme.surface.withValues(
                  alpha: 0.05,
                ),
                side: BorderSide(
                  color: Get.theme.colorScheme.onSurface.withValues(alpha: 0.2),
                ),
              ),
              child: SvgPicture.asset(
                isFavorite ? AppIcons.heartFill.path : AppIcons.heart.path,
                width: 24,
                height: 24,
                colorFilter: ColorFilter.mode(
                  isFavorite
                      ? Get.theme.colorScheme.primary
                      : Get.theme.colorScheme.onSurface,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
