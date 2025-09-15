import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:jr_case_boilerplate/core/enums/assets/app_icons.dart';
import 'package:jr_case_boilerplate/core/widgets/cached_network_image/custom_cached_network_image.dart';

class PhotoPicker extends StatelessWidget {
  final double size;
  final VoidCallback onSelectImageTap;
  final String? path;
  final VoidCallback? onClearImage;
  final bool isPicking;

  const PhotoPicker({
    super.key,
    required this.size,
    required this.onSelectImageTap,
    this.path,
    this.onClearImage,
    this.isPicking = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap:
                (path != null && path!.isNotEmpty || isPicking)
                    ? null
                    : onSelectImageTap,
            borderRadius: BorderRadius.circular(32),
            splashColor: Get.theme.colorScheme.onSurface.withValues(
              alpha: 0.05,
            ),
            highlightColor: Get.theme.colorScheme.onSurface.withValues(
              alpha: 0.05,
            ),
            child: Container(
              width: size,
              height: size,
              decoration: BoxDecoration(
                color: Get.theme.colorScheme.onSurface.withValues(alpha: 0.05),
                borderRadius: BorderRadius.circular(32),
              ),
              child: buildPickerArea(),
            ),
          ),
        ),
        if (path != null && path!.isNotEmpty && onClearImage != null) ...[
          const SizedBox(height: 12),
          buildClearButton(),
        ],
      ],
    );
  }

  Widget buildPickerArea() {
    if (path != null && path!.isNotEmpty) {
      return buildImageArea();
    } else {
      return buildPlusIconArea();
    }
  }

  Widget buildImageArea() {
    return _buildImage();
  }

  Widget _buildImage() {
    if (path!.startsWith('https://')) {
      // Network image - CustomCachedNetworkImage kullan
      return CustomCachedNetworkImage(
        imageUrl: path!,
        width: size,
        height: size,
        fit: BoxFit.cover,
        borderRadius: BorderRadius.circular(32),
      );
    } else {
      // Local image
      return ClipRRect(
        borderRadius: BorderRadius.circular(32),
        child: Image.asset(
          path!,
          width: size,
          height: size,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return buildErrorWidget();
          },
        ),
      );
    }
  }

  Widget buildErrorWidget() {
    return Container(
      width: size,
      height: size,
      color: Get.theme.colorScheme.onSurface.withValues(alpha: 0.05),
      child: Center(
        child: Icon(
          Icons.error_outline,
          color: Get.theme.colorScheme.onSurface.withValues(alpha: 0.5),
          size: 32,
        ),
      ),
    );
  }

  Widget buildPlusIconArea() {
    return CustomPaint(
      painter: DashedBorderPainter(
        color: Get.theme.colorScheme.onSurface.withValues(alpha: 0.2),
        strokeWidth: 2,
        dashLength: 4,
        dashSpace: 5,
        borderRadius: 32,
      ),
      child: Container(
        alignment: Alignment.center,
        child:
            isPicking
                ? CircularProgressIndicator(
                  strokeWidth: 3,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Get.theme.colorScheme.onSurface,
                  ),
                )
                : SvgPicture.asset(
                  AppIcons.plus.path,
                  width: 32,
                  height: 32,
                  colorFilter: ColorFilter.mode(
                    Get.theme.colorScheme.onSurface,
                    BlendMode.srcIn,
                  ),
                ),
      ),
    );
  }

  Widget buildClearButton() {
    return IconButton(
      onPressed: onClearImage,
      icon: SvgPicture.asset(
        AppIcons.x.path,
        width: 24,
        height: 24,
        colorFilter: ColorFilter.mode(
          Get.theme.colorScheme.onSurface,
          BlendMode.srcIn,
        ),
      ),
      style: IconButton.styleFrom(
        backgroundColor: Colors.transparent,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        shape: CircleBorder(
          side: BorderSide(
            color: Get.theme.colorScheme.onSurface.withValues(alpha: 0.5),
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
