import 'package:flutter/material.dart';
import 'package:jr_case_boilerplate/features/auth/widgets/auth_rich_text.dart';

class TermsAndConditionsCheckbox extends StatelessWidget {
  final bool value;
  final void Function(bool?) onChanged;

  const TermsAndConditionsCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 4,
      children: [
        Checkbox(
          value: value,
          onChanged: onChanged,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        Expanded(
          child: AuthRichText.termsAndConditions(
            onTap: () {
              /* TODO: Terms and Conditions dialog aç */
            },
            textAlign: TextAlign.start,
          ),
        ),
      ],
    );
  }
}
