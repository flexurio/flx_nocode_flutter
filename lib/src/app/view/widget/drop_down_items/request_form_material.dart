import 'package:appointment/src/app/view/widget/drop_down_items/drop_down_object.dart';
import 'package:flexurio_chiron_purchase_request/flexurio_chiron_purchase_request.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FDropDownSearchRequestFormMaterial extends StatelessWidget
    implements DropDownObject<RequestFormMaterial> {
  const FDropDownSearchRequestFormMaterial({
    required this.onChanged,
    super.key,
    this.initialValue,
    this.isRequired = true,
    this.enabled = true,
    this.label,
  });

  @override
  final RequestFormMaterial? initialValue;

  @override
  final void Function(RequestFormMaterial?) onChanged;

  @override
  final bool isRequired;

  @override
  final String? label;

  @override
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    String? Function(RequestFormMaterial?)? validator;
    if (isRequired) {
      validator = requiredObjectValidator.call;
    }

    return BlocBuilder<RequestFormMaterialQueryBloc,
        RequestFormMaterialQueryState>(
      builder: (context, state) {
        return FDropDownSearch<RequestFormMaterial>(
          enabled: enabled,
          labelText: label ?? Entity.material.title,
          onChanged: onChanged,
          initialValue: initialValue,
          validator: validator,
          status: state.maybeWhen(
            error: (_) => Status.error,
            loading: () => Status.progress,
            orElse: () => Status.loaded,
          ),
          items: state.maybeWhen(
            orElse: () => [],
            loaded: (requestFormMaterial) => requestFormMaterial,
          ),
          itemAsString: (requestFormMaterial) => requestFormMaterial.name,
        );
      },
    );
  }
}
