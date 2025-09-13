import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';

class GradientContainer extends StatelessWidget {
  final Widget child;
  final bool showRadialGradient;

  const GradientContainer({
    super.key,
    required this.child,
    this.showRadialGradient = true,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Container(
        decoration: const BoxDecoration(
          gradient: AppColors.darkBackgroundGradient,
        ),
        child: Stack(
          children: [
            // Radial gradient overlay - arka planda
            Positioned(
              top: -71,
              left: 0,
              right: 0,
              child: Container(
                height: 200, // Yeterli yükseklik
                decoration: BoxDecoration(
                  gradient:
                      showRadialGradient
                          ? AppColors.backgroundLinearGradient
                          : null,
                ),
              ),
            ),
            // Child content - en üstte
            child,
          ],
        ),
      ),
    );
  }
}
