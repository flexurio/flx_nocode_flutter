import 'package:appointment/src/app/util/picker_file.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_finance/src/app/bloc/invoice_receipt_query/invoice_receipt_query_bloc.dart';
import 'package:flexurio_chiron_finance/src/app/model/invoice_receipt.dart';
import 'package:flexurio_chiron_finance/src/app/model/permission.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InvoiceReceiptExportExcelButton extends StatefulWidget {
  const InvoiceReceiptExportExcelButton({super.key});

  static Widget prepare() {
    return BlocProvider(
      create: (context) => InvoiceReceiptQueryBloc(),
      child: const InvoiceReceiptExportExcelButton(),
    );
  }

  @override
  State<InvoiceReceiptExportExcelButton> createState() =>
      _InvoiceReceiptExportExcelButtonState();
}

class _InvoiceReceiptExportExcelButtonState
    extends State<InvoiceReceiptExportExcelButton> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<InvoiceReceiptQueryBloc>();

    return BlocListener<InvoiceReceiptQueryBloc, InvoiceReceiptQueryState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          loaded: (pageOptions) {
            final bytes = simpleExcel<InvoiceReceipt>(
              context: context,
              data: pageOptions.data,
              columns: [
                TColumn(
                  title: 'tax_invoice_number'.tr(),
                  builder: (data, index) => data.taxInvoiceNumber,
                ),
                TColumn(
                  title: 'date'.tr(),
                  builder: (data, index) => data.date.ddMMyyyy,
                ),
                TColumn(
                  title: 'sales_order'.tr(),
                  builder: (data, index) => data.orderId,
                ),
                TColumn(
                  title: 'invoice'.tr(),
                  builder: (data, index) => data.taxInvoice ?? '',
                ),
                TColumn(
                  title: 'pbf_name'.tr(),
                  builder: (data, index) => data.deliveryAddress ?? '',
                ),
                TColumn(
                  title: 'amount'.tr(),
                  numeric: true,
                  builder: (data, index) => data.total.format(),
                ),
              ],
            );
            saveFile(bytes, 'Invoice_Receipt.xlsx');
          },
        );
      },
      child: BlocBuilder<InvoiceReceiptQueryBloc, InvoiceReceiptQueryState>(
        builder: (context, state) {
          return LightButtonSmall(
            action: DataAction.exportExcel,
            status: state.maybeWhen(
              loading: (_) => Status.progress,
              orElse: () => null,
            ),
            permission: PermissionFinance.invoiceReceiptExportPdf,
            onPressed: () {
              bloc.add(
                InvoiceReceiptQueryEvent.fetch(
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
