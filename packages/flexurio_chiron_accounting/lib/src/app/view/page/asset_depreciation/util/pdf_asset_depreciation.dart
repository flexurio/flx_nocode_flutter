import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_accounting/src/app/model/asset_depreciation.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

const paddingRow = EdgeInsets.symmetric(vertical: 6, horizontal: 6);

Future<Page> pdfAssetDepreciation({
  required List<AssetDepreciation> data,
}) async {
  final printedBy = UserRepositoryApp.instance.userApp?.name ?? '';
  return pdfTemplate(
    printedBy: printedBy,
    headerTitle: 'asset_depreciation'.tr(),
    headerChild: Padding(
      padding: const EdgeInsets.only(left: 36, right: 36, top: 12),
      child: tableHeader(
        hasChildren: true,
        columns: [
          PColumnHeader(
            flex: 2,
            primary: true,
            title: 'note'.tr(),
          ),
          PColumnHeader(
            title: 'code'.tr(),
          ),
          PColumnHeader(
            flex: 0.5,
            title: 'quantity'.tr(),
            numeric: true,
          ),
          PColumnHeader(
            title: 'acquisition_date'.tr(),
          ),
          PColumnHeader(
            flex: 4,
            title: 'Nilai perolehan / penarikan tahun 2024',
            children: [
              PColumnHeader(title: 'Per 0902', numeric: true),
              PColumnHeader(title: 'Penambahan', numeric: true),
              PColumnHeader(title: 'Penarikan', numeric: true),
              PColumnHeader(title: 'Per 0930', numeric: true),
            ],
          ),
          PColumnHeader(
            flex: 4,
            title: 'Penyusutan tahun 2024'.tr(),
            children: [
              PColumnHeader(title: 'Per 0902', numeric: true),
              PColumnHeader(title: 'Penambahan', numeric: true),
              PColumnHeader(title: 'Penarikan', numeric: true),
              PColumnHeader(title: 'Per 0930', numeric: true),
            ],
          ),
          PColumnHeader(
            title: 'Nilai per Buku 0930'.tr(),
          ),
        ],
      ),
    ),
    orientation: PageOrientation.landscape,
    pageFormat:
        PdfPageFormat.a3.landscape.copyWith(width: 50 * PdfPageFormat.cm),
    build: (context) => [
      ...List.generate(data.length, (index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 36),
          child: tableBody<AssetDepreciation>(
            data: [data[index]],
            columns: [
              PColumnBody(
                flex: 2,
                contentBuilder: (data, index) => data.remark,
              ),
              PColumnBody(
                contentBuilder: (data, index) => data.assetCode,
              ),
              PColumnBody(
                flex: 0.5,
                contentBuilder: (data, index) => data.quantity.toString(),
                numeric: true,
              ),
              PColumnBody(
                contentBuilder: (data, index) {
                  return DateFormat('dd/MM/yyyy').format(
                    data.acquisitionDate,
                  );
                },
              ),
              PColumnBody(
                contentBuilder: (data, index) =>
                    data.acquisitionValuePlus.format(),
                numeric: true,
              ),
              PColumnBody(
                contentBuilder: (data, index) =>
                    data.acquisitionValueMin.format(),
                numeric: true,
              ),
              PColumnBody(
                contentBuilder: (data, index) => '',
                numeric: true,
              ),
              PColumnBody(
                contentBuilder: (data, index) => data.formula.format(),
                numeric: true,
              ),
              PColumnBody(
                contentBuilder: (data, index) => data.totalFormula.format(),
                numeric: true,
              ),
              PColumnBody(
                contentBuilder: (data, index) =>
                    data.depreciationValue.format(),
                numeric: true,
              ),
              PColumnBody(
                contentBuilder: (data, index) => '',
                numeric: true,
              ),
              PColumnBody(
                contentBuilder: (data, index) => data.totalFormula.format(),
                numeric: true,
              ),
              PColumnBody(
                contentBuilder: (data, index) => data.totalFormula.format(),
                numeric: true,
              ),
            ],
          ),
        );
      }),
    ],
  );
}
