import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_accounting/src/app/model/cost_report.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:pdf/widgets.dart';

const paddingRow = EdgeInsets.symmetric(vertical: 6, horizontal: 6);

Future<Page> pdfCostReportDetailWithTotal({
  required List<CostReport> data,
}) async {
  final printedBy = UserRepositoryApp.instance.userApp?.name ?? '';
  final groupByChartOfAccountId =
      groupBy(data, (data) => data.chartOfAccountId);
  final children = <Widget>[];
  final keys = groupByChartOfAccountId.keys.toList();

  for (var i = 0; i < groupByChartOfAccountId.length; i++) {
    final data = groupByChartOfAccountId[keys[i]]!.first;
    children.add(
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 36),
        child: tableHeader(
          columns: [
            PColumnHeader(
              primary: true,
              title: data.chartOfAccountId,
            ),
            PColumnHeader(
              flex: 3,
              title: data.chartOfAccountName,
            ),
            PColumnHeader(
              title: '',
              numeric: true,
            ),
          ],
        ),
      ),
    );
    var total = 0.0;
    for (var j = 0; j < groupByChartOfAccountId[keys[i]]!.length; j++) {
      final data = groupByChartOfAccountId[keys[i]]![j];
      final amount = data.credit == 0 ? -data.debit : data.credit;
      total += amount;

      children.add(
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 36),
          child: tableBody<CostReport>(
            data: [data],
            columns: [
              PColumnBody(
                contentBuilder: (data, index) => data.transactionNo,
              ),
              PColumnBody(
                flex: 3,
                contentBuilder: (data, index) => data.description,
              ),
              PColumnBody(
                numeric: true,
                contentBuilder: (data, index) => amount.format(),
              ),
            ],
          ),
        ),
      );
    }

    children.add(
      Padding(
        padding: const EdgeInsets.only(left: 36, right: 36, bottom: 12),
        child: tableFooter(
          columns: [
            PColumnFooter(
              footer: 'subtotal'.tr(),
            ),
            PColumnFooter(flex: 3),
            PColumnFooter(
              numeric: true,
              footer: total.format(),
            ),
          ],
        ),
      ),
    );
  }

  return pdfTemplate(
    printedBy: printedBy,
    headerTitle: 'cost_report_detail_with_total'.tr(),
    build: (context) => children,
  );
}
