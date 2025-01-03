import 'package:flexurio_chiron_vendor/src/app/bloc/vendor_query/vendor_query_bloc.dart';
import 'package:flexurio_chiron_vendor/src/app/view/page/vendor_create/vendor_create_page.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VendorCreateButton extends StatelessWidget {
  const VendorCreateButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Button.small(
      permission: PermissionVendor.vendorCreate,
      action: DataAction.create,
      onPressed: () async {
        final queryBloc = context.read<VendorQueryBloc>();
        final success = await Navigator.push(
          context,
          VendorCreatePage.route(),
        );
        if (success ?? false) {
          queryBloc.add(const VendorQueryEvent.fetch());
        }
      },
    );
  }
}
