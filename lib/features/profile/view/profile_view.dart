import 'package:flutter/material.dart';
import 'package:jr_case_boilerplate/core/base/base_view.dart';
import 'package:jr_case_boilerplate/core/controllers/dashboard/profile_controller.dart';

class ProfileView extends BaseView<ProfileController> {
  const ProfileView({super.key});

  @override
  ProfileController get controllerType => ProfileController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const PageStorageKey('profile'),
      body: const Center(child: Text('Profile')),
    );
  }
}
