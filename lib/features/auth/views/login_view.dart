import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jr_case_boilerplate/core/base/base_view.dart';
import 'package:jr_case_boilerplate/core/enums/assets/app_icons.dart';
import 'package:jr_case_boilerplate/core/mixins/validators_mixin.dart';
import 'package:jr_case_boilerplate/core/widgets/app_icon/app_icon_widget.dart';
import 'package:jr_case_boilerplate/core/widgets/buttons/custom_primary_button.dart';
import 'package:jr_case_boilerplate/core/widgets/container/gradient_container.dart';
import 'package:jr_case_boilerplate/core/enums/assets/app_images.dart';
import 'package:jr_case_boilerplate/core/widgets/text_form_field/custom_text_form_field.dart';
import 'package:jr_case_boilerplate/features/auth/controllers/login_controller.dart';
import 'package:jr_case_boilerplate/features/auth/widgets/auth_rich_text.dart';
import 'package:jr_case_boilerplate/features/auth/widgets/social_button.dart';
import 'package:lottie/lottie.dart';

class LoginView extends BaseView<LoginController> with ValidatorsMixin {
  const LoginView({super.key});

  @override
  LoginController get controllerType => LoginController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientContainer(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Lottie animation en üstte
              buildMovieLottie(),
              // Diğer içerikler buraya gelecek
              buildForm(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildMovieLottie() {
    return Lottie.asset(
      AppImages.moviePosterShake.path,
      width: Get.width,
      height: 200,
      fit: BoxFit.contain,
    );
  }

  Widget buildTitle() {
    return Text('screen.login.title'.tr, style: Get.textTheme.titleLarge);
  }

  Widget buildSubtitle() {
    return Text('screen.login.subtitle'.tr, style: Get.textTheme.bodySmall);
  }

  Widget buildEmailFormField() {
    return CustomTextFormField(
      prefixIcon: AppIcons.mail,
      hintText: 'common.email'.tr,
      controller: controller.field('email'),
      validator: validateEmail,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
    );
  }

  Widget buildPasswordFormField() {
    return CustomTextFormField(
      prefixIcon: AppIcons.lock,
      obscureText: true,
      hintText: 'common.password'.tr,
      controller: controller.field('password'),
      validator: validatePassword,
      keyboardType: TextInputType.visiblePassword,
      textInputAction: TextInputAction.done,
    );
  }

  Widget buildForgotPasswordButton() {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {},
        child: Text(
          'common.forgotPassword'.tr,
          style: Get.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  Widget buildSignInButton() {
    return Obx(
      () => CustomPrimaryButton(
        onPressed: controller.onSignInTap,
        title: 'common.signIn'.tr,
        isLoading: controller.isLoading.value,
        disabled: controller.isLoading.value,
      ),
    );
  }

  Widget buildSocialButtonRow() {
    return Row(
      spacing: 15,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SocialButton(icon: AppIcons.google, onPressed: () {}),
        SocialButton(icon: AppIcons.apple, onPressed: () {}),
        SocialButton(icon: AppIcons.facebook, onPressed: () {}),
      ],
    );
  }

  Widget buildForm() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: controller.formKey,
        child: Column(
          children: [
            AppIcon(),
            const SizedBox(height: 24),
            buildTitle(),
            const SizedBox(height: 12),
            buildSubtitle(),
            const SizedBox(height: 24),
            buildEmailFormField(),
            const SizedBox(height: 16),
            buildPasswordFormField(),
            buildForgotPasswordButton(),
            const SizedBox(height: 16),
            buildSignInButton(),
            const SizedBox(height: 24),
            buildSocialButtonRow(),
            const SizedBox(height: 24),
            AuthRichText.signUp(onTap: controller.onSignUpTap),
          ],
        ),
      ),
    );
  }
}
