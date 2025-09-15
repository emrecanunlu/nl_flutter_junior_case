import 'dart:ui';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_shadow/flutter_inset_shadow.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jr_case_boilerplate/core/constants/app_colors.dart';
import 'package:jr_case_boilerplate/core/enums/assets/app_icons.dart';
import 'package:jr_case_boilerplate/core/enums/assets/app_images.dart';
import 'package:jr_case_boilerplate/core/models/offer_package_model.dart';
import 'package:jr_case_boilerplate/core/widgets/buttons/custom_primary_button.dart';
import 'package:jr_case_boilerplate/core/widgets/container/gradient_container.dart';

class OfferBottomSheet extends StatelessWidget {
  final List<OfferPackageModel> offerPackages;
  final VoidCallback onClose;

  const OfferBottomSheet({
    super.key,
    required this.onClose,
    required this.offerPackages,
  });

  @override
  Widget build(BuildContext context) {
    return GradientContainer(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(32),
        topRight: Radius.circular(32),
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const _OfferHeader(),
                const SizedBox(height: 24),
                const _BonusList(),
                const SizedBox(height: 24),
                _OfferPackageList(offerPackages: offerPackages),
                const SizedBox(height: 24),
                const _ShowAllButton(),
              ],
            ),
          ),
          _CloseButton(onClose: onClose),
        ],
      ),
    );
  }
}

/// HEADER
class _OfferHeader extends StatelessWidget {
  const _OfferHeader();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28),
      child: Column(
        children: [
          Text(
            'common.limitedOffer'.tr,
            style: Get.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'common.offerSubtitle'.tr,
            style: Get.textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

/// BONUS LIST
class _BonusList extends StatelessWidget {
  const _BonusList();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: RadialGradient(
          center: const Alignment(0.0912, 0),
          radius: 1.66,
          colors: [
            Get.theme.colorScheme.onSurface.withValues(alpha: 0.1),
            Get.theme.colorScheme.onSurface.withValues(alpha: 0.03),
          ],
        ),
        border: Border.all(
          color: Get.theme.colorScheme.onSurface.withValues(alpha: 0.2),
        ),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          Text(
            'common.bonusListTitle'.tr,
            style: Get.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 14),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _BonusItem(
                title: 'common.bonusPremium'.tr,
                image: AppImages.bonusPremium,
              ),
              _BonusItem(
                title: 'common.bonusMatch'.tr,
                image: AppImages.bonusMatch,
              ),
              _BonusItem(
                title: 'common.bonusHighlight'.tr,
                image: AppImages.bonusHighlight,
              ),
              _BonusItem(
                title: 'common.bonusLikes'.tr,
                image: AppImages.bonusLikes,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _BonusItem extends StatelessWidget {
  final String title;
  final AppImages image;

  const _BonusItem({required this.title, required this.image});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Container(
            width: 56,
            height: 56,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Get.theme.colorScheme.primaryContainer,
              boxShadow: [
                BoxShadow(
                  color: Get.theme.colorScheme.onSurface,
                  blurRadius: 8.33,
                  spreadRadius: 0,
                  inset: true,
                ),
              ],
            ),
            child: Image.asset(
              image.path,
              width: 32,
              height: 32,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: Get.textTheme.labelLarge,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

/// OFFER PACKAGE LIST
class _OfferPackageList extends StatelessWidget {
  final List<OfferPackageModel> offerPackages;
  const _OfferPackageList({required this.offerPackages});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'common.offerPackageListTitle'.tr,
          style: Get.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 32),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          spacing: 12,
          children:
              offerPackages
                  .map((e) => _OfferPackageItem(offerPackage: e))
                  .toList(),
        ),
      ],
    );
  }
}

class _OfferPackageItem extends StatelessWidget {
  final OfferPackageModel offerPackage;
  const _OfferPackageItem({required this.offerPackage});

  @override
  Widget build(BuildContext context) {
    final formatter = NumberFormat("#,###", "tr_TR");

    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14.5, vertical: 12),
        decoration: BoxDecoration(
          gradient:
              offerPackage.isPopular
                  ? AppColors.popularCardGradient
                  : AppColors.normalCardGradient,
          border: Border.all(
            color: Get.theme.colorScheme.onSurface.withValues(alpha: 0.4),
          ),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Get.theme.colorScheme.onSurface.withValues(alpha: 0.3),
              blurRadius: 15,
              spreadRadius: 0,
              inset: true,
            ),
          ],
        ),
        child: Column(
          children: [
            _OfferBadge(
              percentage: offerPackage.percentage,
              isPopular: offerPackage.isPopular,
            ),
            Text(
              formatter.format(offerPackage.oldAmount),
              style: Get.textTheme.bodyMedium?.copyWith(
                decoration: TextDecoration.lineThrough,
                color: Get.theme.colorScheme.onSurface.withValues(alpha: 0.9),
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              formatter.format(offerPackage.newAmount),
              style: Get.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              "common.jeton".tr,
              style: Get.textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 14),
            const Divider(),
            const SizedBox(height: 10),
            Text(
              "₺${offerPackage.weeklyPrice}".tr,
              style: Get.textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              "common.weeklyPrice".tr,
              style: Get.textTheme.labelMedium?.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OfferBadge extends StatelessWidget {
  final double percentage;
  final bool isPopular;

  const _OfferBadge({required this.percentage, required this.isPopular});

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(0, -24),
      child: Container(
        decoration: BoxDecoration(
          color:
              isPopular
                  ? Get.theme.colorScheme.secondaryContainer
                  : Get.theme.colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Get.theme.colorScheme.onSurface,
              blurRadius: 8.33,
              spreadRadius: 0,
              inset: true,
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        child: Text("+${percentage.toInt()}%", style: Get.textTheme.labelLarge),
      ),
    );
  }
}

/// CLOSE BUTTON
class _CloseButton extends StatelessWidget {
  final VoidCallback onClose;
  const _CloseButton({required this.onClose});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 16,
      right: 16,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: SizedBox(
          width: 36,
          height: 36,
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
            child: IconButton(
              onPressed: onClose,
              icon: SvgPicture.asset(
                AppIcons.x.path,
                width: 24,
                height: 24,
                colorFilter: ColorFilter.mode(
                  Get.theme.colorScheme.onSurface,
                  BlendMode.srcIn,
                ),
              ),
              padding: EdgeInsets.zero,
              style: IconButton.styleFrom(
                backgroundColor: Get.theme.colorScheme.surface.withValues(
                  alpha: 0.1,
                ),
                side: BorderSide(
                  color: Get.theme.colorScheme.onSurface.withValues(alpha: 0.2),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// SHOW ALL BUTTON
class _ShowAllButton extends StatelessWidget {
  const _ShowAllButton();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: CustomPrimaryButton(
        onPressed: () {},
        title: "common.viewAllJetons".tr,
      ),
    );
  }
}
