import 'package:flexurio_chiron_accounting/src/app/bloc/asset_type/asset_type_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/bloc/asset_type_query/asset_type_query_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/model/asset_type.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AssetTypeDeleteButton extends StatelessWidget {
  const AssetTypeDeleteButton({
    required this.assetType,
    super.key,
  });

  static Widget prepare({
    required AssetType assetType,
  }) {
    return BlocProvider(
      create: (context) => AssetTypeBloc(),
      child: AssetTypeDeleteButton(
        assetType: assetType,
      ),
    );
  }

  final AssetType assetType;

  @override
  Widget build(BuildContext context) {
    const action = DataAction.delete;
    final entity = Entity.assetType;
    return IconButtonSmall(
      permission: Permission.assetTypeDelete,
      action: action,
      onPressed: () {
        final bloc = context.read<AssetTypeBloc>();
        final queryBloc = context.read<AssetTypeQueryBloc>();
        _showDeleteDialog(context, bloc).then(
          (value) {
            if (value ?? false) {
              queryBloc.add(AssetTypeQueryEvent.fetch());
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
    AssetTypeBloc bloc,
  ) {
    const action = DataAction.delete;
    final entity = Entity.assetType;
    return showDialog(
      context: context,
      builder: (context) {
        return BlocListener<AssetTypeBloc, AssetTypeState>(
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
          child: BlocBuilder<AssetTypeBloc, AssetTypeState>(
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
                label: assetType.name,
                onConfirm: () {
                  bloc.add(
                    AssetTypeEvent.delete(
                      id: assetType.id,
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
