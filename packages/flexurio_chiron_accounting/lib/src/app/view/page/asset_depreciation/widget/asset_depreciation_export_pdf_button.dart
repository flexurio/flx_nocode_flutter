import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_accounting/flexurio_chiron_accounting.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/asset_depreciation/util/pdf_asset_depreciation.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class AssetDepreciationExportPdfButton extends StatefulWidget {
  const AssetDepreciationExportPdfButton._();

  static Widget prepare() {
    return BlocProvider(
      create: (context) => AssetDepreciationQueryBloc(),
      child: const AssetDepreciationExportPdfButton._(),
    );
  }

  @override
  State<AssetDepreciationExportPdfButton> createState() =>
      _AssetDepreciationExportPdfButtonState();
}

class _AssetDepreciationExportPdfButtonState
    extends State<AssetDepreciationExportPdfButton> {
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
            final pdf = pw.Document()
              ..addPage(
                await pdfAssetDepreciation(data: pageOptions.data),
              );
            await Printing.sharePdf(
              bytes: await pdf.save(),
              filename: 'Asset-Depreciation.pdf',
            );
          },
        );
      },
      child:
          BlocBuilder<AssetDepreciationQueryBloc, AssetDepreciationQueryState>(
        builder: (context, state) {
          return LightButtonSmall(
            action: DataAction.exportPdf,
            title: 'asset_depreciation'.tr(),
            status: state.maybeWhen(
              loading: (_) => Status.progress,
              orElse: () => null,
            ),
            permission: PermissionAccounting.assetDepreciationExportPdf,
            onPressed: () {
              bloc.add(
                AssetDepreciationQueryEvent.fetch(
                  pageOptions: PageOptions.emptyNoLimit(sortBy: 'remark'),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
