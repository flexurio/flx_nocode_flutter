import 'package:flexurio_chiron_accounting/src/app/bloc/asset_data_query/asset_data_query_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/model/asset_data.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/asset_data/widget/asset_data_create_page.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AssetDataEditButton extends StatelessWidget {
  const AssetDataEditButton({
    required this.assetData,
    super.key,
  });

  final AssetData assetData;

  @override
  Widget build(BuildContext context) {
    return IconButtonSmall(
      permission: Permission.assetDataEdit,
      action: DataAction.edit,
      onPressed: () {
        Navigator.push(
          context,
          AssetDataCreatePage.route(
            assetData: assetData,
          ),
        ).then((value) {
          if (value ?? false) {
            context.read<AssetDataQueryBloc>().add(AssetDataQueryEvent.fetch());
          }
        });
      },
    );
  }
}
