import 'package:appointment/src/app/util/picker_file.dart';
import 'package:flexurio_chiron_purchase_order/src/app/bloc/purchase_order_outstanding_product_query/purchase_order_outstanding_product_query_bloc.dart';
import 'package:flexurio_chiron_purchase_order/src/app/model/purchase_order_outstanding_product.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PurchaseOrderOutstandingProductExportExcelButton extends StatefulWidget {
  const PurchaseOrderOutstandingProductExportExcelButton({super.key});

  @override
  State<PurchaseOrderOutstandingProductExportExcelButton> createState() => _PurchaseOrderOutstandingProductExportExcelButtonState();
}

class _PurchaseOrderOutstandingProductExportExcelButtonState extends State<PurchaseOrderOutstandingProductExportExcelButton> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PurchaseOrderOutstandingProductQueryBloc, PurchaseOrderOutstandingProductQueryState>(
      bloc: PurchaseOrderOutstandingProductQueryBloc()..add(
        PurchaseOrderOutstandingProductQueryEvent.fetch(
          pageOptions: PageOptions.emptyNoLimit(),
        ),
      ),
      builder: (context, state) {
        return LightButtonSmall(
          action: DataAction.exportExcel,
          permission: null,
          status: state.maybeWhen(
            loading: (_) => Status.progress,
            loaded: (_) => Status.loaded,
            orElse: () => Status.error,
          ),
          onPressed: () async {
            state.maybeWhen(
              orElse: () {},
              error: (error) => Toast(context).fail(error),
              loaded: (purchaseOrderOutstandingProduct) {
                final bytes = simpleExcel<PurchaseOrderOutstandingProduct>(
                  context: context,
                  data: purchaseOrderOutstandingProduct.data,
                  columns: [
                    // TColumn(
                    //   title: 'Status MR'.tr(),
                    //   numeric: true,
                    //   builder: (data, index) => data.purchaseOrderStatus,
                    // ),
                  ],
                );
                saveFile(bytes, 'Report_Outstanding_Purchase_Order_Product.xlsx');
              },
            );
          },
        );
      },
    );
  }
}
