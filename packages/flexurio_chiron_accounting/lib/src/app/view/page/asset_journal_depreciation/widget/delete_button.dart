import 'package:flexurio_chiron_accounting/flexurio_chiron_accounting.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AssetJournalDepreciationDeleteButton extends StatelessWidget {
  const AssetJournalDepreciationDeleteButton({
    required this.assetJournalDepreciation,
    super.key,
  });

  final AssetJournalDepreciation assetJournalDepreciation;

  static Widget prepare({
    required AssetJournalDepreciation assetJournalDepreciation,
  }) {
    return BlocProvider(
      create: (context) => AssetJournalDepreciationBloc(),
      child: AssetJournalDepreciationDeleteButton(
        assetJournalDepreciation: assetJournalDepreciation,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const action = DataAction.delete;
    return IconButtonSmall(
      permission: PermissionAccounting.assetJournalDepreciationDelete,
      action: action,
      onPressed: () async {
        final bloc = context.read<AssetJournalDepreciationBloc>();
        final queryBloc = context.read<AssetJournalDepreciationQueryBloc>();
        await _showDeleteDialog(
          context: context,
          bloc: bloc,
          action: action,
        ).then((value) {
          if (value ?? false) {
            queryBloc.add(AssetJournalDepreciationQueryEvent.fetch());
          }
        });
      },
    );
  }

  Future<bool?> _showDeleteDialog({
    required BuildContext context,
    required AssetJournalDepreciationBloc bloc,
    required DataAction action,
  }) {
    final entity = EntityAccounting.assetJournalDepreciation;
    return showDialog<bool?>(
      context: context,
      builder: (context) {
        return BlocListener<AssetJournalDepreciationBloc,
            AssetJournalDepreciationState>(
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
          child: BlocBuilder<AssetJournalDepreciationBloc,
              AssetJournalDepreciationState>(
            bloc: bloc,
            builder: (context, state) {
              return CardConfirmation(
                isProgress: state.maybeWhen(
                  orElse: () => false,
                  loading: () => true,
                ),
                action: action,
                data: entity,
                label: assetJournalDepreciation.transactionId,
                onConfirm: () => bloc.add(
                  AssetJournalDepreciationEvent.delete(
                    assetJournalDepreciation: assetJournalDepreciation,
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
