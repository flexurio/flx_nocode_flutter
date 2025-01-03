import 'package:appointment/src/app/view/widget/drop_down_items/drop_down_object.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_production/flexurio_chiron_production.dart';
// import 'package:flexurio_chiron_production/src/app/bloc/production_order_query_bloc.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FDropDownSearchProductionOrder extends StatelessWidget
    implements DropDownObject<ProductionOrder> {
  const FDropDownSearchProductionOrder({
    required this.onChanged,
    super.key,
    this.initialValue,
    this.isRequired = true,
    this.enabled = true,
    this.label,
  });

  @override
  final ProductionOrder? initialValue;

  @override
  final void Function(ProductionOrder?) onChanged;

  @override
  final String? label;

  @override
  final bool isRequired;

  @override
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    String? Function(ProductionOrder?)? validator;
    if (isRequired) {
      validator = requiredObjectValidator.call;
    }

    return BlocBuilder<ProductionOrderQueryBloc, ProductionOrderQueryState>(
      builder: (context, state) {
        return FDropDownSearch<ProductionOrder>(
          labelText: label ?? 'batch_no'.tr(),
          onChanged: onChanged,
          initialValue: initialValue,
          validator: validator,
          enabled: enabled,
          status: state.maybeWhen(
            error: (_) => Status.error,
            loading: (_) => Status.progress,
            orElse: () => Status.loaded,
          ),
          items: state.maybeWhen(
            orElse: () => [],
            loaded: (productionOrders) => productionOrders.data,
          ),
          itemAsString: (productionOrder) => productionOrder.id,
        );
      },
    );
  }
}
