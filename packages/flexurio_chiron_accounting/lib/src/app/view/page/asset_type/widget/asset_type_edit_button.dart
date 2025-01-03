import 'package:flexurio_chiron_accounting/src/app/bloc/asset_type_query/asset_type_query_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/model/asset_type.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/asset_type/widget/asset_type_create_page.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AssetTypeEditButton extends StatelessWidget {
  const AssetTypeEditButton({
    required this.assetType,
    super.key,
  });

  final AssetType assetType;

  @override
  Widget build(BuildContext context) {
    return IconButtonSmall(
      permission: Permission.assetTypeEdit,
      action: DataAction.edit,
      onPressed: () {
        Navigator.push(
          context,
          AssetTypeCreatePage.route(
            assetType: assetType,
          ),
        ).then((value) {
          if (value ?? false) {
            context.read<AssetTypeQueryBloc>().add(AssetTypeQueryEvent.fetch());
          }
        });
      },
    );
  }
}
