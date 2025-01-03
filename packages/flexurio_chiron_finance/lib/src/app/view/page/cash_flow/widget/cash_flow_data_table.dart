import 'package:appointment/constant/company.dart';
import 'package:flexurio_chiron_finance/src/app/bloc/cash_flow_query/cash_flow_query_bloc.dart';
import 'package:flexurio_chiron_finance/src/app/model/cash_flow.dart';
import 'package:flexurio_chiron_finance/src/app/view/page/cash_flow/widget/cash_flow_approve_button.dart';
import 'package:flexurio_chiron_finance/src/app/view/page/cash_flow/widget/cash_flow_create_button.dart';
import 'package:flexurio_chiron_finance/src/app/view/page/cash_flow/widget/cash_flow_open_button.dart';
import 'package:appointment/src/app/view/widget/data_table_set.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CashFlowDataTable extends StatelessWidget {
  const CashFlowDataTable({required this.cashFlowQueryBloc, super.key});

  final CashFlowQueryBloc cashFlowQueryBloc;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CashFlowQueryBloc, CashFlowQueryState>(
      bloc: cashFlowQueryBloc,
      builder: (context, state) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: DataTableSetJanganDipakaiLagi<CashFlow>(
            isError: state.maybeWhen(error: (_) => true, orElse: () => false),
            onRefresh: () => context.read<CashFlowQueryBloc>(),
            // .add(const CashFlowQueryEvent.fetch()),
            key: ValueKey(state.hashCode),
            isProgress: state.maybeWhen(
              loading: () => true,
              orElse: () => false,
            ),
            data: state.maybeWhen(
              loaded: (cashFlow, _) {
                return cashFlow;
              },
              orElse: () => [],
            ),
            title: 'Cash Flow',
            search: (cashFlow) => [
              cashFlow.noTransaction,
              cashFlow.invoice,
              cashFlow.recForm,
              cashFlow.description,
              cashFlow.code,
              cashFlow.subCode,
              cashFlow.status.status,
              cashFlow.bank,
            ],
            actionRight: const [],
            columns: [
              DTColumnX(
                head: DTHeadX(
                  label: Text('date'.tr()),
                  sortNum: (cashFlow) => cashFlow.date.day,
                ),
                body: (cashFlow) => DataCell(
                  Text(cashFlow.date.yMMMd),
                ),
              ),
              DTColumnX(
                head: DTHeadX(
                  label: const Text('Transaction Number'),
                  sortString: (cashFlow) {
                    return cashFlow.noTransaction;
                  },
                ),
                body: (cashFlow) => DataCell(
                  Text(cashFlow.noTransaction),
                ),
              ),
              DTColumnX(
                head: DTHeadX(
                  label: const Text('Invoice'),
                  sortString: (cashFlow) => cashFlow.invoice,
                ),
                body: (cashFlow) => DataCell(
                  Text(cashFlow.invoice),
                ),
              ),
              DTColumnX(
                head: DTHeadX(
                  label: const Text('Receipt From'),
                  sortString: (cashFlow) => cashFlow.recForm,
                ),
                body: (cashFlow) => DataCell(
                  Text(cashFlow.recForm),
                ),
              ),
              DTColumnX(
                head: DTHeadX(
                  label: const Text('Description'),
                  sortString: (cashFlow) => cashFlow.description,
                ),
                body: (cashFlow) => DataCell(
                  Text(cashFlow.description),
                ),
              ),
              DTColumnX(
                head: DTHeadX(
                  label: const Text('Total'),
                  sortNum: (cashFlow) => cashFlow.amount,
                ),
                body: (cashFlow) => DataCell(
                  Text(
                    cashFlow.amount.idr,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.right,
                  ),
                ),
              ),
              DTColumnX(
                head: DTHeadX(
                  label: const Text('Code'),
                  sortString: (cashFlow) => cashFlow.code,
                ),
                body: (cashFlow) => DataCell(
                  Text(cashFlow.code),
                ),
              ),
              DTColumnX(
                head: DTHeadX(
                  label: const Text('Sub Code'),
                  sortString: (cashFlow) => cashFlow.subCode,
                ),
                body: (cashFlow) => DataCell(
                  Text(cashFlow.subCode),
                ),
              ),
              DTColumnX(
                head: DTHeadX(
                  label: const Text('Mutation Date'),
                  sortNum: (cashFlow) => cashFlow.mutationDate.day,
                ),
                body: (cashFlow) => DataCell(
                  Text(
                    DateFormat.yMMMd().format(cashFlow.mutationDate),
                  ),
                ),
              ),
              DTColumnX(
                head: DTHeadX(
                  label: const Text('Transfer Fee'),
                  sortNum: (cashFlow) => cashFlow.transferFee,
                ),
                body: (cashFlow) => DataCell(
                  Text(
                    cashFlow.transferFee.idr,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.right,
                  ),
                ),
              ),
              DTColumnX(
                head: DTHeadX(
                  label: const Text('Total Transfer'),
                  sortNum: (cashFlow) => cashFlow.totalTransfer,
                ),
                body: (cashFlow) => DataCell(
                  Text(cashFlow.totalTransfer.idr),
                ),
              ),
              DTColumnX(
                head: DTHeadX(
                  label: const Text('Bank'),
                  sortString: (cashFlow) => cashFlow.bank,
                ),
                body: (cashFlow) => DataCell(
                  Text(cashFlow.bank),
                ),
              ),
              DTColumnX(
                head: DTHeadX(
                  label: const Text('Status'),
                  sortString: (cashFlow) => cashFlow.status.status,
                ),
                body: (cashFlow) => DataCell(ChipType(cashFlow.status)),
              ),
              DTColumnX(
                head: const DTHeadX(
                  label: Text('Actions'),
                ),
                body: (cashFlow) => DataCell(
                  Row(
                    children: [
                      if (cashFlow.status == CashFlowStatus.open)
                        CashFlowApproveButton.prepare(
                          cashFlow: cashFlow,
                          company: state.maybeWhen(
                            loaded: (_, company) {
                              return company;
                            },
                            orElse: () => Company.metiskaFarma,
                          ),
                        )
                      else
                        CashFlowOpenButton.prepare(
                          cashFlow: cashFlow,
                          company: state.maybeWhen(
                            loaded: (_, company) {
                              return company;
                            },
                            orElse: () => Company.metiskaFarma,
                          ),
                        ),
                      CashFlowEditButton(cashFlow: cashFlow),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
