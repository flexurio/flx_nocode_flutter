import 'package:flexurio_chiron_accounting/flexurio_chiron_accounting.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AssetJournalDepreciationCreateButton extends StatelessWidget {
  const AssetJournalDepreciationCreateButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Button.small(
      action: DataAction.create,
      permission: PermissionAccounting.assetJournalDepreciationCreate,
      onPressed: () async {
        final queryBloc = context.read<AssetJournalDepreciationQueryBloc>();
        final event = AssetJournalDepreciationQueryEvent.fetch();
        final success = await Navigator.push(
          context,
          AssetJournalDepreciationCreatePage.route(),
        );
        if (success ?? false) {
          queryBloc.add(event);
        }
      },
    );
  }
}
