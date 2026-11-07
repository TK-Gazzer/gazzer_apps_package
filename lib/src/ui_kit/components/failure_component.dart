import 'package:flutter/material.dart';
import 'package:gazzer_apps/src/ui_kit/extensions/context.dart';
import 'package:gazzer_apps/src/ui_kit/l10n/ui_l10n.dart';
import 'package:gazzer_apps/src/ui_kit/resources/resources.dart';
import 'package:gazzer_apps/src/ui_kit/resources/ui_assets.dart';
import 'package:gazzer_apps/src/ui_kit/theme/app_theme.dart';
import 'package:gazzer_apps/src/ui_kit/widgets/helper_widgets/helper_widgets.dart';

class FailureComponent extends StatelessWidget {
  const FailureComponent({super.key, this.message, this.onRetry, this.retryText});

  final String? message;
  final VoidCallback? onRetry;

  /// Retry button label, defaults to "Try again".
  final String? retryText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppConst.defaultHrPadding,
      child: Column(
        spacing: 16,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const VerticalSpacing(8),
          Image.asset(UiAssets.assetsPngError, height: 250),
          if (message == null) ...[
            Text(UiL10n.tr().oops, style: context.style20500.copyWith(color: context.isDarkMode ? Co.white : Co.purple)),
            const Row(),
          ],
          if (message != null)
            Text(
              message!,
              style: context.style16400.copyWith(fontWeight: TStyle.bold),
              textAlign: TextAlign.center,
            ),
          if (onRetry != null)
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MainBtn(
                  onPressed: onRetry!,
                  bgColor: Co.secondary,
                  radius: 16,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                  text: retryText ?? UiL10n.tr().tryAgain,
                  textStyle: context.style14400.copyWith(color: Co.black),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
