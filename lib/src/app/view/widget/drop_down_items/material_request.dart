import 'package:flexurio_chiron_purchase_request/src/app/bloc/material_request_query/material_request_query_bloc.dart';
import 'package:flexurio_chiron_purchase_request/src/app/model/purchase_request.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/drop_down_object.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FDropDownSearchMaterialRequest extends StatelessWidget
    implements DropDownObject<MaterialRequest> {
  const FDropDownSearchMaterialRequest({
    required this.onChanged,
    super.key,
    this.initialValue,
    this.isRequired = true,
    this.enabled = true,
    this.label,
  });

  @override
  final MaterialRequest? initialValue;

  @override
  final void Function(MaterialRequest?) onChanged;

  @override
  final bool isRequired;

  @override
  final String? label;

  @override
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    String? Function(MaterialRequest?)? validator;
    if (isRequired) {
      validator = requiredObjectValidator.call;
    }

    return BlocBuilder<PurchaseRequestQueryBloc, PurchaseRequestQueryState>(
      builder: (context, state) {
        return FDropDownSearch<MaterialRequest>(
          enabled: enabled,
          labelText: label ?? Entity.purchaseRequest.title,
          onChanged: onChanged,
          initialValue: initialValue,
          validator: validator,
          status: state.maybeWhen(
            error: (_) => Status.error,
            loading: (_) => Status.progress,
            orElse: () => Status.loaded,
          ),
          items: state.maybeWhen(
            orElse: () => [],
            loaded: (materialRequest) => materialRequest.data,
          ),
          itemAsString: (materialRequest) => materialRequest.id,
        );
      },
    );
  }
}
