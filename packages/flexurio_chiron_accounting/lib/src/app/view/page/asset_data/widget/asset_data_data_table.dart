import 'package:appointment/src/app/view/widget/get_user_name.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_accounting/flexurio_chiron_accounting.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AssetDataDataTable extends StatefulWidget {
  const AssetDataDataTable({super.key});

  static Widget prepare() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              AssetDataQueryBloc()..add(AssetDataQueryEvent.fetch()),
        ),
      ],
      child: const AssetDataDataTable(),
    );
  }

  @override
  State<AssetDataDataTable> createState() => _AssetDataDataTableState();
}

class _AssetDataDataTableState extends State<AssetDataDataTable> {
  final format = NumberFormat('#,##0.00', 'en_US');

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AssetDataQueryBloc, AssetDataQueryState>(
      builder: (context, state) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: DataTableBackend<AssetData>(
            freezeFirstColumn: true,
            freezeLastColumn: true,
            key: ValueKey(state.hashCode),
            status: state.maybeWhen(
              loading: (_) => Status.progress,
              loaded: (_) => Status.loaded,
              orElse: () => Status.error,
            ),
            onRefresh: () => context
                .read<AssetDataQueryBloc>()
                .add(AssetDataQueryEvent.fetch()),
            pageOptions: state.maybeWhen(
              loaded: (data) => data,
              loading: (data) => data,
              orElse: PageOptions.empty,
            ),
            actionRight: (refreshButton) => [
              AssetDepreciationExportExcelButton.prepare(),
              AssetDepreciationExportPdfButton.prepare(),
              AssetDataExportPdfButton.prepare(),
              refreshButton,
              const AssetDataCreateButton(),
            ],
            onChanged: (pageOptions) {
              context.read<AssetDataQueryBloc>().add(
                    AssetDataQueryEvent.fetch(pageOptions: pageOptions),
                  );
            },
            columns: [
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'code'.tr(),
                  backendColumn: 'code',
                ),
                body: (assetData) => DataCell(
                  Text(assetData.id).canCopy(),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'asset_registration_id'.tr(),
                  backendColumn: 'asset_registration_id',
                ),
                body: (assetData) => DataCell(
                  Text(assetData.assetRegistrationId!).canCopy(),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'asset_name'.tr(),
                  backendColumn: 'asset_name',
                ),
                body: (assetData) => DataCell(
                  SizedText(assetData.assetName),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'quantity'.tr(),
                  backendColumn: 'quantity',
                ),
                body: (assetData) => DataCell(
                  Text(assetData.quantity.toString()),
                ),
              ),
              DTColumn(
                widthFlex: 7,
                head: DTHead(
                  numeric: true,
                  label: 'asset_price'.tr(),
                  backendColumn: 'price',
                ),
                body: (assetDate) {
                  return DataCell(
                    Text(assetDate.price == 0
                        ? '0'
                        : format.format(assetDate.price)),
                  );
                },
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'unit'.tr(),
                  backendColumn: 'unit',
                ),
                body: (assetData) => DataCell(
                  Text(assetData.unit.id),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'department'.tr(),
                  backendColumn: 'department',
                ),
                body: (assetData) => DataCell(
                  Text(assetData.department.name),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'asset_type'.tr(),
                  backendColumn: 'asset_type',
                ),
                body: (assetData) => DataCell(
                  Text(assetData.assetType.name),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'location_asset'.tr(),
                  backendColumn: 'location_asset',
                ),
                body: (assetData) => DataCell(
                  Text(assetData.assetLocation.locationName),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'current_location_asset'.tr(),
                  backendColumn: 'location_current',
                ),
                body: (assetData) => DataCell(
                  Text(assetData.assetLocationCurrent.locationName),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'date'.tr(),
                  backendColumn: 'date',
                ),
                body: (assetData) => DataCell(
                  Text(assetData.date.yMMMdHm),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'depreciate_value'.tr(),
                  backendColumn: 'depreciation_value',
                ),
                body: (assetData) => DataCell(
                  Text(assetData.depreciationValue.toString()),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'depreciate_count'.tr(),
                  backendColumn: 'depreciation_count',
                ),
                body: (assetData) => DataCell(
                  Text(assetData.depreciationCount.toString()),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'created_by'.tr(),
                  backendColumn: 'created_by_id',
                ),
                body: (assetData) => DataCell(
                  GetNameUser(userId: assetData.createdById),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'created_at'.tr(),
                  backendColumn: 'created_at',
                ),
                body: (assetData) => DataCell(
                  Text(assetData.createdAt.yMMMdHm),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'updated_by'.tr(),
                  backendColumn: 'updated_by_id',
                ),
                body: (assetData) => DataCell(
                  GetNameUser(userId: assetData.updateById),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'updated_at'.tr(),
                  backendColumn: 'updated_at',
                ),
                body: (assetData) => DataCell(
                  Text(assetData.updatedAt.yMMMdHm),
                ),
              ),
              DTColumn(
                widthFlex: 10,
                head: DTHead(
                  label: 'actions'.tr(),
                  backendColumn: null,
                ),
                body: (assetData) => DataCell(
                  Row(
                    children: [
                      if (assetData.isNonActive == false)
                        AssetDataMovingButton.prepare(assetData),
                      if (assetData.isNonActive == false)
                        AssetDataNonActiveButton.prepare(assetData),
                      AssetDataEditButton(
                        assetData: assetData,
                      ),
                      AssetDataDeleteButton.prepare(
                        assetData: assetData,
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
