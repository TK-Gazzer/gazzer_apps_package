import 'package:flutter/material.dart';
import 'package:gazzer_apps/src/ui_kit/extensions/context.dart';
import 'package:gazzer_apps/src/ui_kit/l10n/ui_l10n.dart';
import 'package:gazzer_apps/src/ui_kit/theme/app_colors.dart';

class BusyComponent extends StatelessWidget {
  const BusyComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 6,
      ),
      decoration: BoxDecoration(
        color: Co.red,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        UiL10n.tr().busy,
        style: context.style14400.copyWith(color: Co.white),
      ),
    );
  }
}
