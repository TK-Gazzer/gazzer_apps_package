import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gazzer_apps/gazzer_apps.dart' show AppLocalizations;
import 'package:gazzer_apps/gazzer_ui.dart';

Widget _host(Widget child, {ThemeMode mode = ThemeMode.light, Locale locale = const Locale('en')}) {
  final key = GlobalKey<NavigatorState>();
  GazzerUi.navigatorKey = key;
  return ScreenUtilInit(
    builder: (context, _) => MaterialApp(
      navigatorKey: key,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: mode,
      locale: locale,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: Scaffold(body: SingleChildScrollView(child: child)),
    ),
  );
}

Widget _kit() => Builder(
      builder: (context) => Column(
        children: [
          Text('title', style: context.style20500),
          MainBtn(text: 'Go', onPressed: () {}),
          MainTextField(controller: TextEditingController(), hintText: 'hint'),
          const TitleWithMore(title: 'Section'),
          const AppRatingWidget('4.5', reviewCount: 3),
          const DiscountWidget(discountPercent: 20),
          const AdaptiveProgressIndicator(),
          FailureComponent(message: 'failed', onRetry: () {}),
        ],
      ),
    );

void main() {
  testWidgets('UI kit renders in light theme (en)', (tester) async {
    await tester.pumpWidget(_host(_kit()));
    await tester.pump();
    expect(tester.takeException(), isNull);
    expect(find.text('Go'), findsOneWidget);
    expect(find.text('Try Again'), findsOneWidget);
  });

  testWidgets('UI kit renders in dark theme (ar) and isDarkMode follows theme', (tester) async {
    late bool dark;
    await tester.pumpWidget(_host(
      Builder(builder: (context) {
        dark = context.isDarkMode;
        return _kit();
      }),
      mode: ThemeMode.dark,
      locale: const Locale('ar'),
    ));
    await tester.pump();
    expect(tester.takeException(), isNull);
    expect(dark, isTrue);
    expect(find.text('حاول مرة أخرى'), findsOneWidget);
  });

  test('text styles use package-bundled fonts', () {
    expect(TStyle.robotBlackRegular(font: FFamily.roboto).fontFamily, 'packages/gazzer_apps/roboto');
  });
}
