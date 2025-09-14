import 'package:flutter/material.dart';
import 'bottom_sheet_helpers.dart';

final class BottomSheetHelpersImpl implements BottomSheetHelpers {
  @override
  Future<void> offerBottomSheet(BuildContext context, Widget content) {
    return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        return content;
      },
    );
  }
}
