import 'package:flexurio_chiron_accounting/src/app/bloc/transaction_routine/transaction_routine_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/transaction_routine_create/widget/confirm_form.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/transaction_routine_create/widget/transaction_form.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/transaction_routine_create/widget/type_form.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';

class TransactionRoutineCreatePage extends StatefulWidget {
  const TransactionRoutineCreatePage._();

  static Route<bool?> route() {
    return PageTransition(
      opaque: true,
      type: PageTransitionType.rightToLeft,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => TransactionRoutineBloc()),
        ],
        child: const TransactionRoutineCreatePage._(),
      ),
    );
  }

  @override
  State<TransactionRoutineCreatePage> createState() =>
      _TransactionRoutineCreatePageState();
}

class _TransactionRoutineCreatePageState
    extends State<TransactionRoutineCreatePage> {
  var _page = 0;

  @override
  void initState() {
    super.initState();
  }

  void _nextPage() => setState(() => ++_page);
  void _previousPage() => setState(() => --_page);

  @override
  Widget build(BuildContext context) {
    const action = DataAction.create;
    final entity = Entity.transactionRoutine;

    return BlocListener<TransactionRoutineBloc, TransactionRoutineState>(
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
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleFormPanel(
          action: action,
          entity: entity,
          size: SingleFormPanelSize.extraLarge,
          children: [
            MultiForm(
              page: _page,
              titles: [
                'Type',
                'transaction'.tr(),
                'Confirmation',
              ],
              children: [
                TransactionRoutineTypeForm.prepare(
                  onNext: _nextPage,
                  bloc: context.read<TransactionRoutineBloc>(),
                ),
                TransactionRoutineTransactionForm.prepare(
                  onNext: _nextPage,
                  onPrevious: _previousPage,
                  bloc: context.read<TransactionRoutineBloc>(),
                ),
                TransactionRoutineConfirmForm.prepare(
                  onPrevious: _previousPage,
                  bloc: context.read<TransactionRoutineBloc>(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
