import 'package:flutter/material.dart';
import 'package:gazzer_apps/src/ui_kit/extensions/context.dart';
import 'package:gazzer_apps/src/ui_kit/theme/app_colors.dart';
import 'package:gazzer_apps/src/ui_kit/widgets/helper_widgets/helper_widgets.dart';

class ConfirmSheet extends StatelessWidget {
  const ConfirmSheet({super.key, required this.btnText, required this.msg});

  final String btnText;
  final String msg;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
      child: Column(
        spacing: 24,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text(msg, style: context.style20500)),
          MainBtn(
            onPressed: () {
              Navigator.of(context).pop(true);
            },
            text: btnText,
            textStyle: context.style16400.copyWith(color: Co.white),
          ),
          const VerticalSpacing(100),
        ],
      ),
    );
  }
}
