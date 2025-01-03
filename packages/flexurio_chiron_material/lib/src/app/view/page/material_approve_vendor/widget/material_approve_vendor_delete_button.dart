import 'package:flexurio_chiron_vendor/src/app/bloc/material_approve_vendor/material_approve_vendor_bloc.dart';
import 'package:flexurio_chiron_vendor/src/app/bloc/material_approve_vendor_query/material_approve_vendor_query_bloc.dart';
import 'package:flexurio_chiron_vendor/src/app/model/material_approved_vendor.dart';
import 'package:flexurio_chiron_material/src/app/model/material.dart' as model;
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MaterialApproveVendorDeleteButton extends StatelessWidget {
  const MaterialApproveVendorDeleteButton._({
    required this.material,
    required this.materialApproved,
  });

  static Widget prepare({
    required model.Material material,
    required MaterialApprovedVendor materialApproved,
  }) {
    return BlocProvider(
      create: (context) => MaterialApproveVendorBloc(),
      child: MaterialApproveVendorDeleteButton._(
        material: material,
        materialApproved: materialApproved,
      ),
    );
  }

  final model.Material material;
  final MaterialApprovedVendor materialApproved;

  @override
  Widget build(BuildContext context) {
    return IconButtonSmall(
      permission: Permission.materialApproveVendorListDelete,
      action: DataAction.delete,
      onPressed: () async {
        final bloc = context.read<MaterialApproveVendorBloc>();
        final queryBloc = context.read<MaterialApproveVendorQueryBloc>();
        final success = await _showConfirmationDialog(context, bloc);
        if (success ?? false) {
          queryBloc
              .add(MaterialApproveVendorQueryEvent.fetch(material: material));
        }
      },
    );
  }

  Future<bool?> _showConfirmationDialog(
    BuildContext context,
    MaterialApproveVendorBloc bloc,
  ) {
    return showDialog<bool?>(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        const action = DataAction.delete;
        return BlocListener<MaterialApproveVendorBloc,
            MaterialApproveVendorState>(
          bloc: bloc,
          listener: (context, state) {
            state.maybeWhen(
              success: () {
                Toast(context)
                    .dataChanged(action, Entity.materialApproveVendor);
                Navigator.pop(context, true);
              },
              orElse: () {},
            );
          },
          child: BlocBuilder<MaterialApproveVendorBloc,
              MaterialApproveVendorState>(
            bloc: bloc,
            builder: (context, state) {
              final isInProgress = state.maybeWhen(
                loading: () => true,
                orElse: () => false,
              );
              return CardConfirmation(
                isProgress: isInProgress,
                action: action,
                data: Entity.materialApproveVendor,
                label: materialApproved.id.toString(),
                onConfirm: () {
                  bloc.add(
                    MaterialApproveVendorEvent.delete(materialApproved.id),
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}
