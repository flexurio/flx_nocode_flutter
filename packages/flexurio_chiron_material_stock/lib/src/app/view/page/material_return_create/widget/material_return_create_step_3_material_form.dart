import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_material_stock/src/app/bloc/material_return/material_return_bloc.dart';
import 'package:flexurio_chiron_material_stock/src/app/model/material_return.dart';
import 'package:flexurio_chiron_material_stock/src/app/model/material_return_detail.dart';
import 'package:flexurio_chiron_material_stock/src/app/view/page/material_return_create/widget/add_material_button.dart';
import 'package:flexurio_chiron_material_stock/src/app/view/page/material_return_create/widget/detail_data_table.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MaterialReturnCreateMaterialForm extends StatefulWidget {
  const MaterialReturnCreateMaterialForm({
    required this.onNext,
    required this.onPrevious,
    required this.action,
    required this.isExternal,
    this.materialReturnType,
    super.key,
  });

  final void Function() onNext;
  final void Function() onPrevious;
  final DataAction action;
  final MaterialReturnType? materialReturnType;
  final bool isExternal;

  @override
  State<MaterialReturnCreateMaterialForm> createState() =>
      _MaterialReturnCreateMaterialFormState();
}

class _MaterialReturnCreateMaterialFormState
    extends State<MaterialReturnCreateMaterialForm> {
  final _formKey = GlobalKey<FormState>();

  void _submit(BuildContext context, List<MaterialReturnDetail>? materials) {
    if (materials!.isNotEmpty) {
      widget.onNext();
      return;
    }
    Toast(context).fail(ErrorMessage.requiredAtLeastOne('material'.tr()));
  }

  @override
  Widget build(BuildContext context) {
    return FormAction(
      formKey: _formKey,
      actions: [
        _buildButtonPrevious(),
        const SizedBox(width: 12),
        _buildButtonNext(),
      ],
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            if (widget.materialReturnType != null)
              AddMaterialButton(materialReturnType: widget.materialReturnType!),
          ],
        ),
        const SizedBox(height: 24),
        MaterialReturnDetailDataTable(
          isExternal: widget.isExternal,
          canRemove: true,
          action: widget.action,
        ),
      ],
    );
  }

  Widget _buildButtonPrevious() {
    return Button(
      permission: null,
      isSecondary: true,
      action: DataAction.back,
      onPressed: () {
        widget.onPrevious();
      },
    );
  }

  Widget _buildButtonNext() {
    return BlocBuilder<MaterialReturnBloc, MaterialReturnState>(
      builder: (context, state) {
        return state.maybeWhen(
          orElse: Container.new,
          initial: (materials, materialReturnFormProduct) {
            return Button(
              permission: null,
              action: DataAction.next,
              onPressed: () {
                _submit(context, materials);
              },
            );
          },
        );
      },
    );
  }
}
