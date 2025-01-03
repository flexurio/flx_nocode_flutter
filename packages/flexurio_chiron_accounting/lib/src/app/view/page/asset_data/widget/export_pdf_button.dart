import 'package:flexurio_chiron_accounting/flexurio_chiron_accounting.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class AssetDataExportPdfButton extends StatefulWidget {
  const AssetDataExportPdfButton({super.key});

  static Widget prepare() {
    return BlocProvider(
      create: (context) => AssetDataQueryBloc(),
      child: const AssetDataExportPdfButton(),
    );
  }

  @override
  State<AssetDataExportPdfButton> createState() =>
      _AssetDataExportPdfButtonState();
}

class _AssetDataExportPdfButtonState extends State<AssetDataExportPdfButton> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<AssetDataQueryBloc>();

    return BlocListener<AssetDataQueryBloc, AssetDataQueryState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          loaded: (pageOptions) async {
            final pdf = pw.Document()
              ..addPage(
                await pdfAssetData(data: pageOptions.data),
              );
            await Printing.sharePdf(
              bytes: await pdf.save(),
              filename: 'Asset-Data.pdf',
            );
          },
        );
      },
      child: BlocBuilder<AssetDataQueryBloc, AssetDataQueryState>(
        builder: (context, state) {
          return LightButtonSmall(
            action: DataAction.exportPdf,
            status: state.maybeWhen(
              loading: (_) => Status.progress,
              orElse: () => null,
            ),
            permission: PermissionAccounting.assetDataExportPdf,
            onPressed: () {
              bloc.add(
                AssetDataQueryEvent.fetch(
                  pageOptions: PageOptions.emptyNoLimit(sortBy: 'date'),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
