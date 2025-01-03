import 'package:appointment/src/app/view/widget/drop_down_items/drop_down_object.dart';
import 'package:flexurio_chiron_material_stock/src/app/bloc/material_stock_query/material_stock_query_bloc.dart';
import 'package:flexurio_chiron_material_stock/src/app/model/material_stock.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FDropDownSearchMaterialStockNa extends StatelessWidget
    implements DropDownObject<MaterialStock> {
  const FDropDownSearchMaterialStockNa({
    required this.onChanged,
    this.initialValue,
    super.key,
    this.isRequired = true,
    this.label,
    this.enabled = true,
    this.materialStock,
  });

  final MaterialStock? materialStock;

  @override
  final void Function(MaterialStock?) onChanged;

  @override
  final bool isRequired;

  @override
  final String? label;

  @override
  final bool enabled;

  @override
  final MaterialStock? initialValue;

  @override
  Widget build(BuildContext context) {
    String? Function(MaterialStock?)? validator;
    if (isRequired) {
      validator = requiredObjectValidator.call;
    }
    return BlocBuilder<MaterialStockQueryBloc, MaterialStockQueryState>(
      builder: (context, state) {
        return FDropDownSearch<MaterialStock>(
          enabled: enabled,
          labelText: label ?? 'NA',
          onChanged: onChanged,
          initialValue: initialValue,
          validator: validator,
          itemAsString: (materialStock) =>
              materialStock.na,
          status: state.maybeWhen(
            orElse: () => Status.loaded,
            loading: (_) => Status.progress,
            error: (_) => Status.error,
          ),
          items: state.maybeWhen(
            orElse: () => [],
            loaded: (pageOptions) => List.from(pageOptions.data)
              ..sort((a, b) => a.material.name.compareTo(b.material.name)),
          ),
        );
      },
    );
  }

  @override
  // TODO: implement small
  bool get small => throw UnimplementedError();
}
