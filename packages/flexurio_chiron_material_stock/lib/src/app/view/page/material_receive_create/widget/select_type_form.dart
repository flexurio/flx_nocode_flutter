import 'package:flexurio_chiron_material_stock/src/app/bloc/material_receive/material_receive_bloc.dart';
import 'package:flexurio_chiron_material_stock/src/app/model/material_receive.dart';

import 'package:appointment/src/app/view/widget/select_field_chip.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MaterialReceiveCreateSelectTypeForm extends StatefulWidget {
  const MaterialReceiveCreateSelectTypeForm({
    required this.onNext,
    required this.onDropDownChanged,
    required this.createType,
    super.key,
  });

  final void Function() onNext;
  final void Function(MaterialReceiveType) onDropDownChanged;
  final MaterialReceiveType createType;

  @override
  State<MaterialReceiveCreateSelectTypeForm> createState() =>
      _MaterialReceiveCreateSelectTypeFormState();
}

class _MaterialReceiveCreateSelectTypeFormState
    extends State<MaterialReceiveCreateSelectTypeForm> {
  late MaterialReceiveType _type;
  final _typeController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _mutation = false;

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
              final form = MaterialReceiveCreateTypeForm(
                type: _type,
                mutation: _mutation,
              );
              context
                  .read<MaterialReceiveBloc>()
                  .add(MaterialReceiveEvent.createType(form));
              widget.onNext();
            }
          },
        ),
      ],
      children: [
        SelectChipField<MaterialReceiveType>(
          label: 'type'.tr(),
          getLabel: (type) => type.title,
          controller: _typeController,
          validator: requiredValidator.call,
          options: MaterialReceiveType.list,
          onChanged: (value) {
            _type = value;
            widget.onDropDownChanged(value);
          },
        ),
        // const Gap(24),
        // CheckboxWithText(
        //   initialValue: _mutation,
        //   text: 'Mutation',
        //   onChanged: (value) {
        //     setState(() {
        //       _mutation = value;
        //     });
        //   },
        // ),
      ],
    );
  }
}
