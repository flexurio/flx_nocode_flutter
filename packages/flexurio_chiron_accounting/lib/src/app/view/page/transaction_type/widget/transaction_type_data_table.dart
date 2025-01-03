import 'package:flexurio_chiron_accounting/src/app/bloc/transaction_type_query/transaction_type_query_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/model/transaction_type.dart'
    as model;
import 'package:flexurio_chiron_accounting/src/app/view/page/transaction_type/widget/transaction_type_create_button.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/transaction_type/widget/transaction_type_delete_button.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/transaction_type/widget/transaction_type_edit_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransactionTypeDataTable extends StatelessWidget {
  const TransactionTypeDataTable({super.key});

  static Widget prepare() {
    return BlocProvider(
      create: (context) => TransactionTypeQueryBloc()
        ..add(const TransactionTypeQueryEvent.fetch()),
      child: const TransactionTypeDataTable(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionTypeQueryBloc, TransactionTypeQueryState>(
      builder: (context, state) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: DataTableBackend<model.TransactionType>(
            freezeFirstColumn: true,
            freezeLastColumn: true,
            pageOptions: state.maybeWhen(
              loaded: (data) => data,
              loading: (data) => data,
              orElse: PageOptions.empty,
            ),
            onRefresh: () => context
                .read<TransactionTypeQueryBloc>()
                .add(const TransactionTypeQueryEvent.fetch()),
            status: state.maybeWhen(
              loading: (_) => Status.progress,
              loaded: (_) => Status.loaded,
              orElse: () => Status.error,
            ),
            key: ValueKey(state.hashCode),
            actionRight: (refreshButton) => [
              refreshButton,
              const CreateButton(),
            ],
            columns: [
              DTColumn(
                widthFlex: 4,
                head: const DTHead(
                  label: 'ID',
                  backendColumn: 'transaction_types.id',
                ),
                body: (transactionType) => DataCell(
                  Text(transactionType.id),
                ),
              ),
              DTColumn(
                widthFlex: 16,
                head: const DTHead(
                  label: 'Name',
                  backendColumn: 'transaction_types.name',
                ),
                body: (transactionType) => DataCell(
                  Text(
                    getRemainingText(transactionType.name),
                  ),
                ),
              ),
              DTColumn(
                widthFlex: 4,
                head: const DTHead(
                  label: 'Code',
                  backendColumn: 'transaction_types.code',
                ),
                body: (transactionType) => DataCell(
                  Text(
                    transactionType.code,
                  ),
                ),
              ),
              DTColumn(
                widthFlex: 12,
                head: const DTHead(
                  label: 'Flag',
                  backendColumn: 'transaction_types.flag',
                ),
                body: (transactionType) => DataCell(
                  ChipType(transactionType.flag),
                ),
              ),
              DTColumn(
                widthFlex: 12,
                head: DTHead(
                  label: 'type'.tr(),
                  backendColumn: 'type',
                ),
                body: (transactionType) => DataCell(
                  ChipType(transactionType.type),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: const DTHead(
                  label: 'Value',
                  backendColumn: 'transaction_types.value',
                ),
                body: (transactionType) => DataCell(
                  Text(
                    transactionType.value ?? '-',
                  ),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'created_at'.tr(),
                  backendColumn: 'created_at',
                ),
                body: (transactionType) => DataCell(
                  Text(
                    transactionType.createdAt.yMMMdHm,
                  ),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: const DTHead(
                  label: 'Updated At',
                  backendColumn: 'updated_at',
                ),
                body: (transactionType) => DataCell(
                  Text(
                    transactionType.updatedAt.yMMMdHm,
                  ),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: const DTHead(
                  label: 'Actions',
                  backendColumn: null,
                ),
                body: (transactionType) => DataCell(
                  Row(
                    children: [
                      TransactionTypeEditButton(
                        transactionTypes: transactionType,
                      ),
                      TransactionTypeDeleteButton.prepare(
                        id: transactionType.id,
                      ),
                    ],
                  ),
                ),
              ),
            ],
            onChanged: (pageOptions) {
              context.read<TransactionTypeQueryBloc>().add(
                    TransactionTypeQueryEvent.fetch(pageOptions: pageOptions),
                  );
            },
          ),
        );
      },
    );
  }
}

String getRemainingText(String text) {
  final firstIndex = text.indexOf(' ');
  final remaining = firstIndex != -1 ? text.substring(firstIndex + 1) : text;
  return remaining.trim();
}
