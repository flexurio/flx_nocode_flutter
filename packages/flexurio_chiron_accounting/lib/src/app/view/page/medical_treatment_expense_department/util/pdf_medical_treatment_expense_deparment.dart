import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_accounting/src/app/model/entity.dart';
import 'package:flexurio_chiron_accounting/src/app/model/medical_treatment_expense_department.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

const paddingRow = EdgeInsets.symmetric(vertical: 6, horizontal: 6);

Future<Page> pdfMedicalTreatmentExpenseDepartment({
  required List<MedicalTreatmentExpenseDepartment> data,
}) async {
  final printedBy = UserRepositoryApp.instance.userApp?.name ?? '';

  final groupByProduct = groupBy(data, (data) => data.productId).entries;

  return pdfTemplate(
    printedBy: printedBy,
    headerTitle: EntityAccounting.medicalTreatmentExpenseDepartment.title,
    build: (context) => [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 36),
        child: Column(
          children: groupByProduct.map((data) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${data.value.first.productId} ${data.value.first.productName}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: PdfColor.fromInt(flavorConfig.color.value),
                  ),
                ),
                simpleTablePdf<MedicalTreatmentExpenseDepartment>(
                  data: data.value,
                  columns: [
                    PColumn(
                      primary: true,
                      title: 'delivery_order_id'.tr(),
                      contentBuilder: (data, index) => data.deliveryOrderId,
                      footer: 'total'.tr(),
                    ),
                    PColumn(
                      title: 'delivery_order_date'.tr(),
                      contentBuilder: (data, index) =>
                          data.deliveryOrderDate.ddMMyyyy,
                    ),
                    PColumn(
                      title: 'expired_date'.tr(),
                      contentBuilder: (data, index) =>
                          data.expiredDate.ddMMyyyy,
                    ),
                    PColumn(
                      title: 'batch_no'.tr(),
                      contentBuilder: (data, index) => data.batchNo,
                    ),
                    PColumn(
                      title: 'quantity'.tr(),
                      numeric: true,
                      contentBuilder: (data, index) => data.quantity.format(),
                      footer: data.value
                          .fold<double>(
                            0,
                            (sum, item) => sum + (item.quantity),
                          )
                          .format(),
                    ),
                    PColumn(
                      title: 'unit'.tr(),
                      contentBuilder: (data, index) => data.unitId,
                      footer: data.value.first.unitId,
                    ),
                  ],
                ),
                SizedBox(height: 12),
              ],
            );
          }).toList(),
        ),
      ),
    ],
  );
}
