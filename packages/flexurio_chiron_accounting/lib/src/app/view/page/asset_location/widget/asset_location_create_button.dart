import 'package:flexurio_chiron_accounting/src/app/bloc/asset_location_query/asset_location_query_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/asset_location/widget/asset_location_create_page.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AssetLocationCreateButton extends StatelessWidget {
  const AssetLocationCreateButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Button(
      permission: Permission.assetLocationCreate,
      action: DataAction.create,
      onPressed: () async {
        final queryBloc = context.read<AssetLocationQueryBloc>();
        final event = AssetLocationQueryEvent.fetch();
        final success = await Navigator.push(
          context,
          AssetLocationCreatePage.route(),
        );
        if (success ?? false) {
          queryBloc.add(event);
        }
      },
    );
  }
}
