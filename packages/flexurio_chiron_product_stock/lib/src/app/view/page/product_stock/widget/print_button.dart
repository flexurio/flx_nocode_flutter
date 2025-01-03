import 'package:appointment/src/app/util/picker_file.dart';
import 'package:flexurio_chiron_product_stock/flexurio_chiron_product_stock.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PrintButton extends StatelessWidget {
  const PrintButton({super.key, this.isFab = false});
  final bool isFab;

  @override
  Widget build(BuildContext context) {
    const action = DataAction.exportExcel;
    return BlocBuilder<ProductStockQueryBloc, ProductStockQueryState>(
      builder: (context, state) {
        return state.maybeWhen(
          orElse: SizedBox.new,
          loaded: (productStocks) {
            Future<void> printExcel() async {
              final bytes = excelProductStock(productStocks);
              saveFile(bytes, 'Product Stock Report.xlsx');
            }

            return Visibility(
              visible: productStocks.isNotEmpty,
              child: isFab
                  ? FabMini(action: action, onPressed: printExcel)
                  : Button(
                      permission: PermissionProductStock.productStockPrint,
                      action: action,
                      onPressed: printExcel,
                    ),
            );
          },
        );
      },
    );
  }
}
