import 'package:flexurio_chiron_product/src/app/model/product_formulation_detail.dart';
import 'package:flexurio_chiron_material/src/app/bloc/material_query/material_query_bloc.dart';
import 'package:flexurio_chiron_material/src/app/model/material.dart' as model;
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';

class RndFormulationRow extends StatefulWidget {
  const RndFormulationRow({
    required this.index,
    required this.productFormulationDetailTemporary,
    super.key,
  });
  final int index;
  final ProductFormulationDetailTemporary productFormulationDetailTemporary;

  @override
  State<RndFormulationRow> createState() => _RndFormulationRowState();
}

class _RndFormulationRowState extends State<RndFormulationRow> {
  final _quantityController = TextEditingController();
  final _requiredObjectValidator = RequiredObjectValidator<dynamic>(
    errorText: pleaseFillOutThisField.tr(),
  );

  void _update({model.Material? material, int? quantity}) {
    // context.read<ProductFormulationDetailBloc>().add(
    //       ProductFormulationDetailEvent.update(
    //         widget.index,
    //         widget.productFormulationDetailTemporary.copyWith(
    //           id: widget.productFormulationDetailTemporary.id,
    //           material: material,
    //           quantity: quantity,
    //         ),
    //       ),
    //     );
  }

  @override
  void initState() {
    super.initState();
    _quantityController.text =
        widget.productFormulationDetailTemporary.quantity.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BlocBuilder<MaterialQueryBloc, MaterialQueryState>(
          builder: (context, state) {
            return SizedBox(
              width: 250,
              child: FDropDownSearch<model.Material>(
                labelText: 'Material',
                validator: _requiredObjectValidator.call,
                status: state.maybeWhen(
                  error: (_) => Status.error,
                  loading: (_) => Status.progress,
                  orElse: () => Status.loaded,
                ),
                items: state.maybeWhen(
                  orElse: () => [],
                  loaded: (material) => material.data,
                ),
                onChanged: (material) {
                  _update(
                    material: material,
                  );
                },
                enabled: false,
                initialValue: widget.productFormulationDetailTemporary.material,
                itemAsString: (material) => material.name,
              ),
            );
          },
        ),
        const SizedBox(width: 50),
        SizedBox(
          width: 200,
          child: FTextFormField(
            validator: requiredValidator.call,
            labelText: 'Quantity',
            suffixIcon: SizedBox(
              width: 25,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Unit',
                  style: TextStyle(
                    color: Colors.grey.shade300,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            controller: _quantityController,
            enabled: false,
            onChanged: (value) {
              _update(
                quantity: int.parse(value),
              );
            },
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
