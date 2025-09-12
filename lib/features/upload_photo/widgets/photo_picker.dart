import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:jr_case_boilerplate/core/enums/assets/app_icons.dart';

class PhotoPicker extends StatelessWidget {
  final double size;
  const PhotoPicker({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(32),
        splashColor: Get.theme.colorScheme.onSurface.withValues(alpha: 0.05),
        highlightColor: Get.theme.colorScheme.onSurface.withValues(alpha: 0.05),
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: Get.theme.colorScheme.onSurface.withValues(alpha: 0.05),
            borderRadius: BorderRadius.circular(32),
          ),
          child: CustomPaint(
            painter: DashedBorderPainter(
              color: Get.theme.colorScheme.onSurface.withValues(alpha: 0.2),
              strokeWidth: 2,
              dashLength: 4,
              dashSpace: 5,
              borderRadius: 32,
            ),
            child: Container(
              alignment: Alignment.center,
              child: SvgPicture.asset(
                AppIcons.plus.path,
                width: 32,
                height: 32,
                colorFilter: ColorFilter.mode(
                  Get.theme.colorScheme.onSurface,
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

class DashedBorderPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double dashLength;
  final double dashSpace;
  final double borderRadius;

  DashedBorderPainter({
    required this.color,
    required this.strokeWidth,
    required this.dashLength,
    required this.dashSpace,
    required this.borderRadius,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = color
          ..strokeWidth = strokeWidth
          ..style = PaintingStyle.stroke;

    final path =
        Path()..addRRect(
          RRect.fromRectAndRadius(
            Rect.fromLTWH(0, 0, size.width, size.height),
            Radius.circular(borderRadius),
          ),
        );

    final pathMetrics = path.computeMetrics();

    for (final pathMetric in pathMetrics) {
      double distance = 0.0;
      while (distance < pathMetric.length) {
        final extractPath = pathMetric.extractPath(
          distance,
          distance + dashLength,
        );
        canvas.drawPath(extractPath, paint);
        distance += dashLength + dashSpace;
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
