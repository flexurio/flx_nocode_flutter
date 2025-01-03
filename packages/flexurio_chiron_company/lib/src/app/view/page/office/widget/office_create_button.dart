import 'package:flexurio_chiron_company/src/app/bloc/office_query/office_query_bloc.dart';
import 'package:flexurio_chiron_company/src/app/view/page/office_create/office_create_page.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OfficeCreateButton extends StatelessWidget {
  const OfficeCreateButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Button(
      permission: Permission.officeCreate,
      action: DataAction.create,
      onPressed: () async {
        final queryBloc = context.read<OfficeQueryBloc>();
        final success = await Navigator.push(
          context,
          OfficeCreatePage.route(),
        );
        if (success ?? false) {
          queryBloc.add(const OfficeQueryEvent.fetch());
        }
      },
    );
  }
}
