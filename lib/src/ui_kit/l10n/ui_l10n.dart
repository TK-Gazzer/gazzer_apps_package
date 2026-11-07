import 'package:flutter/widgets.dart';
import 'package:gazzer_apps/l10n/app_localizations.dart';
import 'package:gazzer_apps/src/ui_kit/gazzer_ui_config.dart';

/// Strings used by the UI kit. Resolves from [AppLocalizations] when the host
/// app registered `AppLocalizations.delegate`, otherwise falls back to a
/// direct lookup by the current locale (English when unsupported).
class UiL10n {
  UiL10n._();

  static AppLocalizations tr([BuildContext? context]) {
    final ctx = context ?? GazzerUi.context;
    if (ctx != null) {
      final loc = AppLocalizations.of(ctx);
      if (loc != null) return loc;
      final locale = Localizations.maybeLocaleOf(ctx);
      if (locale != null && AppLocalizations.delegate.isSupported(locale)) {
        return lookupAppLocalizations(locale);
      }
    }
    return lookupAppLocalizations(const Locale('en'));
  }

  static bool isAr(BuildContext context) => Localizations.maybeLocaleOf(context)?.languageCode == 'ar';
}
