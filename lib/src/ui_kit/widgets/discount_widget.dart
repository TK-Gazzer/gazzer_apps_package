import 'package:flutter/material.dart';
import 'package:gazzer_apps/src/ui_kit/extensions/context.dart';
import 'package:gazzer_apps/src/ui_kit/l10n/ui_l10n.dart';
import 'package:gazzer_apps/src/ui_kit/theme/app_colors.dart';

class DiscountWidget extends StatelessWidget {
  const DiscountWidget({super.key, required this.discountPercent});

  final num discountPercent;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Co.purple,
        borderRadius: BorderRadius.circular(4),
      ),

      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            UiL10n.tr().up_to,
            style: context.style8400.copyWith(
              color: Co.secondary,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            '$discountPercent%',
            style: context.style12400.copyWith(
              color: Co.secondary,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            UiL10n.tr().off,
            style: context.style8400.copyWith(color: Co.secondary),
          ),
        ],
      ),
    );
  }
}
