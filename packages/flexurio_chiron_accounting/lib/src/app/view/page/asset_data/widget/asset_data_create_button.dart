import 'package:flexurio_chiron_accounting/src/app/bloc/asset_data_query/asset_data_query_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/asset_data/widget/asset_data_create_page.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AssetDataCreateButton extends StatelessWidget {
  const AssetDataCreateButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Button(
      permission: Permission.assetDataCreate,
      action: DataAction.create,
      onPressed: () async {
        final queryBloc = context.read<AssetDataQueryBloc>();
        final event = AssetDataQueryEvent.fetch();
        final success = await Navigator.push(
          context,
          AssetDataCreatePage.route(),
        );
        if (success ?? false) {
          queryBloc.add(event);
        }
      },
    );
  }
}
