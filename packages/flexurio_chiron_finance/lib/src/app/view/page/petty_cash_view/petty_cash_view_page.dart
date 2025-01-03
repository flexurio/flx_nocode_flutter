import 'package:flexurio_chiron_finance/flexurio_chiron_finance.dart';
import 'package:flexurio_chiron_finance/src/app/view/page/petty_cash/widget/document_receive_button.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PettyCashViewPage extends StatelessWidget {
  const PettyCashViewPage._({required this.pettyCash});
  final PettyCash pettyCash;

  static Route<void> route(PettyCash pettyCash) {
    return MaterialPageRoute(
      builder: (context) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                PettyCashBloc()..add(PettyCashEvent.initialize(pettyCash)),
          ),
          BlocProvider(
            create: (context) => PettyCashQueryBloc()
              ..add(PettyCashQueryEvent.fetchById(pettyCash.id)),
          ),
        ],
        child: PettyCashViewPage._(pettyCash: pettyCash),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: BlocBuilder<PettyCashQueryBloc, PettyCashQueryState>(
        builder: (context, state) {
          return state.maybeWhen(
            orElse: SomethingWrong.new,
            loading: (_) => const ProgressingIndicator(),
            loaded: (pageOptions) {
              final pettyCash = pageOptions.data.first;
              return SingleFormPanel(
                action: DataAction.view,
                entity: Entity.pettyCash,
                size: SingleFormPanelSize.large,
                actions: _buildPettyCashActions(pettyCash, context),
                children: [
                  PettyCashCreateReviewForm(
                    pettyCash: pageOptions.data.first,
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }

  List<Widget> _buildPettyCashActions(
      PettyCash pettyCash, BuildContext context) {
    final pettyCashBloc = context.read<PettyCashBloc>();

    return [
      if (pettyCash.status.isApproveAccounting ||
          pettyCash.status.isApproveFinance ||
          pettyCash.status.isClose)
        PettyCashReportFormButton.prepare(pettyCash),
      if (pettyCash.realizationNo != null) 
        PettyCashReportGeneralExpenseButton.prepare(pettyCash),
      if (pettyCash.status.isInput) ...[
        PettyCashApproveManagerButton.prepare(pettyCash),
        PettyCashRejectManagerButton.prepare(pettyCash),
      ],
      if (pettyCash.status.isApproveManager) ...[
        PettyCashApproveAccountingButton.prepare(pettyCash),
        PettyCashRejectAccountingButton.prepare(pettyCash),
      ],
      if (pettyCash.status.isApproveAccounting) ...[
        PettyCashRealizationButton.prepare(
          pettyCash: pettyCash,
          pettyCashBloc: pettyCashBloc,
        ),
        if (pettyCash.realizationAmount != 0 &&
            pettyCash.documentReceiveBy == 0)
          PettyCashDocumentReceiveButton.prepare(pettyCash),
      ],
      if (pettyCash.canApproveFinance) ...[
        PettyCashApproveFinanceButton.prepare(pettyCash),
        PettyCashRejectFinanceButton.prepare(pettyCash),
      ],
      if (pettyCash.status.isApproveFinance)
        PettyCashCloseButton.prepare(pettyCash),
    ];
  }
}
