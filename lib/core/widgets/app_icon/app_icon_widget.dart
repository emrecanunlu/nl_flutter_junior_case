import 'package:flutter/material.dart';
import 'package:jr_case_boilerplate/core/constants/app_colors.dart';
import 'package:jr_case_boilerplate/core/enums/assets/app_images.dart';

class AppIcon extends StatelessWidget {
  const AppIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 78,
      height: 78,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(21.9),
        gradient: AppColors.appIconGradient,
        boxShadow: [AppColors.appIconShadow],
      ),
      child: CustomPaint(
        painter: GradientBorderPainter(borderRadius: 21.9, borderWidth: 1),
        child: Container(
          alignment: Alignment.center,
          child: Image.asset(
            AppImages.appIcon.path,
            width: 36,
            height: 36,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class GradientBorderPainter extends CustomPainter {
  final double borderRadius;
  final double borderWidth;

  GradientBorderPainter({
    required this.borderRadius,
    required this.borderWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..shader = const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xCCFFFFFF), // rgba(255, 255, 255, 0.8)
              Color(0x99FF5D5D), // rgba(255, 93, 93, 0.6)
            ],
            stops: [0.0, 1.0],
          ).createShader(Rect.fromLTWH(0, 0, size.width, size.height))
          ..style = PaintingStyle.stroke
          ..strokeWidth = borderWidth;

    final path =
        Path()..addRRect(
          RRect.fromRectAndRadius(
            Rect.fromLTWH(0, 0, size.width, size.height),
            Radius.circular(borderRadius),
          ),
        );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
