import 'package:flexurio_chiron_accounting/src/app/bloc/asset_type_query/asset_type_query_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/model/asset_type.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/asset_type/widget/asset_type_create_button.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/asset_type/widget/asset_type_delete_button.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/asset_type/widget/asset_type_edit_button.dart';
import 'package:appointment/src/app/view/widget/get_user_name.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AssetTypeDataTable extends StatelessWidget {
  const AssetTypeDataTable({super.key});

  static Widget prepare() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              AssetTypeQueryBloc()..add(AssetTypeQueryEvent.fetch()),
        ),
      ],
      child: const AssetTypeDataTable(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AssetTypeQueryBloc, AssetTypeQueryState>(
      builder: (context, state) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: DataTableBackend<AssetType>(
            freezeFirstColumn: true,
            freezeLastColumn: true,
            key: ValueKey(state.hashCode),
            status: state.maybeWhen(
              loading: (_) => Status.progress,
              loaded: (_) => Status.loaded,
              orElse: () => Status.error,
            ),
            onRefresh: () => context
                .read<AssetTypeQueryBloc>()
                .add(AssetTypeQueryEvent.fetch()),
            pageOptions: state.maybeWhen(
              loaded: (data) => data,
              loading: (data) => data,
              orElse: PageOptions.empty,
            ),
            actionRight: (refreshButton) => [
              refreshButton,
              const AssetTypeCreateButton(),
            ],
            onChanged: (pageOptions) {
              context.read<AssetTypeQueryBloc>().add(
                    AssetTypeQueryEvent.fetch(
                      pageOptions: pageOptions,
                    ),
                  );
            },
            columns: [
              DTColumn(
                widthFlex: 4,
                head: DTHead(
                  label: 'id'.tr(),
                  backendColumn: 'name',
                ),
                body: (assetType) => DataCell(
                  Text(assetType.id),
                ),
              ),
              DTColumn(
                widthFlex: 13,
                head: DTHead(
                  label: 'name'.tr(),
                  backendColumn: 'name',
                ),
                body: (assetType) => DataCell(
                  Text(assetType.name),
                ),
              ),
              DTColumn(
                widthFlex: 13,
                head: const DTHead(
                  label: 'COA',
                  backendColumn: 'coa',
                ),
                body: (assetType) => DataCell(
                  Text(assetType.coa.name),
                ),
              ),
              DTColumn(
                widthFlex: 13,
                head: DTHead(
                  label: 'coa_accumulation'.tr(),
                  backendColumn: 'coa_accumulation.name',
                ),
                body: (assetType) => DataCell(
                  Text(
                    assetType.coaAccumulation.name,
                  ),
                ),
              ),
              DTColumn(
                widthFlex: 13,
                head: DTHead(
                  label: 'coa_invoice'.tr(),
                  backendColumn: 'coa_invoice',
                ),
                body: (assetType) => DataCell(
                  Text(
                    assetType.coaInvoice.name,
                  ),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'amount_of_depreciation'.tr(),
                  backendColumn: 'amount_of_depreciation',
                ),
                body: (assetType) => DataCell(
                  Text(assetType.amountOfDepreciation.toString()),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'created_by'.tr(),
                  backendColumn: 'created_by_id',
                ),
                body: (assetType) => DataCell(
                  GetNameUser(userId: assetType.createdById),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'created_at'.tr(),
                  backendColumn: 'created_at',
                ),
                body: (assetType) => DataCell(
                  Text(assetType.createdAt.yMMMdHm),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'updated_by'.tr(),
                  backendColumn: 'updated_by_id',
                ),
                body: (assetType) => DataCell(
                  GetNameUser(userId: assetType.updateById),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'updated_at'.tr(),
                  backendColumn: 'updated_at',
                ),
                body: (assetType) => DataCell(
                  Text(assetType.updatedAt.yMMMdHm),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'actions'.tr(),
                  backendColumn: null,
                ),
                body: (assetType) => DataCell(
                  Row(
                    children: [
                      AssetTypeEditButton(assetType: assetType),
                      AssetTypeDeleteButton.prepare(assetType: assetType),
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
