import 'package:flexurio_chiron_finance/src/app/bloc/currency_query/currency_query_bloc.dart';
import 'package:flexurio_chiron_finance/src/app/model/currency.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/drop_down_object.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FDropDownSearchCurrency extends StatelessWidget
    implements DropDownObject<Currency> {
  const FDropDownSearchCurrency({
    required this.onChanged,
    super.key,
    this.initialValue,
    this.isRequired = true,
    this.enabled = true,
    this.label,
  });

  @override
  final Currency? initialValue;

  @override
  final void Function(Currency?) onChanged;

  @override
  final bool isRequired;

  @override
  final String? label;

  @override
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    String? Function(Currency?)? validator;
    if (isRequired) {
      validator = requiredObjectValidator.call;
    }

    return BlocBuilder<CurrencyQueryBloc, CurrencyQueryState>(
      builder: (context, state) {
        return FDropDownSearch<Currency>(
          enabled: enabled,
          labelText: label ?? Entity.currency.title,
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
            loaded: (currency) => currency.data,
          ),
          itemAsString: (currency) => currency.id,
        );
      },
    );
  }
}
