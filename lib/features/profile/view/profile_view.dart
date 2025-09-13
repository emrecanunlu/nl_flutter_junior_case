import 'package:flutter/material.dart';
import 'package:jr_case_boilerplate/core/base/base_view.dart';
import 'package:jr_case_boilerplate/core/controllers/dashboard/profile_controller.dart';
import 'package:jr_case_boilerplate/core/widgets/container/gradient_container.dart';
import 'package:jr_case_boilerplate/features/profile/widgets/profile_header.dart';

class ProfileView extends BaseView<ProfileController> {
  const ProfileView({super.key});

  @override
  ProfileController get controllerType => ProfileController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientContainer(
        showRadialGradient: false,
        child: SafeArea(
          child: Column(
            children: [
              ProfileHeader(user: controller.user, onAddPhotoPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
