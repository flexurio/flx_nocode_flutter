import 'package:flexurio_chiron_accounting/src/app/bloc/asset_type_query/asset_type_query_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/asset_type/widget/asset_type_create_page.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AssetTypeCreateButton extends StatelessWidget {
  const AssetTypeCreateButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Button(
      permission: Permission.assetTypeCreate,
      action: DataAction.create,
      onPressed: () async {
        final queryBloc = context.read<AssetTypeQueryBloc>();
        final event = AssetTypeQueryEvent.fetch();
        final success = await Navigator.push(
          context,
          AssetTypeCreatePage.route(),
        );
        if (success ?? false) {
          queryBloc.add(event);
        }
      },
    );
  }
}
