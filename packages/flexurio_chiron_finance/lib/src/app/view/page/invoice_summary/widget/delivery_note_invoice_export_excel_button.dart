import 'package:appointment/src/app/util/picker_file.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_finance/src/app/bloc/delivery_note_invoice_query/delivery_note_invoice_query_bloc.dart';
import 'package:flexurio_chiron_finance/src/app/model/delivery_note_invoice.dart';
import 'package:flexurio_chiron_finance/src/app/model/permission.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeliveryNoteInvoiceExportExcelButton extends StatefulWidget {
  const DeliveryNoteInvoiceExportExcelButton({super.key});

  static Widget prepare() {
    return BlocProvider(
      create: (context) => DeliveryNoteInvoiceQueryBloc(),
      child: const DeliveryNoteInvoiceExportExcelButton(),
    );
  }

  @override
  State<DeliveryNoteInvoiceExportExcelButton> createState() =>
      _DeliveryNoteInvoiceExportExcelButtonState();
}

class _DeliveryNoteInvoiceExportExcelButtonState
    extends State<DeliveryNoteInvoiceExportExcelButton> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<DeliveryNoteInvoiceQueryBloc>();

    return BlocListener<DeliveryNoteInvoiceQueryBloc,
        DeliveryNoteInvoiceQueryState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          loaded: (pageOptions) {
            final bytes = simpleExcel<DeliveryNoteInvoice>(
              context: context,
              data: pageOptions.data,
              columns: [
                TColumn(
                  title: 'year'.tr(),
                  builder: (data, index) => data.year.toString(),
                ),
                TColumn(
                  title: 'period'.tr(),
                  builder: (data, index) => data.period,
                ),
                TColumn(
                  title: 'code_invoice'.tr(),
                  builder: (data, index) => data.codeInvoice,
                ),
                TColumn(
                  title: 'code_sales_invoice'.tr(),
                  builder: (data, index) => data.codeSalesInvoice,
                ),
                TColumn(
                  title: 'sales_invoice_id'.tr(),
                  builder: (data, index) => data.salesInvoiceId,
                ),
                TColumn(
                  title: 'date_sales_order'.tr(),
                  builder: (data, index) => data.dateSalesOrder.ddMMyyyy,
                ),
                TColumn(
                  title: 'delivery_order_id'.tr(),
                  builder: (data, index) => data.deliveryOrderId,
                ),
                TColumn(
                  title: 'invoice_id'.tr(),
                  builder: (data, index) => data.invoiceId,
                ),
                TColumn(
                  title: 'date_transaction'.tr(),
                  builder: (data, index) => data.dateTransaction.ddMMyyyy,
                ),
                TColumn(
                  title: 'tax_invoice_no'.tr(),
                  builder: (data, index) => data.taxInvoiceNo,
                ),
                TColumn(
                  title: 'customer_id'.tr(),
                  builder: (data, index) => data.customerId,
                ),
                TColumn(
                  title: 'product_id'.tr(),
                  builder: (data, index) => data.productId,
                ),
                TColumn(
                  title: 'product_name'.tr(),
                  builder: (data, index) => data.productName,
                ),
                TColumn(
                  title: 'batch_no_id'.tr(),
                  builder: (data, index) => data.batchNoId,
                ),
                TColumn(
                  title: 'qty'.tr(),
                  builder: (data, index) => data.qty.toString(),
                ),
                TColumn(
                  title: 'discount_percent'.tr(),
                  numeric: true,
                  builder: (data, index) =>
                      data.discountPercent.toStringAsFixed(2),
                ),
                TColumn(
                  title: 'subtotal_after_discount'.tr(),
                  numeric: true,
                  builder: (data, index) =>
                      data.subTotalAfterDiscount.toString(),
                ),
                TColumn(
                  title: 'ppn_value'.tr(),
                  numeric: true,
                  builder: (data, index) => data.ppnValue.toString(),
                ),
                TColumn(
                  title: 'price'.tr(),
                  numeric: true,
                  builder: (data, index) => data.price.toString(),
                ),
              ],
            );
            saveFile(bytes, 'Delivery-Note-Invoice.xlsx');
          },
        );
      },
      child: BlocBuilder<DeliveryNoteInvoiceQueryBloc,
          DeliveryNoteInvoiceQueryState>(
        builder: (context, state) {
          return LightButtonSmall(
            action: DataAction.exportExcel,
            status: state.maybeWhen(
              loading: (_) => Status.progress,
              orElse: () => null,
            ),
            permission: PermissionFinance.deliveryNoteInvoiceExportExcel,
            onPressed: () {
              bloc.add(
                DeliveryNoteInvoiceQueryEvent.fetch(
                  pageOptions: PageOptions.emptyNoLimit(),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
