import 'package:flexurio_chiron_company/flexurio_chiron_company.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_accounting/src/app/bloc/medical_treatment_expense_department_query/medical_treatment_expense_department_query_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/model/medical_treatment_expense_department.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/medical_treatment_expense_department/widget/export_excel_button.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/medical_treatment_expense_department/widget/export_pdf_button.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MedicalTreatmentExpenseDepartmentDataTable extends StatefulWidget {
  const MedicalTreatmentExpenseDepartmentDataTable({super.key});

  @override
  State<MedicalTreatmentExpenseDepartmentDataTable> createState() =>
      _MedicalTreatmentExpenseDepartmentDataTableState();
}

class _MedicalTreatmentExpenseDepartmentDataTableState
    extends State<MedicalTreatmentExpenseDepartmentDataTable> {
  late DateTime _dateStart;
  late DateTime _dateEnd;
  late Department _department;

  @override
  void initState() {
    super.initState();
    _dateStart = DateTime.now().startOfMonth;
    _dateEnd = DateTime.now().endOfMonth;
    _department = UserRepositoryApp.instance.department!;

    _fetch();
  }

  void _fetch() {
    context.read<MedicalTreatmentExpenseDepartmentQueryBloc>().add(
          MedicalTreatmentExpenseDepartmentQueryEvent.fetch(
            dateEnd: _dateEnd,
            dateStart: _dateStart,
            departmentId: _department.id,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    final queryBloc =
        context.read<MedicalTreatmentExpenseDepartmentQueryBloc>();
    return BlocBuilder<MedicalTreatmentExpenseDepartmentQueryBloc,
        MedicalTreatmentExpenseDepartmentQueryState>(
      builder: (context, state) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: DataTableBackend<MedicalTreatmentExpenseDepartment>(
            freezeFirstColumn: true,
            onRefresh: () => queryBloc.add(
              MedicalTreatmentExpenseDepartmentQueryEvent.fetch(
                dateEnd: _dateEnd,
                dateStart: _dateStart,
                departmentId: _department.id,
              ),
            ),
            key: ValueKey(state.hashCode),
            status: state.maybeWhen(
              loading: (_) => Status.progress,
              loaded: (_) => Status.loaded,
              orElse: () => Status.error,
            ),
            onChanged: (pageOptions) {
              _fetch();
            },
            pageOptions: state.maybeWhen(
              loaded: (data) => data,
              loading: (data) => data,
              orElse: PageOptions.empty,
            ),
            actionLeft: [
              BlocBuilder<DepartmentQueryBloc, DepartmentQueryState>(
                builder: (context, state) {
                  return DropDownSmall<Department>(
                    labelText: 'department'.tr(),
                    initialValue: _department,
                    itemAsString: (filter) => filter.name,
                    items: state.maybeWhen(
                      orElse: () => [],
                      loaded: (pageOptions) => pageOptions.data,
                    ),
                    onChanged: (value) {
                      _department = value!;
                      _fetch();
                    },
                  );
                },
              ),
              DropDownSmallDate(
                initialValue: _dateStart,
                labelText: 'start_date'.tr(),
                onChanged: (date) {
                  _dateStart = date;
                  _fetch();
                },
              ),
              DropDownSmallDate(
                initialValue: _dateEnd,
                labelText: 'end_date'.tr(),
                onChanged: (date) {
                  _dateEnd = date;
                  _fetch();
                },
              ),
            ],
            actionRight: (refreshButton) => [
              MedicalTreatmentExpenseDepartmentExportExcelButton.prepare(
                dateStart: _dateStart,
                dateEnd: _dateEnd,
                department: _department,
              ),
              MedicalTreatmentExpenseDepartmentExportPdfButton.prepare(
                dateStart: _dateStart,
                dateEnd: _dateEnd,
                department: _department,
              ),
              refreshButton,
            ],
            columns: [
              DTColumn(
                widthFlex: 5,
                head: DTHead(
                  label: 'department'.tr(),
                  backendColumn: 'department',
                ),
                body: (medicalTreatmentExpenseDepartment) => DataCell(
                  Text(medicalTreatmentExpenseDepartment.department),
                ),
              ),
              DTColumn(
                widthFlex: 5,
                head: DTHead(
                  label: 'product_id'.tr(),
                  backendColumn: 'product_id',
                ),
                body: (medicalTreatmentExpenseDepartment) => DataCell(
                  Text(medicalTreatmentExpenseDepartment.productId),
                ),
              ),
              DTColumn(
                widthFlex: 5,
                head: DTHead(
                  label: 'product_name'.tr(),
                  backendColumn: 'product_name',
                ),
                body: (medicalTreatmentExpenseDepartment) => DataCell(
                  Text(medicalTreatmentExpenseDepartment.productName),
                ),
              ),
              DTColumn(
                widthFlex: 5,
                head: DTHead(
                  label: 'delivery_order_id'.tr(),
                  backendColumn: 'delivery_order_id',
                ),
                body: (medicalTreatmentExpenseDepartment) => DataCell(
                  Text(medicalTreatmentExpenseDepartment.deliveryOrderId),
                ),
              ),
              DTColumn(
                widthFlex: 7,
                head: DTHead(
                  numeric: true,
                  label: 'delivery_order_date'.tr(),
                  backendColumn: 'delivery_order_date',
                ),
                body: (medicalTreatmentExpenseDepartment) => DataCell(
                  Text(
                    medicalTreatmentExpenseDepartment
                        .deliveryOrderDate.ddMMyyyy,
                  ),
                ),
              ),
              DTColumn(
                widthFlex: 6,
                head: DTHead(
                  numeric: true,
                  label: 'expired_date'.tr(),
                  backendColumn: 'ex_date',
                ),
                body: (medicalTreatmentExpenseDepartment) => DataCell(
                  Text(
                    medicalTreatmentExpenseDepartment.expiredDate.ddMMyyyy,
                  ),
                ),
              ),
              DTColumn(
                widthFlex: 5,
                head: DTHead(
                  numeric: true,
                  label: 'batch_no'.tr(),
                  backendColumn: 'batch_no',
                ),
                body: (medicalTreatmentExpenseDepartment) => DataCell(
                  Text(medicalTreatmentExpenseDepartment.batchNo),
                ),
              ),
              DTColumn(
                widthFlex: 5,
                head: DTHead(
                  label: 'unit'.tr(),
                  backendColumn: 'unit_id',
                ),
                body: (medicalTreatmentExpenseDepartment) => DataCell(
                  Text(medicalTreatmentExpenseDepartment.unitId),
                ),
              ),
              DTColumn(
                widthFlex: 5,
                head: DTHead(
                  numeric: true,
                  label: 'quantity'.tr(),
                  backendColumn: 'qty',
                ),
                body: (medicalTreatmentExpenseDepartment) => DataCell(
                  Text(medicalTreatmentExpenseDepartment.quantity.format()),
                ),
              ),
              DTColumn(
                widthFlex: 5,
                head: DTHead(
                  numeric: true,
                  label: 'product_price'.tr(),
                  backendColumn: 'product_price',
                ),
                body: (medicalTreatmentExpenseDepartment) => DataCell(
                  Text(medicalTreatmentExpenseDepartment.productPrice.format()),
                ),
              ),
              DTColumn(
                widthFlex: 5,
                head: DTHead(
                  numeric: true,
                  label: 'amount'.tr(),
                  backendColumn: 'amount',
                ),
                body: (medicalTreatmentExpenseDepartment) => DataCell(
                  Text(medicalTreatmentExpenseDepartment.amount.format()),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
