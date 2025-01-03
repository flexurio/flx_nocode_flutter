import 'package:flexurio_chiron_production/flexurio_chiron_production.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScheduleDetailValidateButton extends StatelessWidget {
  const ScheduleDetailValidateButton({
    required this.scheduleDetail,
    required this.isExternal, super.key,
  });
  final bool isExternal;

  static Widget prepare({
    required ScheduleDetail scheduleDetail,
    required bool isExternal,
  }) {
    return BlocProvider(
      create: (context) => ScheduleDetailBloc(
        isExternal: isExternal,
      ),
      child: ScheduleDetailValidateButton(
        scheduleDetail: scheduleDetail,
        isExternal: isExternal,
      ),
    );
  }

  final ScheduleDetail scheduleDetail;

  @override
  Widget build(BuildContext context) {
    const action = DataAction.validate;
    return IconButtonSmall(
      action: action,
      permission:
          PermissionProduction.scheduleDetailValidate(isExternal: isExternal),
      onPressed: () async {
        final bloc = context.read<ScheduleDetailBloc>();
        final queryBloc = context.read<ScheduleDetailQueryBloc>();
        final success = await _showValidateDialog(
          context: context,
          bloc: bloc,
          action: action,
        );
        if (success ?? false) {
          queryBloc.add(
            ScheduleDetailQueryEvent.fetch(
              scheduleDetail.scheduleId,
            ),
          );
        }
      },
    );
  }

  Future<bool?> _showValidateDialog({
    required BuildContext context,
    required ScheduleDetailBloc bloc,
    required DataAction action,
  }) {
    final entity = Entity.scheduleDetail;
    return showDialog<bool?>(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return BlocListener<ScheduleDetailBloc, ScheduleDetailBlocState>(
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
          child: BlocBuilder<ScheduleDetailBloc, ScheduleDetailBlocState>(
            bloc: bloc,
            builder: (context, state) {
              final isInProgress = state.maybeWhen(
                loading: () => true,
                orElse: () => false,
              );
              return CardConfirmation(
                isProgress: isInProgress,
                action: action,
                data: entity,
                onConfirm: () {
                  bloc.add(ScheduleDetailBlocEvent.validate(scheduleDetail));
                },
              );
            },
          ),
        );
      },
    );
  }
}
