import 'package:appointment/src/app/view/widget/data_table_set.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_production/flexurio_chiron_production.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WorkHourShiftDataTable extends StatelessWidget {
  const WorkHourShiftDataTable._();

  static Widget prepare() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => WorkHourShiftQueryBloc()
            ..add(const WorkHourShiftQueryEvent.get()),
        ),
      ],
      child: const WorkHourShiftDataTable._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkHourShiftQueryBloc, WorkHourShiftQueryState>(
      builder: (context, state) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: DataTableSetJanganDipakaiLagi<WorkHourShift>(
            isError: state.maybeWhen(error: (_) => true, orElse: () => false),
            key: ValueKey(state.hashCode),
            isProgress: state.maybeWhen(
              loading: () => true,
              orElse: () => false,
            ),
            data: state.maybeWhen(
              loaded: (tickets) {
                return tickets;
              },
              orElse: () => [],
            ),
            title: 'Shift',
            onRefresh: () => context
                .read<WorkHourShiftQueryBloc>()
                .add(const WorkHourShiftQueryEvent.get()),
            search: (workHourShift) => [
              workHourShift.id.toString(),
              workHourShift.name,
              workHourShift.periodStart.yMMMd,
              workHourShift.periodEnd.yMMMd,
            ],
            actionRight: const [
              CreateButton(),
            ],
            columns: [
              DTColumnX(
                head: DTHeadX(
                  label: const Text('ID'),
                  sortNum: (workHourShift) => workHourShift.id,
                ),
                body: (workHourShift) => DataCell(
                  Text(workHourShift.id.toString()),
                ),
              ),
              DTColumnX(
                head: DTHeadX(
                  label: const Text('Name'),
                  sortString: (workHourShift) => workHourShift.name,
                ),
                body: (workHourShift) => DataCell(
                  Text(workHourShift.name),
                ),
              ),
              DTColumnX(
                head: DTHeadX(
                  label: const Text('Period Start'),
                  sortNum: (workHourShift) =>
                      workHourShift.periodStart.millisecondsSinceEpoch,
                ),
                body: (workHourShift) => DataCell(
                  Text(workHourShift.periodStart.yMMMd),
                ),
              ),
              DTColumnX(
                head: DTHeadX(
                  label: const Text('Period End'),
                  sortNum: (workHourShift) =>
                      workHourShift.periodEnd.millisecondsSinceEpoch,
                ),
                body: (workHourShift) => DataCell(
                  Text(workHourShift.periodEnd.yMMMd),
                ),
              ),
              DTColumnX(
                head: DTHeadX(
                  label: Text('created_at'.tr()),
                  sortNum: (workHourShift) =>
                      workHourShift.createdAt.millisecond,
                ),
                body: (workHourShift) => DataCell(
                  Text(workHourShift.createdAt.yMMMdHm),
                ),
              ),
              DTColumnX(
                head: DTHeadX(
                  label: const Text('Updated At'),
                  sortNum: (workHourShift) =>
                      workHourShift.updatedAt.millisecond,
                ),
                body: (workHourShift) => DataCell(
                  Text(workHourShift.updatedAt.yMMMdHm),
                ),
              ),
              DTColumnX(
                head: const DTHeadX(
                  label: Text('Actions'),
                ),
                body: (workHourShift) => DataCell(
                  Row(
                    children: [
                      ScheduleButton(
                          workHourShift: workHourShift, isExternal: false,),
                      UpdateButton(workHourShift: workHourShift),
                      DeleteButton.prepare(id: workHourShift.id),
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
