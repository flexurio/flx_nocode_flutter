import 'package:flexurio_chiron_material/src/app/bloc/unit_convert/unit_convert_bloc.dart';
import 'package:flexurio_chiron_material/src/app/bloc/unit_convert_query/unit_convert_query_bloc.dart';
import 'package:flexurio_chiron_material/src/app/model/unit_convert.dart';
import 'package:flexurio_chiron_material/src/app/model/material_unit.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UnitConvertDeleteButton extends StatelessWidget {
  const UnitConvertDeleteButton({required this.unitConvert, super.key});

  final UnitConvert unitConvert;

  static Widget prepare({
    required UnitConvert unitConvert,
  }) {
    return BlocProvider(
      create: (context) => UnitConvertBloc(),
      child: UnitConvertDeleteButton(
        unitConvert: unitConvert,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return IconButtonSmall(
      onPressed: () async {
        final bloc = context.read<UnitConvertBloc>();
        final queryBloc = context.read<UnitConvertQueryBloc>();
        final success = await _showDeleteDialog(context, bloc);
        if (success ?? false) {
          queryBloc.add(
            UnitConvertQueryEvent.fetch(
              unitFrom: unitConvert.materialUnit,
              unitTo: MaterialUnit.empty(),
            ),
          );
        }
      },
      action: DataAction.delete,
      permission: Permission.unitConvertDelete,
    );
  }

  Future<bool?> _showDeleteDialog(
    BuildContext context,
    UnitConvertBloc bloc,
  ) {
    const action = DataAction.delete;
    final entity = Entity.unitConvert;
    return showDialog<bool?>(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return BlocListener<UnitConvertBloc, UnitConvertState>(
          bloc: bloc,
          listener: (context, state) {
            state.maybeWhen(
              success: () {
                Toast(context).dataChanged(action, entity);
                Navigator.pop(context, true);
              },
              error: (error) => Toast(context).fail(error),
              orElse: () {},
            );
          },
          child: BlocBuilder<UnitConvertBloc, UnitConvertState>(
            bloc: bloc,
            builder: (context, state) {
              final isInProgress = state.maybeWhen(
                orElse: () => false,
                loading: () => true,
              );
              return CardConfirmation(
                isProgress: isInProgress,
                action: action,
                data: entity,
                label: unitConvert.materialUnit.id,
                onConfirm: () {
                  bloc.add(UnitConvertEvent.delete(id: unitConvert.id));
                },
              );
            },
          ),
        );
      },
    );
  }
}
