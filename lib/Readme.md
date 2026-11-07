
flutter gen-l10n
## UI kit (`package:gazzer_apps/gazzer_ui.dart`)

Theme, colors (`Co`), gradients (`Grad`), text styles (`TStyle`), layout
constants (`AppConst`) and the shared widgets copied from the Gazzer user app.
It is a separate import from `gazzer_apps.dart` on purpose: its
`BuildContext` extensions (`context.theme`, `context.isDarkMode`, …) would
clash with GetX's in files that only need the models.

Setup in the host app:

```dart
// GetX already provides context.theme / textTheme / isDarkMode (same meaning),
// so hide the kit's copies to avoid "ambiguous extension member" errors.
import 'package:gazzer_apps/gazzer_ui.dart' hide GazzerThemeContext;

GazzerUi.navigatorKey = Get.key; // or your own GlobalKey<NavigatorState>

ScreenUtilInit(
  minTextAdapt: true,
  splitScreenMode: true,
  builder: (context, _) => GetMaterialApp(
    navigatorKey: Get.key,
    theme: AppTheme.lightTheme,
    darkTheme: AppTheme.darkTheme,
    themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
    localizationsDelegates: AppLocalizations.localizationsDelegates,
    supportedLocales: AppLocalizations.supportedLocales,
    // ...
  ),
);
```

- `context.isDarkMode` follows `Theme.of(context).brightness`, so drive dark
  mode through `themeMode`.
- Fonts (roboto, Alexandria, poppins, inter, playfair) and the kit's icons are
  bundled in this package; `TStyle` switches to Alexandria for Arabic.
- `TStyle` sizes use `flutter_screenutil` (`.sp`), so `ScreenUtilInit` must
  wrap the app.
