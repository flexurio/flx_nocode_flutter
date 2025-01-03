import 'package:flexurio_chiron_material_stock/src/app/bloc/material_return/material_return_bloc.dart';
import 'package:flexurio_chiron_material_stock/src/app/model/material_return.dart';
import 'package:flexurio_chiron_material_stock/src/app/view/page/material_return_create/widget/dropdown_material_return_type.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MaterialReturnCreateTypeForm extends StatefulWidget {
  const MaterialReturnCreateTypeForm({
    required this.onNext,
    required this.onDropDownChanged,
    this.materialReturnType,
    super.key,
  });

  final void Function() onNext;
  final void Function(MaterialReturnType) onDropDownChanged;
  final MaterialReturnType? materialReturnType;

  @override
  State<MaterialReturnCreateTypeForm> createState() =>
      _MaterialReturnCreateTypeFormState();
}

class _MaterialReturnCreateTypeFormState
    extends State<MaterialReturnCreateTypeForm> {
  final _formKey = GlobalKey<FormState>();
  MaterialReturnType? _materialReturnType;

  @override
  Widget build(BuildContext context) {
    return FormAction(
      formKey: _formKey,
      actions: [
        Button(
          permission: null,
          action: DataAction.next,
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              final form = MaterialReturnFormType(
                type: _materialReturnType!,
              );

              context.read<MaterialReturnBloc>().add(
                    MaterialReturnEvent.createFormType(form),
                  );

              widget.onNext();
            }
          },
        ),
      ],
      children: [
        FDropDownSearchMaterialReturnType(
          list: const [
            MaterialReturnType.returnX,
            MaterialReturnType.adjustment,
          ],
          initialValue: _materialReturnType,
          onChanged: (materialReturnType) {
            if (materialReturnType != null) {
              _materialReturnType = materialReturnType;
              widget.onDropDownChanged(materialReturnType);
            }
          },
        ),
      ],
    );
  }
}
