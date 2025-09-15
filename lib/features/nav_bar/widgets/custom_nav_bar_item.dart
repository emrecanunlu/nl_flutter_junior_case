import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:jr_case_boilerplate/core/enums/assets/app_icons.dart';

class CustomNavBarItem extends StatelessWidget {
  const CustomNavBarItem({
    super.key,
    required this.index,
    required this.icon,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });
  final int index;
  final AppIcons icon;
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(48),
        child: Container(
          width: double.maxFinite,
          height: 48,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(48),
            gradient: isSelected ? _buildGradient() : null,
            border: Border.all(
              color:
                  isSelected
                      ? Colors.white.withValues(alpha: 0.3)
                      : Get.theme.colorScheme.onSurface.withValues(alpha: 0.2),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                icon.path,
                colorFilter: ColorFilter.mode(
                  isSelected ? Colors.white : Get.theme.colorScheme.onSurface,
                  BlendMode.srcIn,
                ),
              ),
              SizedBox(width: 10),
              Text(
                title,
                style: Get.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                  color:
                      isSelected
                          ? Colors.white
                          : Get.theme.colorScheme.onSurface,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Gradient _buildGradient() {
    // Radial gradient - CSS'deki gibi
    return RadialGradient(
      center: const Alignment(0.0, -0.5), // 50% 16.67% - daha yukarı
      radius: 0.8, // 58.74% 83.33% - daha küçük radius
      colors: [
        const Color(0xFFE50914), // #E50914
        const Color(0xFF7F050B), // #7F050B
      ],
      stops: const [0.0, 1.0],
    );
  }
}
