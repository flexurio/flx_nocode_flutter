import 'package:flexurio_chiron_tax/src/app/bloc/tax_invoice_number/tax_invoice_number_bloc.dart';
import 'package:flexurio_chiron_tax/src/app/bloc/tax_invoice_number_query/tax_invoice_number_query_bloc.dart';
import 'package:flexurio_chiron_tax/src/app/model/tax_invoice_number.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaxInvoiceNumberDeleteButton extends StatelessWidget {
  const TaxInvoiceNumberDeleteButton({
    required this.taxInvoiceNumber,
    super.key,
  });

  static Widget prepare({
    required TaxInvoiceNumber taxInvoiceNumber,
  }) {
    return BlocProvider(
      create: (context) => TaxInvoiceNumberBloc(),
      child: TaxInvoiceNumberDeleteButton(
        taxInvoiceNumber: taxInvoiceNumber,
      ),
    );
  }

  final TaxInvoiceNumber taxInvoiceNumber;

  @override
  Widget build(BuildContext context) {
    const action = DataAction.delete;
    final entity = Entity.taxInvoiceNumber;
    final deleteBloc = context.read<TaxInvoiceNumberBloc>();
    final queryBloc = context.read<TaxInvoiceNumberQueryBloc>();
    const queryEvent = TaxInvoiceNumberQueryEvent.fetch();
    return IconButtonSmall(
      action: action,
      permission: Permission.taxInvoiceNumberDelete,
      onPressed: () {
        _showDeleteDialog(context, deleteBloc).then((value) {
          if (value ?? false) {
            Toast(context).success(Message.successDeleted(entity));
            queryBloc.add(queryEvent);
          }
        });
      },
    );
  }

  Future<bool?> _showDeleteDialog(
    BuildContext context,
    TaxInvoiceNumberBloc bloc,
  ) {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        const action = DataAction.delete;
        final entity = Entity.taxInvoiceNumber;
        return BlocListener<TaxInvoiceNumberBloc, TaxInvoiceNumberState>(
          bloc: bloc,
          listener: (context, state) {
            state.maybeWhen(
              orElse: () {},
              error: (error) => Toast(context).fail(error),
              success: () {
                Navigator.pop(context, true);
              },
            );
          },
          child: BlocBuilder<TaxInvoiceNumberBloc, TaxInvoiceNumberState>(
            bloc: bloc,
            builder: (context, state) {
              final isInProgress = state.maybeWhen(
                orElse: () => false,
                loading: () => true,
              );
              return CardConfirmation(
                isProgress: isInProgress,
                action: action,
                data: entity,
                label: taxInvoiceNumber.prefix,
                onConfirm: () {
                  bloc.add(
                    TaxInvoiceNumberEvent.delete(id: taxInvoiceNumber.id),
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
