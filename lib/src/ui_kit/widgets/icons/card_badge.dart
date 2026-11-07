import 'package:flutter/material.dart';
import 'package:gazzer_apps/src/ui_kit/extensions/context.dart';
import 'package:gazzer_apps/src/ui_kit/theme/app_colors.dart';

class CardBadge extends StatelessWidget {
  const CardBadge({super.key, this.alignment, required this.text, this.textStyle, this.color, this.fullWidth = false});

  final AlignmentDirectional? alignment;
  final String text;
  final TextStyle? textStyle;
  final Color? color;
  final bool fullWidth;

  @override
  Widget build(BuildContext context) {
    final child = Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(color: color ?? Co.white, borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: fullWidth ? MainAxisSize.max : MainAxisSize.min,
        children: [Text(text, style: textStyle ?? context.style16500.copyWith(color: Co.black))],
      ),
    );
    if (alignment != null) {
      return Align(alignment: AlignmentDirectional.topStart, child: child);
    }
    return child;
  }
}
