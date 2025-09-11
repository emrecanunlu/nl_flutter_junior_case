import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';

class GradientContainer extends StatelessWidget {
  final Widget child;

  const GradientContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Container(
        decoration: const BoxDecoration(
          gradient: AppColors.darkBackgroundGradient,
        ),
        child: Stack(
          children: [
            // Child content
            child,
            // Radial gradient overlay - en üstte
            Positioned(
              top: -71,
              left: 0,
              right: 0,
              child: Container(
                height: 200, // Yeterli yükseklik
                decoration: const BoxDecoration(
                  gradient: AppColors.darkRadialGradient,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
