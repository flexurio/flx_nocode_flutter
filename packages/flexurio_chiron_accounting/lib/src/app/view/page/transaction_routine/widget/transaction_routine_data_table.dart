import 'package:flexurio_chiron_accounting/src/app/bloc/transaction_routine_query/transaction_routine_query_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/model/transaction_routine.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/transaction_routine/widget/create_button.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/transaction_routine/widget/de_active_button.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/transaction_routine/widget/view_button.dart';

import 'package:appointment/src/app/view/widget/get_user_name.dart';
import 'package:appointment/src/app/view/widget/sliding_switch.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
// import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransactionRoutineDataTable extends StatefulWidget {
  const TransactionRoutineDataTable({super.key});

  static Widget prepare() {
    return BlocProvider(
      create: (_) => TransactionRoutineQueryBloc()
        ..add(const TransactionRoutineQueryEvent.fetch(active: '1')),
      child: const TransactionRoutineDataTable(),
    );
  }

  @override
  State<TransactionRoutineDataTable> createState() =>
      _TransactionRoutineDataTableState();
}

class _TransactionRoutineDataTableState
    extends State<TransactionRoutineDataTable> {
  DataAction _value = DataAction.active;
  final bloc = TransactionRoutineQueryBloc();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionRoutineQueryBloc,
        TransactionRoutineQueryState>(
      builder: (context, state) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: DataTableBackend<TransactionRoutine>(
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
                  .read<TransactionRoutineQueryBloc>()
                  .add(const TransactionRoutineQueryEvent.fetch(active: '1')),
              _value = DataAction.active,
            },
            pageOptions: state.maybeWhen(
              loaded: (data) => data,
              loading: (data) => data,
              orElse: PageOptions.empty,
            ),
            actionRight: (refreshButton) => [
              SlidingSwitch<DataAction>(
                value: _value,
                onToggle: (category) {
                  setState(() {
                    _value = category;
                  });
                  if (_value == DataAction.notActive) {
                    context.read<TransactionRoutineQueryBloc>().add(
                          const TransactionRoutineQueryEvent.fetch(active: '0'),
                        );
                  } else {
                    context.read<TransactionRoutineQueryBloc>().add(
                          const TransactionRoutineQueryEvent.fetch(active: '1'),
                        );
                  }
                },
                options: const [
                  DataAction.active,
                  DataAction.notActive,
                ],
                getLabel: (category) => category.title,
              ),
              refreshButton,
              const TransactionRoutineCreateButton(),
            ],
            onChanged: (pageOptions) {
              if (_value == DataAction.notActive) {
                context.read<TransactionRoutineQueryBloc>().add(
                      TransactionRoutineQueryEvent.fetch(
                        active: '0',
                        pageOptions: pageOptions,
                      ),
                    );
              } else {
                context.read<TransactionRoutineQueryBloc>().add(
                      TransactionRoutineQueryEvent.fetch(
                        active: '1',
                        pageOptions: pageOptions,
                      ),
                    );
              }
            },
            columns: [
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'name'.tr(),
                  backendColumn: 'transaction_routines.title',
                ),
                body: (transactionRoutine) => DataCell(
                  Text(transactionRoutine.title),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'department'.tr(),
                  backendColumn: 'departments.name',
                ),
                body: (transactionRoutine) => DataCell(
                  Text(transactionRoutine.department.name),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'code'.tr(),
                  backendColumn: 'code',
                ),
                body: (transactionRoutine) => DataCell(
                  Text(transactionRoutine.code),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'reference'.tr(),
                  backendColumn: 'reference',
                ),
                body: (transactionRoutine) => DataCell(
                  Text(transactionRoutine.reference),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'chart_of_account_id'.tr(),
                  backendColumn: 'chart_of_account_id',
                ),
                body: (transactionRoutine) => DataCell(
                  Text(transactionRoutine.chartOfAccountNo),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: const DTHead(
                  label: 'Unique',
                  backendColumn: 'unique',
                ),
                body: (transactionRoutine) => DataCell(
                  Text(transactionRoutine.unique),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'value'.tr(),
                  backendColumn: 'value',
                ),
                body: (transactionRoutine) => DataCell(
                  Text(transactionRoutine.value.idr),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'category'.tr(),
                  backendColumn: 'dk',
                ),
                body: (transactionRoutine) {
                  return DataCell(ChipType(transactionRoutine.dk));
                },
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'material_code'.tr(),
                  backendColumn: 'material_id',
                ),
                body: (transactionRoutine) {
                  return DataCell(Text(transactionRoutine.materialId));
                },
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'description'.tr(),
                  backendColumn: 'description',
                ),
                body: (transactionRoutine) {
                  return DataCell(Text(transactionRoutine.description));
                },
              ),
              DTColumn(
                widthFlex: 8,
                head: const DTHead(
                  label: 'Is Auto',
                  backendColumn: 'is_auto',
                ),
                body: (transactionRoutine) => DataCell(
                  BoolIcon(transactionRoutine.isAuto),
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
                body: (transactionRoutine) => DataCell(
                  Row(
                    children: [
                      TransactionRoutineViewButton(
                        transactionRoutine: transactionRoutine,
                      ),
                      if (transactionRoutine.isActive == true)
                        TransactionRouteNotActiveButton.prepare(
                          transactionRoutine: transactionRoutine,
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
