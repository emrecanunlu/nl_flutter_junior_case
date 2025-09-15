import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:jr_case_boilerplate/core/enums/assets/app_icons.dart';
import 'package:jr_case_boilerplate/core/models/user/response/user_model.dart';
import 'package:jr_case_boilerplate/core/widgets/cached_network_image/custom_cached_network_image.dart';
import 'package:jr_case_boilerplate/core/constants/app_spacing.dart';

class ProfileHeader extends StatelessWidget {
  final UserModel user;
  final VoidCallback onAddPhotoPressed;
  final VoidCallback onOfferPressed;
  const ProfileHeader({
    super.key,
    required this.user,
    required this.onAddPhotoPressed,
    required this.onOfferPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Get.theme.colorScheme.onSurface.withValues(alpha: 0.05),
          ),
        ),
      ),
      child: Column(children: [buildHeader(), buildProfileInfo()]),
    );
  }

  Widget buildHeader() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("common.profile".tr, style: Get.textTheme.titleMedium),
          buildOfferButton(),
        ],
      ),
    );
  }

  Widget buildProfileInfo() {
    return Padding(
      padding: AppSpacing.profileHeaderPadding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildProfileDetails(),
          AppSpacing.horizontalLg,
          TextButton(
            onPressed: onAddPhotoPressed,
            style: TextButton.styleFrom(
              backgroundColor: Get.theme.colorScheme.onSurface.withValues(
                alpha: 0.05,
              ),
              padding: AppSpacing.profileButtonPadding,
              shape: RoundedRectangleBorder(
                borderRadius: AppSpacing.borderRadiusSmallAll,
              ),
            ),
            child: Text(
              "common.addPhoto".tr,
              style: Get.textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildProfileDetails() {
    return Expanded(
      child: Row(
        children: [
          CustomCachedNetworkImage(
            imageUrl: user.photoUrl,
            width: AppSpacing.avatarSize,
            height: AppSpacing.avatarSize,
            fit: BoxFit.cover,
            borderRadius: AppSpacing.borderRadiusCircular,
            errorWidget: Icon(Icons.person),
          ),
          AppSpacing.horizontalSm,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user.name,
                  style: Get.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                AppSpacing.verticalXs,
                Text(
                  "ID: 2456834",
                  style: Get.textTheme.bodySmall?.copyWith(
                    color: Get.theme.colorScheme.onSurface.withValues(
                      alpha: 0.5,
                    ),
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildOfferButton() {
    return GestureDetector(
      onTap: onOfferPressed,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(53),
          gradient: LinearGradient(
            colors: [Color(0xFFE50914), Color(0xFFB2040C)],
          ),
        ),
        child: Row(
          children: [
            SvgPicture.asset(AppIcons.gem.path, width: 20, height: 20),
            const SizedBox(width: 6),
            Text(
              "common.limitedOffer".tr,
              style: Get.textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
