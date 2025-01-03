import 'package:appointment/src/app/view/widget/data_table_set_2.dart';
import 'package:appointment/src/app/view/widget/get_user_name.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_production/flexurio_chiron_production.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScheduleDetailDataTable extends StatelessWidget {
  const ScheduleDetailDataTable({
    required this.bloc,
    required this.schedule,
    required this.isExternal, super.key,
    this.scheduleDetail,
  });
  final bool isExternal;

  final Schedule schedule;
  final ScheduleDetailQueryBloc bloc;
  final ScheduleDetail? scheduleDetail;

  static Widget prepare({
    required Schedule schedule,
    required ScheduleDetailQueryBloc bloc,
    required bool isExternal, ScheduleDetail? scheduleDetail,
  }) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ScheduleDetailQueryBloc(
            isExternal: isExternal,
          )..add(
              ScheduleDetailQueryEvent.fetch(
                schedule.id,
              ),
            ),
        ),
      ],
      child: ScheduleDetailDataTable(
        scheduleDetail: scheduleDetail,
        bloc: bloc,
        schedule: schedule,
        isExternal: isExternal,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScheduleDetailQueryBloc, ScheduleDetailQueryState>(
      builder: (context, state) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: DataTableSet2<ScheduleDetail>(
            title: '${Entity.schedule.title} - ${schedule.startTime.yMMMMd}',
            search: (scheduleDetail) => [
              scheduleDetail.status.id,
              scheduleDetail.startTime.yMMMMd,
              scheduleDetail.endTime.yMMMMd,
            ],
            key: ValueKey(state.hashCode),
            status: state.maybeWhen(
              loading: () => Status.progress,
              loaded: (_) => Status.loaded,
              orElse: () => Status.error,
            ),
            onRefresh: () => context.read<ScheduleDetailQueryBloc>().add(
                  ScheduleDetailQueryEvent.fetch(schedule.id),
                ),
            data: state.maybeWhen(
              loaded: (scheduleDetails) {
                bloc.add(ScheduleDetailQueryEvent.fetch(schedule.id));
                return scheduleDetails;
              },
              orElse: () => [],
            ),
            actionRight: (refreshButton) => [
              refreshButton,
              if (schedule.isClose == false)
                ScheduleDetailCreateButton(
                  schedule: schedule,
                  scheduleDetail: scheduleDetail,
                  isExternal: isExternal,
                ),
            ],
            columns: [
              DTColumnXX(
                head: DTHeadXX(
                  label: Text('schedule_start'.tr()),
                  sortNum: (scheduleDetail) =>
                      scheduleDetail.startTime.millisecondsSinceEpoch,
                ),
                body: (scheduleDetail) => DataCell(
                  Text(scheduleDetail.startTime.yMMMdHm),
                ),
              ),
              DTColumnXX(
                head: DTHeadXX(
                  label: const Text('Status'),
                  sortString: (scheduleDetail) => scheduleDetail.status.id,
                ),
                body: (scheduleDetail) => DataCell(
                  ChipType(scheduleDetail.status),
                ),
              ),
              DTColumnXX(
                head: DTHeadXX(
                  label: const Text('Cycle'),
                  sortNum: (scheduleDetail) => scheduleDetail.cycle,
                ),
                body: (scheduleDetail) => DataCell(
                  Text(
                    _getStatusLabel(
                        scheduleDetail.status.label, scheduleDetail.cycle,),
                  ),
                ),
              ),
              DTColumnXX(
                head: DTHeadXX(
                  label: const Text('PIC'),
                  sortNum: (scheduleDetail) => scheduleDetail.picId,
                ),
                body: (scheduleDetail) => DataCell(
                  GetNameUser(userId: scheduleDetail.picId),
                ),
              ),
              DTColumnXX(
                head: const DTHeadXX(
                  label: Text('Valid'),
                ),
                body: (scheduleDetail) => DataCell(
                  SizedBox(
                    child: BoolIcon(scheduleDetail.isValid),
                  ),
                ),
              ),
              DTColumnXX(
                head: DTHeadXX(
                  label: Text('actions'.tr()),
                ),
                body: (scheduleDetail) => DataCell(
                  Row(
                    children: [
                      if (scheduleDetail.isValid == false)
                        ScheduleDetailValidateButton.prepare(
                          scheduleDetail: scheduleDetail,
                          isExternal: isExternal,
                        ),
                      if (scheduleDetail.isValid == false)
                        ScheduleDetailEditButton(
                          schedule: schedule,
                          scheduleDetail: scheduleDetail,
                          isExternal: isExternal,
                        ),
                      if (scheduleDetail.isValid == false)
                        ScheduleDetailDeleteButton.prepare(
                          scheduleDetail: scheduleDetail,
                          isExternal: isExternal,
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

String _getStatusLabel(String label, int? cycle) {
  if (cycle == null || cycle <= 1) {
    return '1';
  } else if (label != 'Finish') {
    return '$cycle';
  } else {
    return '-';
  }
}
