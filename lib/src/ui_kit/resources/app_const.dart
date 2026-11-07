import 'package:flutter/widgets.dart';

/// Shared layout constants (radii, paddings) of the Gazzer design.
class AppConst {
  AppConst._();

  static const floatingCartWidth = 64.0;
  static const defaultStoreRadius = 12.0;
  static final defaultStoreBorderRadius = BorderRadius.circular(defaultStoreRadius);
  static const defaultRadius = 16.0;
  static const defaultInnerRadius = 32.0;
  static final defaultBorderRadius = BorderRadius.circular(defaultRadius);
  static final defaultInnerBorderRadius = BorderRadius.circular(defaultInnerRadius);
  static const defaultPadding = EdgeInsets.all(16.0);
  static const smallPadding = EdgeInsets.all(8.0);
  static const defaultHrPadding = EdgeInsets.symmetric(horizontal: 16.0);
}
