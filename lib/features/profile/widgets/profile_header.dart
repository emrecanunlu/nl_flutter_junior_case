import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:jr_case_boilerplate/core/enums/assets/app_icons.dart';
import 'package:jr_case_boilerplate/core/models/user/response/user_model.dart';
import 'package:jr_case_boilerplate/core/widgets/cached_network_image/custom_cached_network_image.dart';

class ProfileHeader extends StatelessWidget {
  final UserModel user;
  final VoidCallback onAddPhotoPressed;
  const ProfileHeader({
    super.key,
    required this.user,
    required this.onAddPhotoPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [buildHeader(), buildProfileInfo()]);
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
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildProfileDetails(),
          const SizedBox(width: 16),
          TextButton(
            onPressed: onAddPhotoPressed,
            style: TextButton.styleFrom(
              backgroundColor: Get.theme.colorScheme.onSurface.withValues(
                alpha: 0.05,
              ),
              padding: EdgeInsets.symmetric(horizontal: 19, vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
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
            width: 56,
            height: 56,
            fit: BoxFit.cover,
            borderRadius: BorderRadius.circular(56),
          ),
          const SizedBox(width: 8),
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
                const SizedBox(height: 4),
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
      onTap: () {},
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
