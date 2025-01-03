import 'package:flexurio_chiron_finance/src/app/bloc/invoice_receive_detail/invoice_receive_detail_bloc.dart';
import 'package:flexurio_chiron_finance/src/app/model/invoice_receive_detail.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InvoiceReceiveDetailDeleteButton extends StatelessWidget {
  const InvoiceReceiveDetailDeleteButton({
    required this.invoiceReceiveDetail,
    super.key,
  });

  final InvoiceReceiveDetail invoiceReceiveDetail;

  static Widget prepare({
    required InvoiceReceiveDetail invoiceReceiveDetail,
  }) {
    return BlocProvider(
      create: (context) => InvoiceReceiveDetailBloc(),
      child: InvoiceReceiveDetailDeleteButton(
        invoiceReceiveDetail: invoiceReceiveDetail,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return IconButtonSmall(
      permission: Permission.invoiceReceiveDelete,
      action: DataAction.delete,
      onPressed: () async {
        final bloc = context.read<InvoiceReceiveDetailBloc>();
        final success = await _showDeleteDialog(context: context, bloc: bloc);
        if (success ?? false) {
          Navigator.pop(context, true);
        }
      },
    );
  }

  Future<bool?> _showDeleteDialog({
    required BuildContext context,
    required InvoiceReceiveDetailBloc bloc,
  }) {
    final entity = Entity.invoiceReceiveDetail;
    const action = DataAction.delete;
    return showDialog<bool?>(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return BlocListener<InvoiceReceiveDetailBloc,
            InvoiceReceiveDetailState>(
          bloc: bloc,
          listener: (context, state) {
            state.maybeWhen(
              success: () {
                Toast(context).dataChanged(action, entity);
                Navigator.pop(context, true);
              },
              error: (error) => Toast(context).fail(error),
              orElse: () {},
            );
          },
          child:
              BlocBuilder<InvoiceReceiveDetailBloc, InvoiceReceiveDetailState>(
            bloc: bloc,
            builder: (context, state) {
              final isInProgress = state.maybeWhen(
                loading: () => true,
                orElse: () => false,
              );
              return CardConfirmation(
                isProgress: isInProgress,
                action: action,
                data: entity,
                onConfirm: () {
                  bloc.add(
                    InvoiceReceiveDetailEvent.delete(
                      invoiceReceiveDetail: invoiceReceiveDetail,
                    ),
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
