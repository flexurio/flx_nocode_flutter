import 'package:flexurio_chiron_accounting/src/app/bloc/transaction_type_query/transaction_type_query_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/model/transaction_type.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/drop_down_object.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FDropDownSearchTransactionType extends StatelessWidget
    implements DropDownObject<TransactionType> {
  const FDropDownSearchTransactionType({
    required this.onChanged,
    super.key,
    this.initialValue,
    this.itemAsString,
    this.isRequired = true,
    this.enabled = true,
    this.label,
  });

  @override
  final TransactionType? initialValue;

  @override
  final void Function(TransactionType?) onChanged;

  final String Function(TransactionType)? itemAsString;

  @override
  final bool isRequired;

  @override
  final String? label;

  @override
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    String? Function(TransactionType?)? validator;
    if (isRequired) {
      validator = requiredObjectValidator.call;
    }

    return BlocBuilder<TransactionTypeQueryBloc, TransactionTypeQueryState>(
      builder: (context, state) {
        return FDropDownSearch<TransactionType>(
          enabled: enabled,
          labelText: label ?? Entity.transactionType.title,
          validator: validator,
          initialValue: initialValue,
          onChanged: onChanged,
          itemAsString: itemAsString ??
              (transactionType) =>
                  '${transactionType.id} - ${transactionType.name}',
          items: state.maybeWhen(
            loaded: (transactionTypes) => transactionTypes.data
                .distinct((transactionType) => transactionType.id),
            orElse: () => [],
          ),
          status: state.maybeWhen(
            error: (_) => Status.error,
            loading: (_) => Status.progress,
            orElse: () => Status.loaded,
          ),
        );
      },
    );
  }
}



class FDropDownSearchSmallTransactionType extends StatelessWidget
    implements DropDownObject<TransactionType> {
  const FDropDownSearchSmallTransactionType({
    required this.onChanged,
    required this.width,
    super.key,
    this.initialValue,
    this.isRequired = true,
    this.enabled = true,
    this.label,
  });

  @override
  final TransactionType? initialValue;

  @override
  final void Function(TransactionType?) onChanged;

  @override
  final String? label;

  @override
  final bool isRequired;

  @override
  final bool enabled;

  final double width;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionTypeQueryBloc, TransactionTypeQueryState>(
      builder: (context, state) {
        return FDropDownSearchSmall<TransactionType>(
          width: width,
          labelText: label ?? Entity.transactionType.title,
          onChanged: onChanged,
          iconField: Icons.business_rounded,
          initialValue: initialValue,
          items: state.maybeWhen(
            orElse: () => [],
            loaded: (transactionType) => transactionType.data,
          ),
          itemAsString: (transactionType) => transactionType.name,
        );
      },
    );
  }
}
