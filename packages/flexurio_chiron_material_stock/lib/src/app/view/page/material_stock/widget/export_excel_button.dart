import 'package:appointment/src/app/util/picker_file.dart';
import 'package:flexurio_chiron_material/src/app/bloc/material_group_query/material_group_query_bloc.dart';
import 'package:flexurio_chiron_material/src/app/bloc/material_query/material_query_bloc.dart';
import 'package:flexurio_chiron_material_stock/flexurio_chiron_material_stock.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExportExcelButton extends StatelessWidget {
  const ExportExcelButton({
    required this.isExternal,
    super.key,
  });
  final bool isExternal;

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    return BlocProvider(
      create: (context) => MaterialStockQueryBloc(isExternal: isExternal)
        ..add(MaterialStockQueryEvent.fetch(
            pageOptions: PageOptions.emptyNoLimit())),
      child: BlocBuilder<MaterialStockQueryBloc, MaterialStockQueryState>(
        builder: (context, state) {
          final data = state.maybeWhen(
            orElse: () => <MaterialStock>[],
            loaded: (page) => page.data,
          );
          return LightButtonSmall(
            permission: PermissionMaterialStock.materialStockExportExcel(
                isExternal: isExternal),
            action: DataAction.exportExcel,
            onPressed: () async {
              final bytes = excelMaterialStock(data);
              saveFile(bytes, 'MATERIAL_STOCK_${now.yMMMM}.xlsx');
            },
          );
        },
      ),
    );
  }
}

class ExportExcelFloatingActionButton extends StatelessWidget {
  const ExportExcelFloatingActionButton({
    required this.materialStockBloc,
    required this.materialGroupBloc,
    required this.materialBloc,
    super.key,
  });

  final MaterialStockQueryBloc materialStockBloc;
  final MaterialGroupQueryBloc materialGroupBloc;
  final MaterialQueryBloc materialBloc;

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    return BlocBuilder<MaterialStockQueryBloc, MaterialStockQueryState>(
      bloc: materialStockBloc,
      builder: (context, state) {
        return state.maybeWhen(
          orElse: SizedBox.new,
          loaded: (pageOptions) {
            return Visibility(
              visible: pageOptions.data.isNotEmpty,
              child: FloatingActionButton(
                // action: DataAction.exportExcel,
                // backgroundColor: colorScheme.secondary,
                child: const Icon(FontAwesomeIcons.fileExcel),
                onPressed: () async {
                  final bytes = excelMaterialStock(pageOptions.data);
                  saveFile(bytes, 'MATERIAL_STOCK_${now.yMMMM}.xlsx');
                },
              ),
            );
          },
        );
      },
    );
  }
}
