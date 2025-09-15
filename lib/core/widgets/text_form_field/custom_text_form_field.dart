import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:jr_case_boilerplate/core/enums/assets/app_icons.dart';
import 'package:jr_case_boilerplate/core/constants/app_spacing.dart';

class CustomTextFormField extends StatefulWidget {
  final AppIcons prefixIcon;
  final String? hintText;
  final TextEditingController? controller;
  final bool obscureText;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final TextInputAction? textInputAction;

  const CustomTextFormField({
    super.key,
    required this.prefixIcon,
    this.hintText,
    this.controller,
    this.obscureText = false,
    this.keyboardType,
    this.validator,
    this.textInputAction,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _isPasswordVisible = false;
  bool _hasError = false;

  @override
  void initState() {
    super.initState();
    _isPasswordVisible = !widget.obscureText;
  }

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  void _onChanged(String value) {
    if (_hasError) {
      setState(() {
        _hasError = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.obscureText ? !_isPasswordVisible : false,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      autocorrect: false,
      validator: (value) {
        final result = widget.validator?.call(value);
        setState(() {
          _hasError = result != null;
        });
        return result;
      },
      onChanged: _onChanged,
      style: Get.textTheme.bodySmall?.copyWith(
        fontWeight: FontWeight.w500,
        color: _hasError ? Get.theme.colorScheme.error : null,
      ),
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: Get.textTheme.bodySmall?.copyWith(
          color:
              _hasError
                  ? Get.theme.colorScheme.error.withValues(alpha: 0.7)
                  : Get.theme.colorScheme.onSurface.withValues(alpha: 0.5),
        ),
        prefixIcon: Padding(
          padding: AppSpacing.iconPadding,
          child: SvgPicture.asset(
            widget.prefixIcon.path,
            width: AppSpacing.iconSize,
            height: AppSpacing.iconSize,
            colorFilter: ColorFilter.mode(
              Get.theme.colorScheme.onSurface,
              BlendMode.srcIn,
            ),
          ),
        ),
        suffixIcon:
            widget.obscureText
                ? GestureDetector(
                  onTap: _togglePasswordVisibility,
                  child: Padding(
                    padding: AppSpacing.suffixIconPadding,
                    child: SvgPicture.asset(
                      _isPasswordVisible
                          ? AppIcons.hide.path
                          : AppIcons.see.path,
                      width: AppSpacing.iconSize,
                      height: AppSpacing.iconSize,
                      colorFilter: ColorFilter.mode(
                        Get.theme.colorScheme.onSurface,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                )
                : null,
        contentPadding: AppSpacing.contentPadding,
        constraints: AppSpacing.inputConstraints,
      ),
    );
  }
}
