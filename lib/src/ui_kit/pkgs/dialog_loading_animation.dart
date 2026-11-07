import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gazzer_apps/src/ui_kit/gazzer_ui_config.dart';
import 'package:gazzer_apps/src/ui_kit/theme/app_theme.dart';

void animationDialogLoading([BuildContext? context]) {
  final targetContext = context ?? GazzerUi.context;
  if (targetContext == null) return;

  showDialog(
    context: targetContext,
    barrierColor: Colors.black26,
    barrierDismissible: false,
    builder: (dialogContext) => const Dialog(backgroundColor: Colors.transparent, child: LoadingWidget()),
  );
}

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key, this.color});

  final Color? color;
  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 50, width: 50, child: SpinKitChasingDots(color: color ?? Co.purple));
  }
}

void closeDialog([BuildContext? context]) {
  final navigatorState = GazzerUi.navigatorKey?.currentState;
  if (navigatorState != null && navigatorState.canPop()) {
    navigatorState.pop();
    return;
  }

  final targetContext = context ?? GazzerUi.context;
  if (targetContext == null) return;

  final navigator = Navigator.of(targetContext, rootNavigator: true);
  if (navigator.canPop()) {
    navigator.pop();
  }
}
