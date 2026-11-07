import 'package:flutter/widgets.dart';

/// Host-app configuration for the Gazzer UI kit.
///
/// Set [navigatorKey] once at startup so widgets that need a context outside
/// the tree (dialogs, Arabic-digit conversion, locale-aware text styles) can
/// find one:
///
/// ```dart
/// GazzerUi.navigatorKey = Get.key;          // GetX
/// GazzerUi.navigatorKey = AppNavigator.mainKey; // go_router / Navigator
/// ```
class GazzerUi {
  GazzerUi._();

  static GlobalKey<NavigatorState>? navigatorKey;

  static BuildContext? get context => navigatorKey?.currentContext;
}
