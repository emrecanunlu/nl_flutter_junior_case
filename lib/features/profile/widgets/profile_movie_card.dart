import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:jr_case_boilerplate/core/constants/app_spacing.dart';
import 'package:jr_case_boilerplate/core/models/movie/movie_model.dart';
import 'package:jr_case_boilerplate/core/widgets/cached_network_image/custom_cached_network_image.dart';

class ProfileMovieCard extends StatelessWidget {
  final MovieModel movie;
  const ProfileMovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildMoviePoster(),
        AppSpacing.verticalSm,
        buildMovieTitle(),
        AppSpacing.verticalXs,
        buildMovieDirector(),
      ],
    );
  }

  Text buildMovieTitle() {
    return Text(
      movie.title,
      style: Get.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w600),
    );
  }

  Text buildMovieDirector() {
    return Text(
      movie.director,
      style: Get.textTheme.bodySmall?.copyWith(
        color: Get.theme.colorScheme.onSurface.withValues(alpha: 0.5),
      ),
    );
  }

  Widget buildMoviePoster() {
    return Expanded(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: CustomCachedNetworkImage(
          imageUrl: movie.poster,
          width: double.maxFinite,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
