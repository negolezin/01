import 'package:flutter/material.dart';

import 'routes/app_router.dart';

class FinanceControlApp extends StatelessWidget {
  const FinanceControlApp({
    required this.router,
    required this.theme,
    required this.darkTheme,
    required this.localizationsDelegates,
    required this.supportedLocales,
    super.key,
  });

  final AppRouter router;
  final ThemeData theme;
  final ThemeData darkTheme;
  final Iterable<LocalizationsDelegate<dynamic>> localizationsDelegates;
  final Iterable<Locale> supportedLocales;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Finance Control',
      theme: theme,
      darkTheme: darkTheme,
      onGenerateRoute: router.onGenerateRoute,
      initialRoute: AppRoutes.home,
      localizationsDelegates: localizationsDelegates,
      supportedLocales: supportedLocales,
    );
  }
}
