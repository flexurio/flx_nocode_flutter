import 'package:flexurio_chiron_product/src/app/bloc/product_formulation_detail_query/product_formulation_detail_query_bloc.dart';
import 'package:appointment/src/app/util/picker_file.dart';
import 'package:flexurio_chiron_product/src/app/model/permission.dart';
import 'package:flexurio_chiron_product/src/app/view/page/product_formulation/util/excel_bill_of_material.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BillOfMaterialExportExcelButton extends StatelessWidget {
  const BillOfMaterialExportExcelButton({super.key, required this.isExternal});

  final bool isExternal;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductFormulationDetailQueryBloc,
        ProductFormulationDetailQueryState>(
      bloc: ProductFormulationDetailQueryBloc(isExternal: isExternal)
        ..add(const ProductFormulationDetailQueryEvent.fetch()),
      builder: (context, state) {
        return LightButtonSmall(
          action: DataAction.exportExcel,
          permission: PermissionProduct.productFormulationExportExcel(isExternal: isExternal),
          status: state.maybeWhen(
            loading: () => Status.progress,
            loaded: (_) => Status.loaded,
            orElse: () => Status.error,
          ),
          onPressed: () {
            state.maybeWhen(
              orElse: SizedBox.shrink,
              loaded: (formulations) {
                final bytes = excelBillOfMaterial(formulations);
                saveFile(bytes, 'Bill_of_Material_Report.xlsx');
              },
            );
          },
        );
      },
    );
  }
}
