import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_sales_order/src/app/bloc/product_request/product_request_bloc.dart';
import 'package:flexurio_chiron_sales_order/src/app/model/product_request.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';

class ProductRequestInformation extends StatelessWidget {
  const ProductRequestInformation({
    super.key,
    required this.bloc,
    required this.productRequestFormPurchaseOrder,
    required this.purchaseOrderDistributor,
    required this.subTotalAfterDiscount,
    required this.ppn,
    required this.pph,
    required this.note,
    required this.departmentName,
    required this.customerName,
    required this.deliveryAddressAddress,
    required this.deliveryAddressAddressId,
    required this.bankFee,
    required this.termOfPayment,
    required this.currencyId,
    required this.orderTypeName,
    required this.rate,
    required this.typeProduct,
    required this.transactionTypeName,
    required this.customerId,
  });

  final ProductRequestBloc bloc;
  final ProductRequestFormPurchaseOrder? productRequestFormPurchaseOrder;
  final String purchaseOrderDistributor;
  final double subTotalAfterDiscount;
  final double ppn;
  final double pph;
  final String note;
  final String departmentName;
  final String customerName;
  final String customerId;
  final String deliveryAddressAddress;
  final String deliveryAddressAddressId;
  final String currencyId;
  final double bankFee;
  final int termOfPayment;
  final String orderTypeName;
  final double rate;
  final String typeProduct;
  final String transactionTypeName;

  @override
  Widget build(BuildContext context) {
    return SimpleInformation(
      data: [
        {
          'purchase_order_distributor'.tr(): purchaseOrderDistributor,
          'department'.tr(): departmentName,
        },
        {
          'customer'.tr(): '$customerId - $customerName',
          'delivery_address'.tr():
              '$deliveryAddressAddressId - $deliveryAddressAddress',
        },
        {
          'term_of_payment'.tr(): termOfPayment.toString(),
          'order_type'.tr(): orderTypeName,
        },
        {
          'product_type'.tr(): typeProduct,
          'rate'.tr(): rate.toString(),
        },
        {
          'currency'.tr(): currencyId,
          'bank_fee'.tr(): bankFee.idr,
        },
        {
          'transaction_type'.tr(): transactionTypeName,
          'subtotal_after_discount'.tr(): subTotalAfterDiscount.idr,
        },
        {
          'note'.tr(): note,
        },
      ],
    );
  }
}
