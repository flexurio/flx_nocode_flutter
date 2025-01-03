import 'package:flexurio_chiron_accounting/src/app/bloc/asset_location_query/asset_location_query_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/model/asset_location.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/asset_location/widget/asset_location_create_button.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/asset_location/widget/asset_location_delete_button.dart';
import 'package:appointment/src/app/view/widget/get_user_name.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AssetLocationDataTable extends StatelessWidget {
  const AssetLocationDataTable({super.key});

  static Widget prepare() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              AssetLocationQueryBloc()..add(AssetLocationQueryEvent.fetch()),
        ),
      ],
      child: const AssetLocationDataTable(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AssetLocationQueryBloc, AssetLocationQueryState>(
      builder: (context, state) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: DataTableBackend<AssetLocation>(
            freezeFirstColumn: true,
            freezeLastColumn: true,
            key: ValueKey(state.hashCode),
            status: state.maybeWhen(
              loading: (_) => Status.progress,
              loaded: (_) => Status.loaded,
              orElse: () => Status.error,
            ),
            onRefresh: () => context
                .read<AssetLocationQueryBloc>()
                .add(AssetLocationQueryEvent.fetch()),
            pageOptions: state.maybeWhen(
              loaded: (data) => data,
              loading: (data) => data,
              orElse: PageOptions.empty,
            ),
            actionRight: (refreshButton) => [
              refreshButton,
              const AssetLocationCreateButton(),
            ],
            onChanged: (pageOptions) {
              context.read<AssetLocationQueryBloc>().add(
                    AssetLocationQueryEvent.fetch(
                      pageOptions: pageOptions,
                    ),
                  );
            },
            columns: [
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'code'.tr(),
                  backendColumn: 'name',
                ),
                body: (assetLocation) => DataCell(
                  Text(assetLocation.id),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'name'.tr(),
                  backendColumn: 'name',
                ),
                body: (assetLocation) => DataCell(
                  Text(assetLocation.locationName),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'created_by'.tr(),
                  backendColumn: 'created_by_id',
                ),
                body: (assetLocation) => DataCell(
                  GetNameUser(userId: assetLocation.createdById),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'created_at'.tr(),
                  backendColumn: 'created_at',
                ),
                body: (assetLocation) => DataCell(
                  Text(assetLocation.createdAt.yMMMdHm),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'updated_by'.tr(),
                  backendColumn: 'updated_by_id',
                ),
                body: (assetLocation) => DataCell(
                  GetNameUser(userId: assetLocation.updateById),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'updated_at'.tr(),
                  backendColumn: 'updated_at',
                ),
                body: (assetLocation) => DataCell(
                  Text(assetLocation.updatedAt.yMMMdHm),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'actions'.tr(),
                  backendColumn: null,
                ),
                body: (assetLocation) => DataCell(
                  Row(
                    children: [
                      AssetLocationDeleteButton.prepare(
                        assetLocation: assetLocation,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
