import 'package:appointment/src/app/view/widget/drop_down_items/drop_down_object.dart';
import 'package:flexurio_chiron_material_stock/flexurio_chiron_material_stock.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FDropDownSearchMaterialIssueDetail extends StatelessWidget
    implements DropDownObject<MaterialIssueDetail> {
  const FDropDownSearchMaterialIssueDetail({
    required this.onChanged,
    super.key,
    this.initialValue,
    this.isRequired = true,
    this.label,
    this.enabled = true,
  });

  @override
  final MaterialIssueDetail? initialValue;

  @override
  final void Function(MaterialIssueDetail?) onChanged;

  @override
  final bool isRequired;

  @override
  final String? label;

  @override
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    String? Function(MaterialIssueDetail?)? validator;
    if (isRequired) {
      validator = requiredObjectValidator.call;
    }

    return BlocBuilder<MaterialIssueDetailQueryBloc,
        MaterialIssueDetailQueryState>(
      builder: (context, state) {
        return FDropDownSearch<MaterialIssueDetail>(
          enabled: enabled,
          labelText: label ?? EntityMaterialStock.materialIssueDetail.title,
          onChanged: onChanged,
          initialValue: initialValue,
          validator: validator,
          itemAsString: (data) => '${data.material.name} - ${data.na}',
          items: state.maybeWhen(
            orElse: () => [],
            loaded: (data) => data.data,
          ),
          status: state.maybeWhen(
            orElse: () => Status.loaded,
            error: (_) => Status.error,
            loading: (_) => Status.progress,
          ),
        );
      },
    );
  }
}
