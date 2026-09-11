import 'package:flutter/widgets.dart';
import '../l10n/app_localizations.dart';

class L10n {
  static AppLocalizations? _current;

  // Initialize this once, preferably when your app starts or in a base widget
  static void init(BuildContext context) {
    _current = AppLocalizations.of(context);
  }

  // Access the translations from anywhere
  static AppLocalizations tr() {
    if (_current == null) {
      throw Exception('L10n not initialized. Make sure to call L10n.init(context) first.');
    }
    return _current!;
  }
}
