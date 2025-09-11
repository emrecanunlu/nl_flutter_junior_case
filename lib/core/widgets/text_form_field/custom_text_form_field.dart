import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:jr_case_boilerplate/core/enums/assets/app_icons.dart';

class CustomTextFormField extends StatefulWidget {
  final AppIcons prefixIcon;
  final String? hintText;
  final TextEditingController? controller;
  final bool obscureText;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;

  const CustomTextFormField({
    super.key,
    required this.prefixIcon,
    this.hintText,
    this.controller,
    this.obscureText = false,
    this.keyboardType,
    this.validator,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _isPasswordVisible = false;

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

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 58,
      child: TextFormField(
        controller: widget.controller,
        obscureText: widget.obscureText ? !_isPasswordVisible : false,
        keyboardType: widget.keyboardType,
        validator: widget.validator,
        style: Get.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w500),
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: Get.textTheme.bodySmall?.copyWith(
            color: Get.theme.colorScheme.onSurface.withValues(alpha: 0.5),
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 8,
              top: 12,
              bottom: 12,
            ),
            child: SvgPicture.asset(
              widget.prefixIcon.path,
              width: 24,
              height: 24,
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
                      padding: const EdgeInsets.only(
                        left: 10,
                        right: 20,
                        top: 12,
                        bottom: 12,
                      ),
                      child: SvgPicture.asset(
                        _isPasswordVisible
                            ? AppIcons.hide.path
                            : AppIcons.see.path,
                        width: 24,
                        height: 24,
                        colorFilter: ColorFilter.mode(
                          Get.theme.colorScheme.onSurface,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  )
                  : null,
          contentPadding: EdgeInsets.only(
            left: 0,
            right: widget.obscureText ? 0 : 20,
            top: 16,
            bottom: 16,
          ),
        ),
      ),
    );
  }
}
