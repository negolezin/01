import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

final greetingProvider = Provider<String>((ref) {
  final now = DateTime.now();
  final hour = now.hour;
  if (hour < 12) {
    return 'Good morning';
  } else if (hour < 18) {
    return 'Good afternoon';
  }
  return 'Good evening';
});

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  static final _chartData = [
    _ChartPoint('Mon', 120),
    _ChartPoint('Tue', 90),
    _ChartPoint('Wed', 160),
    _ChartPoint('Thu', 110),
    _ChartPoint('Fri', 200),
  ];

  static final _series = [
    charts.Series<_ChartPoint, String>(
      id: 'WeeklySpending',
      domainFn: (_ChartPoint point, _) => point.label,
      measureFn: (_ChartPoint point, _) => point.value,
      colorFn: (_, __) => charts.MaterialPalette.teal.shadeDefault,
      data: _chartData,
    ),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final greeting = ref.watch(greetingProvider);
    final locale = Localizations.localeOf(context).toString();
    final today = DateFormat.yMMMMd(locale).format(DateTime.now());

    return Scaffold(
      appBar: AppBar(
        title: Text(MaterialLocalizations.of(context).formatFullDate(
          DateTime.now(),
        )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              greeting,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 8),
            Text(
              'Today is $today',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 24),
            Expanded(
              child: Card(
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: charts.BarChart(
                    _series,
                    animate: true,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ChartPoint {
  _ChartPoint(this.label, this.value);

  final String label;
  final int value;
}
