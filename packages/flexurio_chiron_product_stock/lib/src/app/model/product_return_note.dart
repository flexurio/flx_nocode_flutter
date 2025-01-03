import 'package:flexurio_chiron_finance/src/app/model/currency.dart';
import 'package:flexurio_chiron_customer/flexurio_chiron_customer.dart';
import 'package:flexurio_chiron_company/flexurio_chiron_company.dart';
import 'package:flexurio_chiron_tax/src/app/model/tax.dart';
import 'package:flexurio_chiron_accounting/src/app/model/transaction_type.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_return_note.freezed.dart';
part 'product_return_note.g.dart';

@freezed
class ProductReturnNote with _$ProductReturnNote {
  factory ProductReturnNote({
    required String id,
    @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
    required DateTime createdAt,
    @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
    required DateTime updatedAt,
    @JsonKey(name: 'currency_id', fromJson: Currency.fromJson)
    required Currency currency,
    @JsonKey(name: 'customer_id', fromJson: Customer.fromJson)
    required Customer customer,
    @JsonKey(name: 'department_id', fromJson: Department.fromJson)
    required Department department,
    @JsonKey(name: 'transaction_type_id', fromJson: TransactionType.fromJson)
    required TransactionType transactionType,
    required int rate,
    @JsonKey(name: 'purchase_order_id') required String purchaseOrderId,
    @JsonKey(name: 'return_date', fromJson: isoDateToDateTime)
    required DateTime returnDate,
    @JsonKey(name: 'shipping_address') required String shippingAddress,
    @JsonKey(name: 'address_name') required String addressName,
    @JsonKey(name: 'delivery_note_date', fromJson: isoDateToDateTime)
    required DateTime deliveryNoteDate,
    @JsonKey(name: 'term_of_payment') required int termOfPayment,
    required String remark,
    required double subtotal,
    @JsonKey(name: 'discount_percentage') required double discountPercent,
    @JsonKey(name: 'discount_value') required double discountValue,
    @JsonKey(name: 'ppn_percentage', fromJson: Ppn.fromNum)
    required Ppn ppnPercent,
    @JsonKey(name: 'ppn_value') required double ppnValue,
    required double total,
    @JsonKey(name: 'approved_by_id') required int approvedById,
    @JsonKey(name: 'approved_at', fromJson: dateTimeNullable)
    required DateTime? approvedAt,
  }) = _ProductReturnNote;
  const ProductReturnNote._();

  factory ProductReturnNote.fromJson(Map<String, dynamic> json) =>
      _$ProductReturnNoteFromJson(json);

  bool get isApproved => approvedAt != null;
}

enum ProductReturnNoteStatus implements ColorType {
  empty('', Colors.transparent),
  approve('APPROVE', Colors.green),
  input('INPUT', Colors.blue);

  const ProductReturnNoteStatus(this.id, this.color);
  final String id;

  @override
  String get label => id;

  @override
  final Color color;

  static ProductReturnNoteStatus fromString(String id) {
    if (id == ProductReturnNoteStatus.empty.id) {
      return ProductReturnNoteStatus.empty;
    }
    if (id == ProductReturnNoteStatus.approve.id) {
      return ProductReturnNoteStatus.approve;
    }
    if (id == ProductReturnNoteStatus.input.id) {
      return ProductReturnNoteStatus.input;
    }
    throw ArgumentError();
  }
}
