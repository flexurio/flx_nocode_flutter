import 'package:flexurio_chiron_accounting/src/app/bloc/transaction_routine/transaction_routine_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/model/transaction_routine.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/transaction_routine_create/widget/confirm_form_data.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/transaction_routine_create/widget/confirm_form_detail_tabel.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class TransactionRoutineConfirmForm extends StatefulWidget {
  const TransactionRoutineConfirmForm({
    required this.onPrevious,
    required this.bloc,
    super.key,
  });

  final void Function() onPrevious;
  final TransactionRoutineBloc bloc;

  static Widget prepare({
    required void Function() onPrevious,
    required TransactionRoutineBloc bloc,
  }) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => bloc,
        ),
      ],
      child: TransactionRoutineConfirmForm(
        bloc: bloc,
        onPrevious: onPrevious,
      ),
    );
  }

  @override
  State<TransactionRoutineConfirmForm> createState() =>
      _TransactionRoutineConfirmFormState();
}

class _TransactionRoutineConfirmFormState
    extends State<TransactionRoutineConfirmForm> {
  TransactionRoutineHeader? _transactionRoutineHeader;
  List<TransactionRoutineDetail>? _transactionRoutineDetail = [];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionRoutineBloc, TransactionRoutineState>(
      builder: (context, state) {
        state.maybeWhen(
          initial: (transactionRoutineHeader, transactionRoutineDetail) {
            if (transactionRoutineHeader != null) {
              _transactionRoutineHeader = transactionRoutineHeader;
            }
            if (transactionRoutineDetail != null) {
              _transactionRoutineDetail = transactionRoutineDetail;
            }
          },
          orElse: () {},
        );

        if (_transactionRoutineHeader == null ||
            _transactionRoutineDetail == null) {
          return const Center(child: CupertinoActivityIndicator());
        }

        return FormAction(
          actions: [
            Button(
              permission: null,
              isSecondary: true,
              action: DataAction.back,
              onPressed: () {
                widget.onPrevious();
              },
            ),
            const Gap(12),
            Button(
              permission: null,
              action: DataAction.finish,
              onPressed: () {
                _submit(context);
              },
            ),
          ],
          children: [
            ConfirmFormData(
              transactionRoutineHeader: _transactionRoutineHeader,
            ),
            const Gap(24),
            ConfirmFormDetailTable(
              transactionRoutineDetails: _transactionRoutineDetail,
            ),
          ],
        );
      },
    );
  }

  void _submit(BuildContext context) {
    final bloc = widget.bloc;
    const action = DataAction.create;
    showDialog<bool?>(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return BlocListener<TransactionRoutineBloc, TransactionRoutineState>(
          bloc: bloc,
          listener: (context, state) {
            state.maybeWhen(
              success: () {
                Toast(context).dataChanged(
                  action,
                  Entity.transactionRoutine,
                );
                Navigator.pop(context, true);
              },
              error: (error) => Toast(context).fail(error),
              orElse: () {},
            );
          },
          child: BlocBuilder<TransactionRoutineBloc, TransactionRoutineState>(
            bloc: bloc,
            builder: (context, state) {
              final isInProgress = state.maybeWhen(
                loading: () => true,
                orElse: () => false,
              );
              return CardConfirmation(
                isProgress: isInProgress,
                action: action,
                data: Entity.transactionRoutine,
                label: _transactionRoutineHeader!.title,
                onConfirm: () {
                  bloc.add(
                    TransactionRoutineEvent.create(
                      transactionRoutineHeader: _transactionRoutineHeader,
                      transactionRoutineDetail: _transactionRoutineDetail,
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
