import 'package:flexurio_chiron_product/src/app/bloc/product_formulation_detail_query/product_formulation_detail_query_bloc.dart';
import 'package:flexurio_chiron_product/src/app/bloc/product_formulation_query/product_formulation_query_bloc.dart';
import 'package:flexurio_chiron_product/src/app/view/page/product_formulation/widget/bill_of_material_data_table.dart';
import 'package:flexurio_chiron_product/src/app/view/page/product_formulation/widget/product_formulation_data_table.dart';
import 'package:flutter/material.dart';

class ProductFormulationsDataTable extends StatelessWidget {
  const ProductFormulationsDataTable({
    required this.isFiltered,
    required this.formulationQueryBloc,
    required this.formulationDetailQueryBloc,
    required this.onRefresh,
    required this.isExternal,
    super.key,
  });

  final bool isFiltered;
  final ProductFormulationQueryBloc formulationQueryBloc;
  final ProductFormulationDetailQueryBloc formulationDetailQueryBloc;
  final void Function() onRefresh;
  final bool isExternal;

  @override
  Widget build(BuildContext context) {
    final Widget dataTable;
    if (!isFiltered) {
      dataTable = SizedBox(
        width: MediaQuery.of(context).size.width,
        child: BillOfMaterialDataTable(
          queryBloc: formulationQueryBloc,
          isExternal: isExternal,
        ),
      );
    } else {
      dataTable = SizedBox(
        width: MediaQuery.of(context).size.width,
        child: ProductFormulationDataTable(
          onRefresh: onRefresh,
          formulationDetailQueryBloc: formulationDetailQueryBloc,
          isExternal: isExternal,
        ),
      );
    }
    return dataTable;
  }
}
