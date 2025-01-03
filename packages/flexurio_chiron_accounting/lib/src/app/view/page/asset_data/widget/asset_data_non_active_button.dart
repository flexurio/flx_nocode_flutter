import 'package:flexurio_chiron_accounting/src/app/bloc/asset_data/asset_data_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/bloc/asset_data_query/asset_data_query_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/model/asset_data.dart';
import 'package:flexurio_chiron_accounting/src/app/model/entity.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AssetDataNonActiveButton extends StatelessWidget {
  const AssetDataNonActiveButton._({
    required this.assetData,
  });

  static Widget prepare(AssetData assetData) {
    return BlocProvider(
      create: (context) => AssetDataBloc(),
      child: AssetDataNonActiveButton._(assetData: assetData),
    );
  }

  final AssetData assetData;

  @override
  Widget build(BuildContext context) {
    const action = DataAction.notActive;
    return IconButtonSmall(
      permission: Permission.assetDataNonActive,
      action: action,
      onPressed: () async {
        final bloc = context.read<AssetDataBloc>();
        final queryBloc = context.read<AssetDataQueryBloc>();
        final success = await _showDialog(
          bloc: bloc,
          context: context,
          action: action,
        );
        if (success ?? false) {
          queryBloc.add(AssetDataQueryEvent.fetch());
        }
      },
    );
  }

  Future<bool?> _showDialog({
    required BuildContext context,
    required AssetDataBloc bloc,
    required DataAction action,
  }) {
    final entity = EntityAccounting.assetData;
    return showDialog<bool?>(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return BlocListener<AssetDataBloc, AssetDataState>(
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
          child: BlocBuilder<AssetDataBloc, AssetDataState>(
            bloc: bloc,
            builder: (context, state) {
              final isInProgress = state.maybeWhen(
                loading: () => true,
                orElse: () => false,
              );
              return CardConfirmationWithExplanation(
                isProgress: isInProgress,
                action: action,
                data: entity,
                label: assetData.id,
                onConfirm: (explanation) {
                  bloc.add(
                    AssetDataEvent.nonActive(
                      assetData: assetData,
                      note: explanation,
                    ),
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}
