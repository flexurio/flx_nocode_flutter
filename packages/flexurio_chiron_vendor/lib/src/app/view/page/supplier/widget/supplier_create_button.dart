import 'package:flexurio_chiron_vendor/src/app/bloc/supplier_query/supplier_query_bloc.dart';
import 'package:flexurio_chiron_vendor/src/app/view/page/supplier_create/supplier_create_page.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SupplierCreateButton extends StatelessWidget {
  const SupplierCreateButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Button.small(
      permission: Permission.supplierCreate,
      action: DataAction.create,
      onPressed: () async {
        final queryBloc = context.read<SupplierQueryBloc>();
        final success = await Navigator.push(
          context,
          SupplierCreatePage.route(),
        );
        if (success ?? false) {
          queryBloc.add(const SupplierQueryEvent.fetch());
        }
      },
    );
  }
}
