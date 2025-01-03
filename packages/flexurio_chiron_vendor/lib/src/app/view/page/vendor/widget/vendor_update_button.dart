import 'package:flexurio_chiron_vendor/src/app/bloc/vendor_query/vendor_query_bloc.dart';
import 'package:flexurio_chiron_vendor/src/app/model/vendors.dart';
import 'package:flexurio_chiron_vendor/src/app/view/page/vendor_create/vendor_create_page.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VendorUpdateButton extends StatelessWidget {
  const VendorUpdateButton({required this.vendor, super.key});

  final Vendor vendor;

  @override
  Widget build(BuildContext context) {
    return IconButtonSmall(
      permission: PermissionVendor.vendorEdit,
      action: DataAction.edit,
      onPressed: () async {
        final queryBloc = context.read<VendorQueryBloc>();
        final success = await Navigator.push(
          context,
          VendorCreatePage.route(vendor: vendor),
        );
        if (success ?? false) {
          queryBloc.add(const VendorQueryEvent.fetch());
        }
      },
    );
  }
}
