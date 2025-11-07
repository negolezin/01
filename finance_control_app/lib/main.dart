import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'src/ui/app.dart';
import 'src/ui/routes/app_router.dart';
import 'src/ui/theme/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    ProviderScope(
      child: FinanceControlRoot(
        router: AppRouter(),
        themeBuilder: AppTheme.new,
      ),
    ),
  );
}

class FinanceControlRoot extends ConsumerWidget {
  const FinanceControlRoot({
    required this.router,
    required this.themeBuilder,
    super.key,
  });

  final AppRouter router;
  final AppTheme Function() themeBuilder;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appTheme = themeBuilder();

    return FinanceControlApp(
      router: router,
      theme: appTheme.lightTheme,
      darkTheme: appTheme.darkTheme,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('pt'),
      ],
    );
  }
}
