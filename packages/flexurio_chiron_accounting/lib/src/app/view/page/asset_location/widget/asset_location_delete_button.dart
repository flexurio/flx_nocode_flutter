import 'package:flexurio_chiron_accounting/src/app/bloc/asset_location/asset_location_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/bloc/asset_location_query/asset_location_query_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/model/asset_location.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AssetLocationDeleteButton extends StatelessWidget {
  const AssetLocationDeleteButton({
    required this.assetLocation,
    super.key,
  });

  static Widget prepare({
    required AssetLocation assetLocation,
  }) {
    return BlocProvider(
      create: (context) => AssetLocationBloc(),
      child: AssetLocationDeleteButton(
        assetLocation: assetLocation,
      ),
    );
  }

  final AssetLocation assetLocation;

  @override
  Widget build(BuildContext context) {
    const action = DataAction.delete;
    final entity = Entity.assetLocation;
    return IconButtonSmall(
      permission: Permission.assetLocationDelete,
      action: action,
      onPressed: () {
        final bloc = context.read<AssetLocationBloc>();
        final queryBloc = context.read<AssetLocationQueryBloc>();
        _showDeleteDialog(context, bloc).then(
          (value) {
            if (value ?? false) {
              queryBloc.add(AssetLocationQueryEvent.fetch());
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
    AssetLocationBloc bloc,
  ) {
    const action = DataAction.delete;
    final entity = Entity.assetLocation;
    return showDialog(
      context: context,
      builder: (context) {
        return BlocListener<AssetLocationBloc, AssetLocationState>(
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
          child: BlocBuilder<AssetLocationBloc, AssetLocationState>(
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
                label: assetLocation.locationName,
                onConfirm: () {
                  bloc.add(
                    AssetLocationEvent.delete(
                      id: assetLocation.id,
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
