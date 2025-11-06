import 'package:flutter/material.dart';

import '../screens/home_screen.dart';

class AppRoutes {
  static const home = '/';
  static const transactions = '/transactions';
  static const reports = '/reports';
}

class AppRouter {
  const AppRouter();

  Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.home:
        return MaterialPageRoute<void>(
          builder: (_) => const HomeScreen(),
          settings: settings,
        );
      case AppRoutes.transactions:
        return MaterialPageRoute<void>(
          builder: (_) => const PlaceholderScreen(title: 'Transactions'),
          settings: settings,
        );
      case AppRoutes.reports:
        return MaterialPageRoute<void>(
          builder: (_) => const PlaceholderScreen(title: 'Reports'),
          settings: settings,
        );
      default:
        return MaterialPageRoute<void>(
          builder: (_) => const PlaceholderScreen(title: 'Unknown Route'),
          settings: settings,
        );
    }
  }
}

class PlaceholderScreen extends StatelessWidget {
  const PlaceholderScreen({required this.title, super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Text('Content for $title will be available soon.'),
      ),
    );
  }
}
