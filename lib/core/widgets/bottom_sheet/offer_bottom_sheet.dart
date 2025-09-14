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
  const OfferBottomSheet({
    super.key,
    required this.onClose,
    required this.offerPackages,
  });
  final VoidCallback onClose;

  @override
  Widget build(BuildContext context) {
    return GradientContainer(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(32),
        topRight: Radius.circular(32),
      ),
      child: Stack(children: [buildOfferContent(), buildCloseButton()]),
    );
  }

  Widget buildOfferContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildHeader(),
          const SizedBox(height: 24),
          buildBonusList(),
          const SizedBox(height: 24),
          buildOfferPackageList(),
          const SizedBox(height: 24),
          buildShowAllButton(),
        ],
      ),
    );
  }

  Widget buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28),
      child: Column(
        children: [
          Text(
            'Sınırlı Teklif',
            style: Get.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Jeton paketin’ni seçerek bonus kazanın ve yeni bölümlerin kilidini açın!',
            style: Get.textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget buildBonusList() {
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
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Alacağınız Bonuslar',
            style: Get.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 14),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildBonusItem(
                title: 'Premium\nHesap',
                image: AppImages.bonusPremium,
              ),
              buildBonusItem(
                title: 'Daha Fazla\nEşleşme',
                image: AppImages.bonusMatch,
              ),
              buildBonusItem(
                title: 'Öne\nÇıkarma',
                image: AppImages.bonusHighlight,
              ),
              buildBonusItem(
                title: 'Daha Fazla\nBeğeni',
                image: AppImages.bonusLikes,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildOfferPackageList() {
    return Column(
      children: [
        Text(
          'Kilidi açmak için bir jeton paketi seçin',
          style: Get.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),

        const SizedBox(height: 32),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          spacing: 12,
          children: [...offerPackages.map((e) => buildOfferPackageItem(e))],
        ), // TODO: Add offer package item
      ],
    );
  }

  Widget buildOfferPackageItem(OfferPackageModel offerPackage) {
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
        // format
        child: Column(
          children: [
            Transform.translate(
              offset: const Offset(0, -24),
              child: Container(
                decoration: BoxDecoration(
                  color:
                      offerPackage.isPopular
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
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 4,
                ),
                child: Text(
                  "+${offerPackage.percentage.toInt()}%",
                  style: Get.textTheme.labelLarge,
                ),
              ),
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
              "Jeton",
              style: Get.textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),

            const SizedBox(height: 14),

            Divider(),

            const SizedBox(height: 10),

            Text(
              "₺${offerPackage.weeklyPrice}",
              style: Get.textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),

            const SizedBox(height: 2),

            Text(
              "Başına haftalık",
              style: Get.textTheme.labelMedium?.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBonusItem({required String title, required AppImages image}) {
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

  Widget buildCloseButton() {
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

  Widget buildShowAllButton() {
    return SizedBox(
      width: double.infinity,
      child: CustomPrimaryButton(onPressed: () {}, title: "Tüm Jetonları Gör"),
    );
  }
}
