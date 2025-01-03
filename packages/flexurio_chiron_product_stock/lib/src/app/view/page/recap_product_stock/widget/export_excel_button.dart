import 'package:flexurio_chiron_product_stock/flexurio_chiron_product_stock.dart';
import 'package:appointment/src/app/util/picker_file.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecapProductStockExportExcelButton extends StatelessWidget {
  const RecapProductStockExportExcelButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecapProductStockQueryBloc, RecapProductStockQueryState>(
      builder: (context, state) {
        return state.maybeWhen(
          orElse: SizedBox.new,
          loaded: (recapProductStocks) {
            return Visibility(
              visible: recapProductStocks.isNotEmpty,
              child: Button(
                permission: PermissionProductStock.productStockRecapExportExcel,
                action: DataAction.exportExcel,
                onPressed: () async {
                  final bytes = excelRecapProductStock(recapProductStocks);
                  saveFile(bytes, 'Recap Product Stock Report.xlsx');
                },
              ),
            );
          },
        );
      },
    );
  }
}
