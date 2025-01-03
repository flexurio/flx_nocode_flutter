import 'package:flexurio_chiron_material/src/app/bloc/material_design_query/material_design_query_bloc.dart';
import 'package:appointment/src/app/util/picker_file.dart';
import 'package:flexurio_chiron_material/src/app/view/page/material_design/util/report_excel.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MaterialDesignExportExcelButton extends StatelessWidget {
  const MaterialDesignExportExcelButton({super.key, required this.isExternal});
  final bool isExternal;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MaterialDesignQueryBloc, MaterialDesignQueryState>(
      bloc: MaterialDesignQueryBloc(isExternal: isExternal)
        ..add(
          MaterialDesignQueryEvent.fetch(
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
              loaded: (materialDesign) {
                final bytes = excelMaterialDesign(materialDesign.data);
                saveFile(bytes, 'Material_Design_Report.xlsx');
              },
            );
          },
        );
      },
    );
  }
}
