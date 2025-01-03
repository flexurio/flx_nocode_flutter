import 'package:appointment/src/app/util/picker_file.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_accounting/flexurio_chiron_accounting.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AssetDepreciationExportExcelButton extends StatefulWidget {
  const AssetDepreciationExportExcelButton._();

  static Widget prepare() {
    return BlocProvider(
      create: (context) => AssetDepreciationQueryBloc(),
      child: const AssetDepreciationExportExcelButton._(),
    );
  }

  @override
  State<AssetDepreciationExportExcelButton> createState() =>
      _AssetDepreciationExportExcelButtonState();
}

class _AssetDepreciationExportExcelButtonState
    extends State<AssetDepreciationExportExcelButton> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<AssetDepreciationQueryBloc>();

    return BlocListener<AssetDepreciationQueryBloc,
        AssetDepreciationQueryState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          loaded: (pageOptions) async {
            final bytes = simpleExcel<AssetDepreciation>(
              context: context,
              data: pageOptions.data,
              columns: [
                TColumn(
                  title: 'note'.tr(),
                  builder: (data, index) => data.remark,
                ),
                TColumn(
                  title: 'code'.tr(),
                  builder: (data, index) => data.assetCode,
                ),
                TColumn(
                  title: 'quantity'.tr(),
                  numeric: true,
                  builder: (data, index) => data.quantity.toString(),
                ),
                TColumn(
                  title: 'acquisition_date'.tr(),
                  builder: (data, index) => data.acquisitionDate.ddMMyyyySlash,
                ),
                TColumn(
                  title: 'Nilai perolehan / penarikan tahun 2024 Per 0902',
                  numeric: true,
                  builder: (data, index) => data.acquisitionValuePlus.format(),
                ),
                TColumn(
                  title: 'Nilai perolehan / penarikan tahun 2024 Penambahan',
                  numeric: true,
                  builder: (data, index) => data.acquisitionValueMin.format(),
                ),
                TColumn(
                  title: 'Nilai perolehan / penarikan tahun 2024 Penarikan',
                  numeric: true,
                  builder: (data, index) => '',
                ),
                TColumn(
                  title: 'Nilai perolehan / penarikan tahun 2024 Per 0930',
                  numeric: true,
                  builder: (data, index) => data.formula.format(),
                ),
                TColumn(
                  title: '${'Penyusutan tahun 2024'.tr()} Per 0902',
                  numeric: true,
                  builder: (data, index) => data.totalFormula.format(),
                ),
                TColumn(
                  title: '${'Penyusutan tahun 2024'.tr()} Penambahan',
                  numeric: true,
                  builder: (data, index) => data.depreciationValue.format(),
                ),
                TColumn(
                  title: '${'Penyusutan tahun 2024'.tr()} Penarikan',
                  numeric: true,
                  builder: (data, index) => '',
                ),
                TColumn(
                    title: '${'Penyusutan tahun 2024'.tr()} Per 0930',
                    numeric: true,
                    builder: (data, index) => data.totalFormula.format()),
                TColumn(
                    title: 'Nilai per Buku 0930'.tr(),
                    numeric: true,
                    builder: (data, index) => data.totalFormula.format()),
              ],
            );
            saveFile(bytes, 'Asset_Depreciation_Report.xlsx');
          },
        );
      },
      child:
          BlocBuilder<AssetDepreciationQueryBloc, AssetDepreciationQueryState>(
        builder: (context, state) {
          return LightButtonSmall(
            action: DataAction.exportExcel,
            title: 'asset_depreciation'.tr(),
            status: state.maybeWhen(
              loading: (_) => Status.progress,
              orElse: () => null,
            ),
            permission: PermissionAccounting.assetDepreciationExportExcel,
            onPressed: () {
              bloc.add(
                AssetDepreciationQueryEvent.fetch(
                  pageOptions:
                      PageOptions.emptyNoLimit(sortBy: 'acquisition_date'),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
