import 'package:flexurio_chiron_company/flexurio_chiron_company.dart';
import 'package:appointment/src/app/util/picker_file.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_accounting/flexurio_chiron_accounting.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MedicalTreatmentExpenseDepartmentExportExcelButton
    extends StatefulWidget {
  const MedicalTreatmentExpenseDepartmentExportExcelButton._({
    required this.dateStart,
    required this.dateEnd,
    required this.department,
  });

  final DateTime dateStart;
  final DateTime dateEnd;
  final Department department;

  static Widget prepare({
    required DateTime dateStart,
    required DateTime dateEnd,
    required Department department,
  }) {
    return BlocProvider(
      create: (context) => MedicalTreatmentExpenseDepartmentQueryBloc(),
      child: MedicalTreatmentExpenseDepartmentExportExcelButton._(
        dateStart: dateStart,
        dateEnd: dateEnd,
        department: department,
      ),
    );
  }

  @override
  State<MedicalTreatmentExpenseDepartmentExportExcelButton> createState() =>
      _MedicalTreatmentExpenseDepartmentExportExcelButtonState();
}

class _MedicalTreatmentExpenseDepartmentExportExcelButtonState
    extends State<MedicalTreatmentExpenseDepartmentExportExcelButton> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<MedicalTreatmentExpenseDepartmentQueryBloc>();

    return BlocListener<MedicalTreatmentExpenseDepartmentQueryBloc,
        MedicalTreatmentExpenseDepartmentQueryState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          loaded: (pageOptions) {
            final bytes = simpleExcel<MedicalTreatmentExpenseDepartment>(
              context: context,
              data: pageOptions.data,
              columns: [
                TColumn(
                  title: 'department'.tr(),
                  builder: (data, index) => data.department,
                ),
                TColumn(
                  title: 'product_id'.tr(),
                  builder: (data, index) => data.productId,
                ),
                TColumn(
                  title: 'product_name'.tr(),
                  builder: (data, index) => data.productName,
                ),
                TColumn(
                  title: 'delivery_order_id'.tr(),
                  builder: (data, index) => data.deliveryOrderId,
                ),
                TColumn(
                  title: 'delivery_order_date'.tr(),
                  builder: (data, index) => data.deliveryOrderDate.ddMMyyyy,
                ),
                TColumn(
                  title: 'expired_date'.tr(),
                  builder: (data, index) => data.expiredDate.ddMMyyyy,
                ),
                TColumn(
                  title: 'batch_no'.tr(),
                  builder: (data, index) => data.batchNo,
                ),
                TColumn(
                  title: 'unit'.tr(),
                  builder: (data, index) => data.unitId,
                ),
                TColumn(
                  title: 'quantity'.tr(),
                  numeric: true,
                  builder: (data, index) => data.quantity.format(),
                ),
                TColumn(
                  title: 'product_price'.tr(),
                  numeric: true,
                  builder: (data, index) => data.productPrice.format(),
                ),
                TColumn(
                  title: 'amount'.tr(),
                  numeric: true,
                  builder: (data, index) => data.amount.format(),
                ),
              ],
            );
            saveFile(bytes, 'Medical_Treatment_Expense_Department_Report.xlsx');
          },
        );
      },
      child: BlocBuilder<MedicalTreatmentExpenseDepartmentQueryBloc,
          MedicalTreatmentExpenseDepartmentQueryState>(
        builder: (context, state) {
          return LightButtonSmall(
            action: DataAction.exportExcel,
            status: state.maybeWhen(
              loading: (_) => Status.progress,
              orElse: () => null,
            ),
            permission: PermissionAccounting.journalTransactionExportExcel,
            onPressed: () {
              bloc.add(
                MedicalTreatmentExpenseDepartmentQueryEvent.fetch(
                  pageOptions: PageOptions.emptyNoLimit(sortBy: 'product_id'),
                  dateStart: widget.dateStart,
                  dateEnd: widget.dateEnd,
                  departmentId: widget.department.id,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
