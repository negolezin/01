import 'package:drift/drift.dart';
import '../../data/database/app_database.dart';

class TransactionRepository {
  TransactionRepository(this._database);

  final AppDatabase _database;

  Future<int> createTransaction({
    required String description,
    required double amount,
    required DateTime date,
  }) {
    return _database.addTransaction(
      TransactionsCompanion(
        description: Value(description),
        amount: Value(amount),
        date: Value(date),
      ),
    );
  }

  Stream<List<Transaction>> watchAll() => _database.watchTransactions();
}
