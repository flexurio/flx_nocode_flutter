import 'package:flexurio_chiron_company/src/app/bloc/office_query/office_query_bloc.dart';
import 'package:flexurio_chiron_company/src/app/model/office.dart';
import 'package:flexurio_chiron_company/src/app/view/page/office_create/office_create_page.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OfficeUpdateButton extends StatelessWidget {
  const OfficeUpdateButton({required this.office, super.key});

  final Office office;

  @override
  Widget build(BuildContext context) {
    return IconButtonSmall(
      permission: Permission.officeEdit,
      action: DataAction.edit,
      onPressed: () async {
        final queryBloc = context.read<OfficeQueryBloc>();
        final success = await Navigator.push(
          context,
          OfficeCreatePage.route(office: office),
        );
        if (success ?? false) {
          queryBloc.add(const OfficeQueryEvent.fetch());
        }
      },
    );
  }
}
