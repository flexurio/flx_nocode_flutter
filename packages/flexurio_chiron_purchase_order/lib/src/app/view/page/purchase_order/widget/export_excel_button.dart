import 'package:appointment/src/app/util/picker_file.dart';
import 'package:flexurio_chiron_purchase_order/flexurio_chiron_purchase_order.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PurchaseOrderExportExcelButton extends StatefulWidget {
  const PurchaseOrderExportExcelButton({super.key});

  @override
  State<PurchaseOrderExportExcelButton> createState() =>
      _PurchaseOrderExportExcelButtonState();
}

class _PurchaseOrderExportExcelButtonState
    extends State<PurchaseOrderExportExcelButton> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PurchaseOrderQueryBloc, PurchaseOrderQueryState>(
      bloc: PurchaseOrderQueryBloc()
        ..add(
          PurchaseOrderQueryEvent.fetch(
            pageOptions: PageOptions.emptyNoLimit(),
          ),
        ),
      builder: (context, state) {
        return LightButtonSmall(
          action: DataAction.exportExcel,
          permission: PermissionPurchaseOrder.purchaseOrderExportExcel,
          status: state.maybeWhen(
            loading: (_) => Status.progress,
            loaded: (_) => Status.loaded,
            orElse: () => Status.error,
          ),
          onPressed: () async {
            state.maybeWhen(
              orElse: () {},
              error: (error) => Toast(context).fail(error),
              loaded: (purchaseOrder) {
                final bytes = excelPurchaseOrder(purchaseOrder.data);
                saveFile(bytes, 'Purchase_Order_Report.xlsx');
              },
            );
          },
        );
      },
    );
  }
}
