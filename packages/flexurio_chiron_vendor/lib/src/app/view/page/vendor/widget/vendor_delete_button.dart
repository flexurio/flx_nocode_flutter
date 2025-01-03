import 'package:flexurio_chiron_vendor/src/app/bloc/vendor/vendor_bloc.dart';
import 'package:flexurio_chiron_vendor/src/app/bloc/vendor_query/vendor_query_bloc.dart';
import 'package:flexurio_chiron_vendor/src/app/model/vendors.dart' as model;
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VendorDeleteButton extends StatelessWidget {
  const VendorDeleteButton._({
    required this.vendors,
  });

  static Widget prepare({
    required model.Vendor vendors,
  }) {
    return BlocProvider(
      create: (context) => VendorBloc(),
      child: VendorDeleteButton._(
        vendors: vendors,
      ),
    );
  }

  final model.Vendor vendors;

  @override
  Widget build(BuildContext context) {
    return IconButtonSmall(
      permission: PermissionVendor.vendorDelete,
      action: DataAction.delete,
      onPressed: () async {
        final bloc = context.read<VendorBloc>();
        final queryBloc = context.read<VendorQueryBloc>();
        final success = await _showConfirmationDialog(context, bloc);
        if (success ?? false) {
          queryBloc.add(const VendorQueryEvent.fetch());
        }
      },
    );
  }

  Future<bool?> _showConfirmationDialog(
    BuildContext context,
    VendorBloc bloc,
  ) {
    return showDialog<bool?>(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        const action = DataAction.delete;
        return BlocListener<VendorBloc, VendorState>(
          bloc: bloc,
          listener: (context, state) {
            state.maybeWhen(
              success: () {
                Toast(context).success(Message.successDeleted(Entity.vendor));
                Navigator.pop(context, true);
              },
              error: (error) => Toast(context).fail(error),
              orElse: () {},
            );
          },
          child: BlocBuilder<VendorBloc, VendorState>(
            bloc: bloc,
            builder: (context, state) {
              final isInProgress = state.maybeWhen(
                loading: () => true,
                orElse: () => false,
              );
              return CardConfirmation(
                isProgress: isInProgress,
                action: action,
                data: Entity.vendor,
                label: vendors.name,
                onConfirm: () {
                  bloc.add(VendorEvent.delete(vendors.id));
                },
              );
            },
          ),
        );
      },
    );
  }
}
