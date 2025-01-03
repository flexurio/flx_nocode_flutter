import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction.freezed.dart';
part 'transaction.g.dart';

@freezed
class Transaction with _$Transaction {
  factory Transaction({
    @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
    required DateTime createdAt,
    @JsonKey(name: 'created_by_id') required int createdById,
    @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
    required DateTime updatedAt,
    @JsonKey(name: 'updated_by_id') required int updateById,
    required String id,
    @JsonKey(name: 'order_id') required String orderId,
    required double total,
    @JsonKey(name: 'date', fromJson: isoDateToDateTime) required DateTime date,
    @JsonKey(name: 'due_date', fromJson: isoDateToDateTime)
    required DateTime dueDate,
    @JsonKey(name: 'transaction_type_id') String? transactionTypeId,
    @JsonKey(name: 'is_type_transaction') int? isTypeTransaction,
  }) = _Transaction;

  factory Transaction.fromJson(Map<String, dynamic> json) =>
      _$TransactionFromJson(json);
  const Transaction._();

  factory Transaction.empty() {
    return Transaction(
      dueDate: DateTime.now(),
      id: '',
      createdById: 0,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      updateById: 0,
      total: 0,
      orderId: '',
      date: DateTime.now(),
    );
  }
}

enum TransactionTypes {
  sales(0, 'sales'),
  payment(1, 'payment'),
  returnSales(2, 'return sales'),
  returnPayment(3, 'return payment');

  const TransactionTypes(this.id, this.name);
  final int id;
  final String name;
}
