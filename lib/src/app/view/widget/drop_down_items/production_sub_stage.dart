import 'package:flexurio_chiron_production/src/app/bloc/production_sub_stage_query/production_sub_stage_query_bloc.dart';
import 'package:flexurio_chiron_production/src/app/model/production_sub_stage.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/drop_down_object.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FDropDownSearchProductionSubStage extends StatelessWidget
    implements DropDownObject<ProductionSubStage> {
  const FDropDownSearchProductionSubStage({
    required this.onChanged,
    super.key,
    this.initialValue,
    this.isRequired = true,
    this.enabled = true,
    this.label,
  });

  @override
  final ProductionSubStage? initialValue;

  @override
  final void Function(ProductionSubStage? value) onChanged;

  @override
  final bool isRequired;

  @override
  final String? label;

  @override
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    String? Function(ProductionSubStage?)? validator;
    if (isRequired) {
      validator = requiredObjectValidator.call;
    }

    return BlocBuilder<ProductionSubStageQueryBloc,
        ProductionSubStageQueryState>(
      builder: (context, state) {
        return FDropDownSearch<ProductionSubStage>(
          enabled: enabled,
          labelText: label ?? Entity.productionSubStage.title,
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
            loaded: (stage) => stage,
          ),
          itemAsString: (stage) => stage.name,
        );
      },
    );
  }
}
