import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:finance_control_app/main.dart';
import 'package:finance_control_app/src/ui/routes/app_router.dart';
import 'package:finance_control_app/src/ui/theme/app_theme.dart';

void main() {
  testWidgets('FinanceControlRoot builds without crashing', (tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: FinanceControlRoot(
          router: AppRouter(),
          themeBuilder: AppTheme.new,
        ),
      ),
    );
  });
}
