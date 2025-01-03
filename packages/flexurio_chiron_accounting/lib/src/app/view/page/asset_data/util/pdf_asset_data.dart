import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_accounting/src/app/model/entity.dart';
import 'package:flexurio_chiron_accounting/src/app/model/asset_data.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:pdf/widgets.dart';

Future<Page> pdfAssetData({
  required List<AssetData> data,
}) async {
  final printedBy = UserRepositoryApp.instance.userApp?.name ?? '';

  final header = Padding(
    padding: const EdgeInsets.symmetric(horizontal: 36),
    child: tableHeader(columns: [
      PColumnHeader(
        title: 'date'.tr(),
      ),
      PColumnHeader(
        title: 'code'.tr(),
      ),
      PColumnHeader(
        flex: 3,
        title: 'description'.tr(),
      ),
      PColumnHeader(
        title: 'department'.tr(),
      ),
      PColumnHeader(
        flex: 2,
        title: 'asset_location'.tr(),
      ),
    ]),
  );

  final body = data.map((data) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 36),
      child: tableBody<AssetData>(
        data: [data],
        columns: [
          PColumnBody(
            contentBuilder: (data, index) => data.date.yyyyMMdd,
          ),
          PColumnBody(
            contentBuilder: (data, index) => data.id,
          ),
          PColumnBody(
            flex: 3,
            contentBuilder: (data, index) => data.remark,
          ),
          PColumnBody(
            contentBuilder: (data, index) => data.department.name,
          ),
          PColumnBody(
            flex: 2,
            contentBuilder: (data, index) => data.assetLocation.locationName,
          ),
        ],
      ),
    );
  });

  return pdfTemplate(
    printedBy: printedBy,
    headerTitle: EntityAccounting.assetData.title,
    headerChild: header,
    build: (context) => body.toList(),
  );
}
