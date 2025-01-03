import 'package:flexurio_chiron_accounting/src/app/bloc/transaction_non_order_query/transaction_non_order_query_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/model/transaction_non_order.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/transaction_non_order/widget/create_button.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/transaction_non_order/widget/delete_button.dart';
import 'package:appointment/src/app/view/widget/get_user_name.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransactionNonOrderDataTable extends StatelessWidget {
  const TransactionNonOrderDataTable({super.key});

  static Widget prepare() {
    return BlocProvider(
      create: (context) => TransactionNonOrderQueryBloc()
        ..add(const TransactionNonOrderQueryEvent.fetch()),
      child: const TransactionNonOrderDataTable(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionNonOrderQueryBloc,
        TransactionNonOrderQueryState>(
      builder: (context, state) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: DataTableBackend<TransactionNonOrder>(
            freezeFirstColumn: true,
            freezeLastColumn: true,
            key: ValueKey(state.hashCode),
            status: state.maybeWhen(
              loading: (_) => Status.progress,
              loaded: (_) => Status.loaded,
              orElse: () => Status.error,
            ),
            onRefresh: () => {
              context
                  .read<TransactionNonOrderQueryBloc>()
                  .add(const TransactionNonOrderQueryEvent.fetch()),
            },
            pageOptions: state.maybeWhen(
              loaded: (data) => data,
              loading: (data) => data,
              orElse: PageOptions.empty,
            ),
            actionRight: (refreshButton) => [
              refreshButton,
              const TransactionNonOrderCreateButton(),
            ],
            onChanged: (pageOptions) {
              context.read<TransactionNonOrderQueryBloc>().add(
                    TransactionNonOrderQueryEvent.fetch(
                      pageOptions: pageOptions,
                    ),
                  );
            },
            columns: [
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'transaction_number'.tr(),
                  backendColumn: 'non_orders.transaction_no',
                ),
                body: (transactionNonOrder) => DataCell(
                  Text(transactionNonOrder.transactionNo),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'transaction_date'.tr(),
                  backendColumn: 'transaction_date',
                ),
                body: (transactionNonOrder) => DataCell(
                  Text(transactionNonOrder.transactionDate.yMMMdHm),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'name'.tr(),
                  backendColumn: 'non_orders.title',
                ),
                body: (transactionNonOrder) => DataCell(
                  Text(transactionNonOrder.title),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'chart_of_account_id'.tr(),
                  backendColumn: 'chart_of_account_id',
                ),
                body: (transactionNonOrder) => DataCell(
                  Text(transactionNonOrder.chartOfAccountNo),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: const DTHead(
                  label: 'Unique',
                  backendColumn: 'unique',
                ),
                body: (transactionNonOrder) => DataCell(
                  Text(transactionNonOrder.unique),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  numeric: true,
                  label: 'value'.tr(),
                  backendColumn: 'value',
                ),
                body: (transactionNonOrder) => DataCell(
                  Text(transactionNonOrder.value.format()),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'type'.tr(),
                  backendColumn: 'type',
                ),
                body: (transactionNonOrder) => DataCell(
                  ChipType(transactionNonOrder.type),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'created_by'.tr(),
                  backendColumn: 'created_by_id',
                ),
                body: (customer) => DataCell(
                  GetNameUser(userId: customer.createdById),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'created_at'.tr(),
                  backendColumn: 'created_at',
                ),
                body: (customer) => DataCell(
                  Text(customer.createdAt.yMMMdHm),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: const DTHead(
                  label: 'Updated By',
                  backendColumn: 'updated_by_id',
                ),
                body: (customer) => DataCell(
                  GetNameUser(userId: customer.createdById),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'updated_at'.tr(),
                  backendColumn: 'updated_at',
                ),
                body: (customer) => DataCell(
                  Text(customer.updatedAt.yMMMdHm),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'actions'.tr(),
                  backendColumn: null,
                ),
                body: (transactionNonOrder) => DataCell(
                  Row(
                    children: [
                      TransactionNonOrderDeleteButton.prepare(
                        transactionNonOrder: transactionNonOrder,
                      ),
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
