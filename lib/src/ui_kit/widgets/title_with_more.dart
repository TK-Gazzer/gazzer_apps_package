import 'package:flutter/material.dart';
import 'package:gazzer_apps/src/ui_kit/extensions/context.dart';
import 'package:gazzer_apps/src/ui_kit/l10n/ui_l10n.dart';
import 'package:gazzer_apps/src/ui_kit/resources/app_const.dart';
import 'package:gazzer_apps/src/ui_kit/theme/app_colors.dart';
import 'package:gazzer_apps/src/ui_kit/theme/app_gradient.dart';
import 'package:skeletonizer/skeletonizer.dart';

class TitleWithMore extends StatelessWidget {
  const TitleWithMore({
    super.key,
    required this.title,
    this.titleStyle,
    this.onPressed,
    this.viewAllStyle,
    this.viewAllText,
    this.showEdgeInsets = false,
  });

  final String? title;
  final String? viewAllText;
  final TextStyle? titleStyle;
  final TextStyle? viewAllStyle;
  final bool showEdgeInsets;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final isHovering = ValueNotifier<bool>(false);
    return Padding(
      padding: showEdgeInsets ? const EdgeInsets.symmetric(horizontal: 16.0) : EdgeInsets.zero,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (title != null && title!.isNotEmpty)
            Expanded(
              child: Skeleton.shade(
                child: Text(
                  title!,
                  style: titleStyle ?? context.style20500.copyWith(color: context.isDarkMode ? Co.white : Co.purple),

                  textAlign: TextAlign.start,
                  // maxLines: 1,
                ),
              ),
            ),
          if (onPressed != null)
            ValueListenableBuilder(
              valueListenable: isHovering,
              builder: (context, value, child) => DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: AppConst.defaultBorderRadius,
                  gradient: value ? Grad().hoverGradient : null,
                  // boxShadow: value
                  //     ? []
                  //     : [const BoxShadow(color: Co.darkMain, blurRadius: 0, spreadRadius: 0, offset: Offset(0, 0))],
                ),
                child: child,
              ),
              child: InkWell(
                highlightColor: Co.transparent,
                splashColor: Co.transparent,
                onTap: onPressed ?? () {},
                onHover: (v) {
                  isHovering.value = v;
                },

                child: Text(viewAllText ?? UiL10n.tr().viewAll, style: viewAllStyle ?? context.style16400),
              ),
            ),
        ],
      ),
    );
  }
}
