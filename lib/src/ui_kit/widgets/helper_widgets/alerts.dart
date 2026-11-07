import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gazzer_apps/src/ui_kit/extensions/context.dart';
import 'package:gazzer_apps/src/ui_kit/l10n/ui_l10n.dart';
import 'package:gazzer_apps/src/ui_kit/theme/app_colors.dart';
// import 'package:panara_dialogs/panara_dialogs.dart';

class Alerts {
  static void exitSnack(BuildContext context, {String? msg}) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
        showCloseIcon: true,
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.only(bottom: MediaQuery.sizeOf(context).height * 0.63, right: 8, left: 8),
        dismissDirection: DismissDirection.up,
        duration: const Duration(seconds: 2),
        backgroundColor: Co.dark.withAlpha(175),
        content: Text(msg ?? UiL10n.tr().pressDoubleBackToExit, style: context.style16500.copyWith(color: Co.white)),
      ),
    );
  }

  static void exitBanner(BuildContext context, {String? msg}) {
    ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
    ScaffoldMessenger.of(context).showMaterialBanner(
      MaterialBanner(
        actions: [
          TextButton(
            onPressed: () {
              ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
            },
            child: Text(UiL10n.tr().cancel, style: context.style16500.copyWith(color: Co.white)),
          ),
        ],

        // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
        // showCloseIcon: true,

        // dismissDirection: DismissDirection.up,
        // duration: const Duration(seconds: 2),
        backgroundColor: Co.dark,
        content: Text(msg ?? UiL10n.tr().pressDoubleBackToExit, style: context.style16500.copyWith(color: Co.white)),
      ),
    );
  }

  static void showToast(String message, {Toast? length, ToastGravity toastGravity = ToastGravity.BOTTOM, bool error = false, bool isInfo = false}) {
    if (message.isEmpty) return;
    Fluttertoast.showToast(
      msg: message,
      toastLength: length ?? (message.length > 35 ? Toast.LENGTH_LONG : Toast.LENGTH_SHORT),
      gravity: toastGravity,
      timeInSecForIosWeb: 3,
      fontSize: 16,
      backgroundColor: 
          error
          ? Co.red
          : Co.purple,
      textColor:  Co.white ,
    );
  }

  // static void locationDisabled() {
  //   final context = AppConsts.navigatorKey.currentContext!;
  //   showDialog(
  //     context: context,
  //     builder: (context) => Dialogs.confirmDialog(
  //       title: UiL10n.tr().attention,
  //       message: UiL10n.tr().pleaseEnableLocationService,
  //     ),
  //   );
  // }
}
