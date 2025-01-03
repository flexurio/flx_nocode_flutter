import 'package:flexurio_chiron_accounting/src/app/model/transaction_type.dart';
import 'package:flexurio_chiron_purchase_order/flexurio_chiron_purchase_order.dart';
import 'package:flexurio_chiron_vendor/flexurio_chiron_vendor.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_receive.freezed.dart';
part 'product_receive.g.dart';

enum ProductReceiveType implements ColorType {
  packing('Packing', Colors.orange),
  purchaseOrder('Purchase Order', Colors.blue),
  nonPurchaseOrder('Non Purchase Order', Colors.purple);

  const ProductReceiveType(this.id, this.color);
  final String id;

  @override
  String get label => id;

  @override
  final Color color;

  static List<ProductReceiveType> get list => [
        ProductReceiveType.packing,
        ProductReceiveType.nonPurchaseOrder,
        ProductReceiveType.purchaseOrder,
      ];
}

enum ProductReceiveStatus implements ColorType {
  empty('', '', Colors.transparent),
  input('INPUT', 'Input', Colors.blueGrey),
  inProgress('IN PROGRESS', 'In Progress', Colors.orange),
  close('CLOSE', 'Close', Colors.green);

  const ProductReceiveStatus(this.id, this.label, this.color);
  final String id;

  @override
  final String label;

  @override
  final Color color;

  static ProductReceiveStatus fromString(String id) {
    if (id == ProductReceiveStatus.input.id) {
      return ProductReceiveStatus.input;
    }
    if (id == ProductReceiveStatus.close.id) {
      return ProductReceiveStatus.close;
    }
    if (id == ProductReceiveStatus.inProgress.id) {
      return ProductReceiveStatus.inProgress;
    }
    return ProductReceiveStatus.empty;
  }
}

@freezed
class ProductReceive with _$ProductReceive {
  factory ProductReceive({
    @JsonKey(name: 'id') required String id,
    @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
    required DateTime createdAt,
    @JsonKey(name: 'created_by_id') required int createdById,
    @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
    required DateTime updatedAt,
    @JsonKey(name: 'updated_by_id') required int updatedById,
    @JsonKey(defaultValue: '') required String description,
    @JsonKey(name: 'delivery_order_id') required String? deliveryOrderId,
    @JsonKey(name: 'delivery_order_date', fromJson: dateTimeNullableFromJson)
    required DateTime? deliveryOrderDate,
    @JsonKey(
      name: 'supplier',
      fromJson: Supplier.fromJson,
    )
    required Supplier supplier,
    @JsonKey(
      name: 'status',
      fromJson: ProductReceiveStatus.fromString,
    )
    required ProductReceiveStatus status,
    @JsonKey(
      name: 'transaction_type',
      fromJson: TransactionType.fromJson,
    )
    required TransactionType transactionType,
    @JsonKey(
      name: 'purchase_order',
      fromJson: PurchaseOrder.fromJson,
    )
    required PurchaseOrder purchaseOrder,
  }) = _ProductReceive;
  const ProductReceive._();

  factory ProductReceive.empty() {
    return ProductReceive(
      id: '',
      createdAt: DateTime(0),
      createdById: 0,
      updatedAt: DateTime(0),
      updatedById: 0,
      deliveryOrderId: '',
      deliveryOrderDate: DateTime(0),
      supplier: Supplier.empty(),
      transactionType: TransactionType.empty(),
      purchaseOrder: PurchaseOrder.empty(),
      status: ProductReceiveStatus.empty,
      description: '',
    );
  }

  factory ProductReceive.fromJson(Map<String, dynamic> json) =>
      _$ProductReceiveFromJson(json);

  ProductReceiveType get type {
    if (supplier.id == 'PACKIN') {
      return ProductReceiveType.packing;
    }

    if (purchaseOrder.id != '') {
      return ProductReceiveType.purchaseOrder;
    }

    if (supplier.id != '') {
      return ProductReceiveType.nonPurchaseOrder;
    }

    return ProductReceiveType.packing;
  }
}

class ProductReceiveFormTransaction {
  ProductReceiveFormTransaction({
    required this.supplier,
    required this.transactionType,
    required this.purchaseOrder,
    required this.deliveryOrderId,
    required this.deliveryOrderDate,
    required this.type,
    required this.description,
  });

  final Supplier? supplier;
  final PurchaseOrder? purchaseOrder;
  final String? deliveryOrderId;
  final TransactionType? transactionType;
  final DateTime? deliveryOrderDate;
  final ProductReceiveType type;
  final String description;
}
