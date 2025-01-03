import 'package:flexurio_chiron_vendor/src/app/bloc/material_supplier_query/material_supplier_query_bloc.dart';
import 'package:appointment/src/app/util/picker_file.dart';
import 'package:flexurio_chiron_material/src/app/view/page/material/util/excel_material_lead_time.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class MaterialLeadTimeExportExcelButton extends StatelessWidget {
  const MaterialLeadTimeExportExcelButton._();
  static Widget prepare() {
    return BlocProvider(
      create: (_) => MaterialSupplierQueryBloc(),
      child: const MaterialLeadTimeExportExcelButton._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocListener<MaterialSupplierQueryBloc, MaterialSupplierQueryState>(
      listener: (context, state) {
        state.maybeWhen(
          loaded: (supplier, materialSuppliers) {
            final bytes = excelMaterialLeadTime(materialSuppliers);
            final format = DateFormat(DateFormat.YEAR_NUM_MONTH_DAY);
            final date = DateTime.now();
            final dateNow = format.format(date);
            saveFile(
              bytes,
              'Material_LeadTime_$dateNow.xlsx'.replaceAll('/', '-'),
            );
          },
          orElse: () {},
        );
      },
      child: BlocBuilder<MaterialSupplierQueryBloc, MaterialSupplierQueryState>(
        builder: (context, state) {
          final isProgress =
              state.maybeWhen(orElse: () => false, loading: () => true);
          return Button(
            permission: Permission.materialLeadTimeEdit,
            action: DataAction.edit,
            color: theme.colorScheme.primary,
            onPressed: isProgress
                ? null
                : () async {
                    context.read<MaterialSupplierQueryBloc>().add(
                          const MaterialSupplierQueryEvent.getByMaterialId(),
                        );
                  },
          );
        },
      ),
    );
  }
}
