import 'package:appointment/src/app/view/widget/drop_down_items/drop_down_object.dart';
import 'package:flexurio_chiron_production/flexurio_chiron_production.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FDropDownSearchProductionStage extends StatelessWidget
    implements DropDownObject<ProductionStage> {
  const FDropDownSearchProductionStage({
    required this.onChanged,
    super.key,
    this.initialValue,
    this.isRequired = true,
    this.enabled = true,
    this.label,
  });

  @override
  final ProductionStage? initialValue;

  @override
  final void Function(ProductionStage? value) onChanged;

  @override
  final bool isRequired;

  @override
  final String? label;

  @override
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    String? Function(ProductionStage?)? validator;
    if (isRequired) {
      validator = requiredObjectValidator.call;
    }

    return BlocBuilder<ProductionStageQueryBloc, ProductionStageQueryState>(
      builder: (context, state) {
        return FDropDownSearch<ProductionStage>(
          enabled: enabled,
          labelText: label ?? Entity.productionStage.title,
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
            loaded: (stage) => stage.data,
          ),
          itemAsString: (stage) => stage.name,
        );
      },
    );
  }

  @override
  // TODO: implement small
  bool get small => throw UnimplementedError();
}
