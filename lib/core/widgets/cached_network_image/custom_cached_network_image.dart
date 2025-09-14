import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit fit;
  final Widget? placeholder;
  final Widget? errorWidget;
  final BorderRadius? borderRadius;

  const CustomCachedNetworkImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.placeholder,
    this.errorWidget,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    Widget imageWidget = CachedNetworkImage(
      imageUrl: imageUrl,
      width: width,
      height: height,
      fit: fit,
      placeholder: (context, url) => placeholder ?? _buildDefaultPlaceholder(),
      errorWidget:
          (context, url, error) => errorWidget ?? _buildDefaultErrorWidget(),
      fadeInDuration: const Duration(milliseconds: 300),
      fadeOutDuration: const Duration(milliseconds: 300),
    );

    if (borderRadius != null) {
      imageWidget = ClipRRect(borderRadius: borderRadius!, child: imageWidget);
    }

    return imageWidget;
  }

  Widget _buildDefaultPlaceholder() {
    return Container(
      width: width ?? 32,
      height: height ?? 32,
      decoration: BoxDecoration(
        color: Get.theme.colorScheme.surfaceContainerHighest,
        borderRadius: borderRadius ?? BorderRadius.circular(8),
      ),
    );
  }

  Widget _buildDefaultErrorWidget() {
    return Container(
      width: width,
      height: height,
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
}
