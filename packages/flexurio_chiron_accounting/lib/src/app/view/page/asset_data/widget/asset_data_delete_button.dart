import 'package:flexurio_chiron_accounting/src/app/bloc/asset_data/asset_data_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/bloc/asset_data_query/asset_data_query_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/model/asset_data.dart';
import 'package:flexurio_chiron_accounting/src/app/model/entity.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AssetDataDeleteButton extends StatelessWidget {
  const AssetDataDeleteButton._({
    required this.assetData,
  });

  static Widget prepare({
    required AssetData assetData,
  }) {
    return BlocProvider(
      create: (context) => AssetDataBloc(),
      child: AssetDataDeleteButton._(
        assetData: assetData,
      ),
    );
  }

  final AssetData assetData;

  @override
  Widget build(BuildContext context) {
    const action = DataAction.delete;
    final entity = EntityAccounting.assetData;
    return IconButtonSmall(
      permission: Permission.assetDataDelete,
      action: action,
      onPressed: () {
        final bloc = context.read<AssetDataBloc>();
        final queryBloc = context.read<AssetDataQueryBloc>();
        _showDeleteDialog(context, bloc).then(
          (value) {
            if (value ?? false) {
              queryBloc.add(AssetDataQueryEvent.fetch());
            }
            return () {
              Toast(context).dataChanged(action, entity);
              Navigator.pop(context, true);
            };
          },
        );
      },
    );
  }

  Future<bool?> _showDeleteDialog(
    BuildContext context,
    AssetDataBloc bloc,
  ) {
    const action = DataAction.delete;
    final entity = EntityAccounting.assetData;
    return showDialog(
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
              return CardConfirmation(
                isProgress: isInProgress,
                action: action,
                data: entity,
                label: assetData.assetName,
                onConfirm: () {
                  bloc.add(
                    AssetDataEvent.delete(
                      id: assetData.id,
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
