import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';

class GradientContainer extends StatelessWidget {
  final Widget child;
  final bool showRadialGradient;
  final EdgeInsetsGeometry? padding;
  final BorderRadiusGeometry? borderRadius;
  final double? height;
  final double? width;
  final AlignmentGeometry? alignment;

  const GradientContainer({
    super.key,
    required this.child,
    this.showRadialGradient = true,
    this.padding,
    this.borderRadius,
    this.height,
    this.width,
    this.alignment,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      alignment: alignment,
      padding: padding,
      decoration: BoxDecoration(
        borderRadius: borderRadius,
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
                    showRadialGradient ? AppColors.darkRadialGradient : null,
              ),
            ),
          ),
          // Child content - en üstte
          child,
        ],
      ),
    );
  }
}
