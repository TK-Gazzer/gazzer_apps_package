import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gazzer_apps/src/ui_kit/l10n/ui_l10n.dart';
import 'package:gazzer_apps/src/ui_kit/gazzer_ui_config.dart';

extension BuildContextExtension on BuildContext {
  void unFocusKeyboard() => FocusScope.of(this).unfocus();

  dynamic get getArguments => ModalRoute.of(this)?.settings.arguments;

  TextTheme get appTextTheme => Theme.of(this).textTheme;

  Color get primaryColor => Theme.of(this).primaryColor;

  Color get scaffoldBackgroundColor => Theme.of(this).scaffoldBackgroundColor;

  double get screenHeight => MediaQuery.sizeOf(this).height;

  double get screenWidth => MediaQuery.sizeOf(this).width;

  Size get screenSize => MediaQuery.of(this).size;

  double get minScreenSize => min(MediaQuery.of(this).size.height, MediaQuery.of(this).size.width);

  double get maxScreenSize => max(MediaQuery.of(this).size.height, MediaQuery.of(this).size.width);

  TextTheme get _gazzerTextTheme => Theme.of(this).textTheme;

  TextStyle get style32700 => _gazzerTextTheme.displayLarge!;
  TextStyle get style24500 => _gazzerTextTheme.titleLarge!;
  TextStyle get style20500 => _gazzerTextTheme.titleMedium!;
  TextStyle get style16500 => _gazzerTextTheme.titleSmall!;
  TextStyle get style16400 => _gazzerTextTheme.labelLarge!;
  TextStyle get style14400 => _gazzerTextTheme.labelMedium!;
  TextStyle get style12400 => _gazzerTextTheme.labelSmall!;
  TextStyle get style8400 => _gazzerTextTheme.bodySmall!;
}

extension PaddingList on List<Widget> {
  List<Widget> paddingDirectional({double? top, double? bottom, double? start, double? end}) {
    return map(
      (e) => Padding(
        padding: EdgeInsetsDirectional.only(top: top ?? 0, bottom: bottom ?? 0, start: start ?? 0, end: end ?? 0),
        child: e,
      ),
    ).toList();
  }
}

extension ColorOpacityX on Color {
  Color withOpacityNew(double opacity) {
    assert(opacity >= 0.0 && opacity <= 1.0, 'Opacity must be between 0.0 and 1.0');
    return withAlpha((opacity * 255).toInt());
  }
}

extension ArabicNumbers on String {
  /// Converts English digits (0-9) to Arabic-Indic digits (٠-٩)
  String toArabicNumbers() {
    const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
    const arabic = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];

    String result = this;
    final ctx = GazzerUi.context;
    if (ctx != null && UiL10n.isAr(ctx)) {
      for (int i = 0; i < english.length; i++) {
        result = result.replaceAll(english[i], arabic[i]);
      }
    }
    return result;
  }
}

extension ArabicNumbersInt on int {
  /// Converts integer to String with Arabic-Indic digits if needed
  String toArabicString({required bool isArabic}) {
    return isArabic ? toString().toArabicNumbers() : toString();
  }
}

extension ArabicNumbersDouble on double {
  /// Converts double to String with Arabic-Indic digits if needed
  String toArabicString({required bool isArabic}) {
    return isArabic ? toString().toArabicNumbers() : toString();
  }
  }

/// Members that GetX's `ContextExtensionss` also defines, with the same
/// meaning. GetX apps can drop these to avoid ambiguity:
/// `import 'package:gazzer_apps/gazzer_ui.dart' hide GazzerThemeContext;`
extension GazzerThemeContext on BuildContext {
  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => theme.textTheme;

  /// Driven by the active [ThemeData.brightness], so it follows whatever
  /// `themeMode` the host app passes to its MaterialApp / GetMaterialApp.
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;
}
