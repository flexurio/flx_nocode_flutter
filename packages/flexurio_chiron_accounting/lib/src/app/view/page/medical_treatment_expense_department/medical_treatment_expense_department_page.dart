import 'package:flexurio_chiron_company/flexurio_chiron_company.dart';
import 'package:flexurio_chiron_accounting/src/app/bloc/medical_treatment_expense_department_query/medical_treatment_expense_department_query_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/model/entity.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/medical_treatment_expense_department/widget/data_table.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class MedicalTreatmentExpenseDepartmentPage extends StatelessWidget {
  const MedicalTreatmentExpenseDepartmentPage._();

  static Widget prepare() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MedicalTreatmentExpenseDepartmentQueryBloc(),
        ),
        BlocProvider(
          create: (context) => DepartmentQueryBloc()
            ..add(
              DepartmentQueryEvent.fetch(
                pageOptions: PageOptions.emptyNoLimit(),
              ),
            ),
        ),
      ],
      child: const MedicalTreatmentExpenseDepartmentPage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
      children: [
        TitlePage(entity: EntityAccounting.medicalTreatmentExpenseDepartment),
        const Gap(12),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: const MedicalTreatmentExpenseDepartmentDataTable(),
        ),
      ],
    );
  }
}
