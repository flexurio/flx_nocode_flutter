import 'package:flexurio_chiron_company/flexurio_chiron_company.dart';
import 'package:flexurio_chiron_accounting/src/app/bloc/medical_treatment_expense_department_query/medical_treatment_expense_department_query_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/medical_treatment_expense_department/util/pdf_medical_treatment_expense_deparment.dart';
import 'package:flexurio_chiron_finance/src/app/model/permission.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class MedicalTreatmentExpenseDepartmentExportPdfButton extends StatefulWidget {
  const MedicalTreatmentExpenseDepartmentExportPdfButton._({
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
      child: MedicalTreatmentExpenseDepartmentExportPdfButton._(
        dateStart: dateStart,
        dateEnd: dateEnd,
        department: department,
      ),
    );
  }

  @override
  State<MedicalTreatmentExpenseDepartmentExportPdfButton> createState() =>
      _MedicalTreatmentExpenseDepartmentExportPdfButtonState();
}

class _MedicalTreatmentExpenseDepartmentExportPdfButtonState
    extends State<MedicalTreatmentExpenseDepartmentExportPdfButton> {
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
          loaded: (pageOptions) async {
            final pdf = pw.Document()
              ..addPage(
                await pdfMedicalTreatmentExpenseDepartment(
                  data: pageOptions.data,
                ),
              );
            await Printing.sharePdf(
              bytes: await pdf.save(),
              filename: 'Medical-Treatment-Expense.pdf',
            );
          },
        );
      },
      child: BlocBuilder<MedicalTreatmentExpenseDepartmentQueryBloc,
          MedicalTreatmentExpenseDepartmentQueryState>(
        builder: (context, state) {
          return LightButtonSmall(
            action: DataAction.exportPdf,
            status: state.maybeWhen(
              loading: (_) => Status.progress,
              orElse: () => null,
            ),
            permission: PermissionFinance.invoiceReceiptExportPdf,
            onPressed: () {
              bloc.add(
                MedicalTreatmentExpenseDepartmentQueryEvent.fetch(
                  pageOptions: PageOptions.emptyNoLimit(sortBy: 'product_id'),
                  dateEnd: widget.dateEnd,
                  dateStart: widget.dateStart,
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
