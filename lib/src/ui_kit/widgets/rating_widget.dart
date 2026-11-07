import 'package:flutter/material.dart';
import 'package:gazzer_apps/src/ui_kit/extensions/context.dart';
import 'package:gazzer_apps/src/ui_kit/resources/ui_assets.dart';
import 'package:gazzer_apps/src/ui_kit/theme/app_colors.dart';
import 'package:gazzer_apps/src/ui_kit/widgets/helper_widgets/spacing.dart';
import 'package:gazzer_apps/src/ui_kit/widgets/vector_graphics_widget.dart';

class AppRatingWidget extends StatelessWidget {
  final String initialRating;
  final double itemSize;
  final int? reviewCount;
  final bool ignoreGesture;
  final Function(double)? onRate;

  const AppRatingWidget(this.initialRating, {this.itemSize = 15, this.ignoreGesture = true, super.key, this.onRate, this.reviewCount});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const VectorGraphicsWidget(UiAssets.starRateIc, width: 20, height: 20),
        const HorizontalSpacing(4),
        Text('${double.tryParse(initialRating) ?? 0.0}', style: context.style16400),
        if (reviewCount != null) ...[
          const HorizontalSpacing(2),
          Text('(+$reviewCount)', style: context.style14400.copyWith(color: context.isDarkMode ? Co.lightGrey : Co.darkGrey)),
        ],
      ],
    );
  }
}
