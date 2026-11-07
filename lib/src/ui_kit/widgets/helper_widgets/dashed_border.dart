import 'package:flutter/material.dart';
import 'package:gazzer_apps/src/ui_kit/extensions/context.dart';
import 'package:gazzer_apps/src/ui_kit/theme/app_colors.dart';

class DashedBorder extends StatelessWidget {
  const DashedBorder({
    super.key,
    required this.width,
    required this.gap,
    this.color ,
    this.thickness = 1,
  });
  final double width;
  final double gap;
  final Color? color;
  final double thickness;
  @override
  Widget build(BuildContext context) {
    final dashColor = context.isDarkMode ? Co.purple : Co.black;
    return LayoutBuilder(
      builder: (context, constraints) => Row(
        children: List.generate(
          constraints.maxWidth ~/ (gap + width),
          (index) => Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: gap / 2),
            child: SizedBox(
              width: width,
              height: thickness,
              child: ColoredBox(color: color ?? dashColor),
            ),
          ),
        ),
      ),
    );
  }
}
