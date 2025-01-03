import 'package:flexurio_chiron_finance/src/app/model/currency.dart';
import 'package:flexurio_chiron_customer/flexurio_chiron_customer.dart';
import 'package:flexurio_chiron_sales_order/src/app/model/sales_order.dart';
import 'package:flexurio_chiron_company/flexurio_chiron_company.dart';
import 'package:flexurio_chiron_tax/src/app/model/tax.dart';
import 'package:flexurio_chiron_accounting/src/app/model/transaction_type.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_return.freezed.dart';
part 'product_return.g.dart';

@freezed
class ProductReturn with _$ProductReturn {
  factory ProductReturn({
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
    @JsonKey(name: 'reference_no') required String referenceNo,
    required String description,
    required double subtotal,
    @JsonKey(name: 'discount_percent') required double discountPercent,
    @JsonKey(name: 'discount_value') required double discountValue,
    @JsonKey(name: 'subtotal_after_discount')
    required double subtotalAfterDiscount,
    @JsonKey(name: 'ppn_value') required double ppnValue,
    @JsonKey(name: 'ppn_percent', fromJson: Ppn.fromNum)
    required Ppn ppnPercent,
    @JsonKey(name: 'subtotal_after_ppn') required double subtotalAfterPpn,
    required double total,
    @JsonKey(name: 'account_value') required double accountValue,
    @JsonKey(name: 'status', fromJson: ProductReturnStatus.fromString)
    required ProductReturnStatus status,
    @JsonKey(name: 'confirm_marketing_at', fromJson: dateTimeNullable)
    DateTime? confirmMarketingAt,
    @JsonKey(name: 'confirm_ppic_at', fromJson: dateTimeNullable)
    DateTime? confirmPpicAt,
  }) = _ProductReturn;

  factory ProductReturn.fromJson(Map<String, dynamic> json) =>
      _$ProductReturnFromJson(json);
  const ProductReturn._();

  factory ProductReturn.empty() {
    return ProductReturn(
      id: '',
      createdAt: DateTime(0),
      updatedAt: DateTime(0),
      currency: Currency.empty(),
      customer: Customer.empty(),
      department: Department.empty(),
      transactionType: TransactionType.empty(),
      referenceNo: '',
      description: '',
      subtotal: 0,
      discountPercent: 0,
      discountValue: 0,
      subtotalAfterDiscount: 0,
      ppnPercent: Ppn.empty,
      ppnValue: 0,
      subtotalAfterPpn: 0,
      total: 0,
      accountValue: 0,
      status: ProductReturnStatus.empty,
    );
  }

  int? get leadTime {
    final duration = confirmPpicAt?.difference(createdAt);
    if (duration == null) return null;
    final days = duration.inDays;
    final daysInWeek = days ~/ 7 * 5;
    final remainingDays = days % 7;
    final weekDays = [
      for (var i = 0; i < remainingDays; i++)
        DateTime(0).add(Duration(days: daysInWeek + i)).weekday,
    ];
    final weekendDays = weekDays.where((day) => day >= 6).length;
    return days - weekendDays;
  }
}

enum ProductReturnStatus implements ColorType {
  empty('', Colors.transparent),
  confirmPPIC('CONFIRM PPIC', Colors.blue),
  confirm('CONFIRM', Colors.indigo),
  confirmMarketing('CONFIRM MARKETING', Colors.blueGrey),
  input('INPUT', Colors.green);

  const ProductReturnStatus(this.id, this.color);
  final String id;

  @override
  String get label => id;

  @override
  final Color color;

  static ProductReturnStatus fromString(String id) {
    if (id == ProductReturnStatus.confirmPPIC.id) {
      return ProductReturnStatus.confirmPPIC;
    }
    if (id == ProductReturnStatus.confirmMarketing.id) {
      return ProductReturnStatus.confirmMarketing;
    }
    if (id == ProductReturnStatus.input.id) {
      return ProductReturnStatus.input;
    }
    if (id == ProductReturnStatus.confirm.id) {
      return ProductReturnStatus.confirm;
    }
    return ProductReturnStatus.empty;
  }
}

class ProductReturnCustomerForm {
  ProductReturnCustomerForm({
    this.department,
    this.customer,
    this.transactionType,
    this.currency,
    this.subtotal,
    this.referenceNumber,
    this.ppnPercent,
    this.discountPercent,
    this.total,
    this.description,
    this.id,
    this.salesOrder,
  });

  factory ProductReturnCustomerForm.empty() => ProductReturnCustomerForm(
        department: Department.empty(),
        customer: Customer.empty(),
        transactionType: TransactionType.empty(),
        currency: Currency.empty(),
        subtotal: 0,
        referenceNumber: '',
        ppnPercent: Ppn.empty,
        discountPercent: 0,
        total: 0,
        id: '',
        description: '',
        salesOrder: SalesOrder.empty(),
      );

  final Department? department;
  final Customer? customer;
  final TransactionType? transactionType;
  final Currency? currency;
  final double? subtotal;
  final String? referenceNumber;
  final Ppn? ppnPercent;
  final double? discountPercent;
  final double? total;
  final String? description;
  final String? id;
  final SalesOrder? salesOrder;
}
