import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jr_case_boilerplate/core/base/base_view.dart';
import 'package:jr_case_boilerplate/core/enums/assets/app_icons.dart';
import 'package:jr_case_boilerplate/core/mixins/validators_mixin.dart';
import 'package:jr_case_boilerplate/core/widgets/app_icon/app_icon_widget.dart';
import 'package:jr_case_boilerplate/core/widgets/container/gradient_container.dart';
import 'package:jr_case_boilerplate/core/widgets/buttons/custom_primary_button.dart';
import 'package:jr_case_boilerplate/core/widgets/text_form_field/custom_text_form_field.dart';
import 'package:jr_case_boilerplate/features/auth/controllers/register_controller.dart';
import 'package:jr_case_boilerplate/features/auth/widgets/auth_rich_text.dart';
import 'package:jr_case_boilerplate/features/auth/widgets/social_button.dart';
import 'package:jr_case_boilerplate/features/auth/widgets/terms_and_cnoditions_checkbox.dart';

class RegisterView extends BaseView<RegisterController> with ValidatorsMixin {
  const RegisterView({super.key});

  @override
  RegisterController get controllerType => RegisterController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientContainer(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: SafeArea(
            child: Column(
              children: [
                buildAppIcon(),
                const SizedBox(height: 24),
                buildFormTitle(),
                const SizedBox(height: 12),
                buildFormSubtitle(),
                const SizedBox(height: 36),
                buildFormFields(),
                const SizedBox(height: 24),
                buildSocialButtonRow(),
                const SizedBox(height: 24),
                buildSignInRichText(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildSignInRichText() =>
      AuthRichText.signIn(onTap: controller.onSignInTap);

  Widget buildAppIcon() {
    return Align(alignment: Alignment.center, child: AppIcon());
  }

  Widget buildFormTitle() {
    return Text('screen.register.title'.tr, style: Get.textTheme.titleLarge);
  }

  Widget buildFormSubtitle() {
    return Text('screen.register.subtitle'.tr, style: Get.textTheme.bodySmall);
  }

  Widget buildSignUpButton() {
    return Obx(
      () => CustomPrimaryButton(
        onPressed: controller.onSignUpTap,
        title: 'common.signUp'.tr,
        isLoading: controller.isLoading.value,
        disabled: controller.isLoading.value,
      ),
    );
  }

  Widget buildFormFields() {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: controller.formKey,
      child: Column(
        children: [
          buildNameFormField(),
          const SizedBox(height: 16),
          buildEmailFormField(),
          const SizedBox(height: 16),
          buildPasswordFormField(),
          const SizedBox(height: 16),
          buildConfirmPasswordFormField(),
          const SizedBox(height: 16),
          buildTermsAndConditionsCheckbox(),
          const SizedBox(height: 24),
          buildSignUpButton(),
        ],
      ),
    );
  }

  Widget buildTermsAndConditionsCheckbox() {
    return Obx(
      () => TermsAndConditionsCheckbox(
        value: controller.isTermsAndConditionsAccepted.value,
        onChanged: controller.onTermsAndConditionsTap,
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

  Widget buildNameFormField() {
    return CustomTextFormField(
      prefixIcon: AppIcons.user,
      controller: controller.field('name'),
      hintText: 'common.fullName'.tr,
      validator: validateFullName,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.name,
    );
  }

  Widget buildEmailFormField() {
    return CustomTextFormField(
      prefixIcon: AppIcons.mail,
      controller: controller.field('email'),
      hintText: 'common.email'.tr,
      validator: validateEmail,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.emailAddress,
    );
  }

  Widget buildPasswordFormField() {
    return CustomTextFormField(
      prefixIcon: AppIcons.lock,
      controller: controller.field('password'),
      hintText: 'common.password'.tr,
      obscureText: true,
      validator: validatePassword,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.visiblePassword,
    );
  }

  Widget buildConfirmPasswordFormField() {
    return CustomTextFormField(
      prefixIcon: AppIcons.lock,
      controller: controller.field('confirmPassword'),
      hintText: 'common.confirmPassword'.tr,
      obscureText: true,
      validator:
          (value) =>
              validateConfirmPassword(value, controller.field('password').text),
      textInputAction: TextInputAction.done,
      keyboardType: TextInputType.visiblePassword,
    );
  }

  Widget buildForm() {
    return Column(
      children: [buildFormTitle(), buildFormSubtitle(), buildFormFields()],
    );
  }
}
