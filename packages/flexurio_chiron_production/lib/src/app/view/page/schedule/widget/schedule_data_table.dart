import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_production/flexurio_chiron_production.dart';
import 'package:flexurio_chiron_production/src/app/view/page/schedule/widget/production_data_report_export_excel_button.dart';
import 'package:flexurio_chiron_production/src/app/view/page/schedule/widget/production_monitoring_report_excel_button.dart';
import 'package:flexurio_chiron_production/src/app/view/page/schedule/widget/report_man_hour_production_export_excel_button.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScheduleDataTable extends StatefulWidget {
  const ScheduleDataTable({
    required this.isExternal, super.key,
  });
  final bool isExternal;

  static Widget prepare({
    required bool isExternal,
  }) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ScheduleQueryBloc(
            isExternal: isExternal,
          )..add(const ScheduleQueryEvent.fetch()),
        ),
        BlocProvider(
          create: (context) => ScheduleDetailQueryBloc(
            isExternal: isExternal,
          ),
        ),
      ],
      child: ScheduleDataTable(isExternal: isExternal),
    );
  }

  @override
  State<ScheduleDataTable> createState() => _ScheduleDataTableState();
}

class _ScheduleDataTableState extends State<ScheduleDataTable> {
  final _scheduleDetails = <ScheduleDetail>[];

  @override
  Widget build(BuildContext context) {
    return BlocListener<ScheduleDetailQueryBloc, ScheduleDetailQueryState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          loaded: (scheduleDetail) {
            _scheduleDetails.addAll(scheduleDetail);
            setState(() {});
          },
        );
      },
      child: BlocListener<ScheduleQueryBloc, ScheduleQueryState>(
        listener: (context, state) {
          state.maybeWhen(
            orElse: () {},
            loaded: (pageOptions) {
              for (final data in pageOptions.data) {
                context.read<ScheduleDetailQueryBloc>().add(
                      ScheduleDetailQueryEvent.fetch(data.id),
                    );
              }
            },
          );
        },
        child: BlocBuilder<ScheduleQueryBloc, ScheduleQueryState>(
          builder: (context, state) {
            return SizedBox(
              width: MediaQuery.of(context).size.width,
              child: DataTableBackend<Schedule>(
                freezeFirstColumn: true,
                freezeLastColumn: true,
                onRefresh: () => context
                    .read<ScheduleQueryBloc>()
                    .add(const ScheduleQueryEvent.fetch()),
                key: ValueKey(state.hashCode),
                status: state.maybeWhen(
                  orElse: () => Status.error,
                  loading: (_) => Status.progress,
                  loaded: (_) => Status.loaded,
                ),
                pageOptions: state.maybeWhen(
                  loaded: (data) => data,
                  loading: (data) => data,
                  orElse: PageOptions.empty,
                ),
                onChanged: (pageOptions) {
                  context.read<ScheduleQueryBloc>().add(
                        ScheduleQueryEvent.fetch(
                          pageOptions: pageOptions,
                        ),
                      );
                },
                actionRight: (refreshButton) => [
                  ProductionDataReportExportExcelButton(
                    isExternal: widget.isExternal,
                  ),
                  ReportManHourProductionExportExcelButton(
                    isExternal: widget.isExternal,
                  ),
                  const ProductionMonitoringReportExportExcelButton(),
                  refreshButton,
                  ScheduleCreateButton(isExternal: widget.isExternal),
                ],
                columns: [
                  DTColumn(
                    widthFlex: 12,
                    head: DTHead(
                      backendColumn:
                          'ProductionStageProcess.ProductionSubStage.name',
                      label: 'stage'.tr(),
                    ),
                    body: (schedule) => DataCell(
                      Text(
                        schedule.productionStageProcess.productionSubStage.name,
                      ),
                    ),
                  ),
                  DTColumn(
                    widthFlex: 12,
                    head: DTHead(
                      backendColumn:
                          'ProductionStageProcess.ProductionMachine.name',
                      label: 'machine'.tr(),
                    ),
                    body: (schedule) => DataCell(
                      Text(
                        schedule.productionStageProcess.productionMachine.name,
                      ),
                    ),
                  ),
                  DTColumn(
                    widthFlex: 8,
                    head: DTHead(
                      backendColumn:
                          'ProductionStageProcess.ProductionLine.name',
                      label: 'line'.tr(),
                    ),
                    body: (schedule) => DataCell(
                      Text(schedule.productionStageProcess.productionLine.name),
                    ),
                  ),
                  DTColumn(
                    widthFlex: 12,
                    head: DTHead(
                      backendColumn: 'Product.name',
                      label: 'product'.tr(),
                    ),
                    body: (schedule) => DataCell(
                      Text(schedule.product.name),
                    ),
                  ),
                  DTColumn(
                    widthFlex: 6,
                    head: DTHead(
                      backendColumn: 'ProductionOrder.id',
                      label: 'batch'.tr(),
                    ),
                    body: (schedule) => DataCell(
                      Text(schedule.productionOrder.id).canCopy(),
                    ),
                  ),
                  DTColumn(
                    widthFlex: 6,
                    head: DTHead(
                      backendColumn: 'WorkHourShift.name',
                      label: 'shift'.tr(),
                    ),
                    body: (schedule) => DataCell(
                      Text(
                        schedule.workHourShift.name == ''
                            ? '-'
                            : schedule.workHourShift.name,
                      ),
                    ),
                  ),
                  DTColumn(
                    widthFlex: 6,
                    head: DTHead(
                      numeric: true,
                      backendColumn: 'quantity_person',
                      label: 'quantity_person'.tr(),
                    ),
                    body: (schedule) => DataCell(
                      Text(schedule.quantityMan.toString()),
                    ),
                  ),
                  DTColumn(
                    widthFlex: 6,
                    head: DTHead(
                      numeric: true,
                      backendColumn: 'yield',
                      label: 'yield'.tr(),
                    ),
                    body: (schedule) => DataCell(
                      Text(schedule.yield.thousandSeparator()),
                    ),
                  ),
                  DTColumn(
                    widthFlex: 6,
                    head: DTHead(
                      backendColumn: 'close',
                      label: 'close'.tr(),
                    ),
                    body: (schedule) => DataCell(
                      SizedBox(child: BoolIcon(schedule.isClose)),
                    ),
                  ),
                  DTColumn(
                    widthFlex: 6,
                    head: DTHead(
                      backendColumn: 'toll_in',
                      label: 'toll_in'.tr(),
                    ),
                    body: (schedule) => DataCell(
                      SizedBox(child: BoolIcon(schedule.isToll)),
                    ),
                  ),
                  DTColumn(
                    widthFlex: 6,
                    head: DTHead(
                      backendColumn: 'schedule_start',
                      label: 'schedule_start'.tr(),
                    ),
                    body: (schedule) => DataCell(
                      Text(schedule.startTime.yMMMdHm),
                    ),
                  ),
                  DTColumn(
                    widthFlex: 6,
                    head: DTHead(
                      backendColumn: 'schedule_end',
                      label: 'schedule_end'.tr(),
                    ),
                    body: (schedule) => DataCell(
                      Text(schedule.endTime.yMMMdHm),
                    ),
                  ),
                  DTColumn(
                    widthFlex: 6,
                    head: DTHead(
                      backendColumn: 'overtime',
                      label: 'overtime'.tr(),
                    ),
                    body: (schedule) => DataCell(
                      Text('${schedule.overTime} minutes'),
                    ),
                  ),
                  DTColumn(
                    widthFlex: 6,
                    head: DTHead(
                      backendColumn: 'actual_start_time',
                      label: 'actual_start'.tr(),
                    ),
                    body: (schedule) {
                      final details = _scheduleDetails
                          .where((e) => e.scheduleId == schedule.id)
                          .toList();
                      final detailStart = details.firstWhere(
                        (e) => e.status == ScheduleDetailStatus.start,
                        orElse: ScheduleDetail.empty,
                      );
                      final isEmpty = detailStart == ScheduleDetail.empty();
                      return DataCell(
                        Text(
                          isEmpty ? '-' : detailStart.startTime.yMMMMd,
                        ),
                      );
                    },
                  ),
                  DTColumn(
                    widthFlex: 6,
                    head: DTHead(
                      backendColumn: 'actual_end_time',
                      label: 'actual_end'.tr(),
                    ),
                    body: (schedule) {
                      final details = _scheduleDetails
                          .where((e) => e.scheduleId == schedule.id)
                          .toList();
                      final detailFinish = details.lastWhere(
                        (e) => e.status == ScheduleDetailStatus.finish,
                        orElse: ScheduleDetail.empty,
                      );
                      final isEmpty = detailFinish == ScheduleDetail.empty();
                      return DataCell(
                        Text(
                          isEmpty ? '-' : detailFinish.startTime.yMMMMd,
                        ),
                      );
                    },
                  ),
                  DTColumn(
                    widthFlex: 6,
                    head: DTHead(
                      backendColumn: 'notes',
                      label: 'notes'.tr(),
                    ),
                    body: (schedule) => DataCell(
                      Text(schedule.notes == '' ? '-' : schedule.notes),
                    ),
                  ),
                  DTColumn(
                    widthFlex: 5,
                    head: DTHead(
                      backendColumn: 'created_at',
                      label: 'created_at'.tr(),
                      numeric: true,
                    ),
                    body: (schedule) => DataCell(
                      Text(schedule.createdAt.yMMMdHm),
                    ),
                  ),
                  DTColumn(
                    widthFlex: 5,
                    head: DTHead(
                      backendColumn: 'updated_at',
                      label: 'updated_at'.tr(),
                      numeric: true,
                    ),
                    body: (schedule) => DataCell(
                      Text(
                        schedule.updatedAt.yMMMdHm,
                      ),
                    ),
                  ),
                  DTColumn(
                    widthFlex: 10,
                    head: DTHead(
                      backendColumn: '',
                      label: 'actions'.tr(),
                    ),
                    body: (schedule) {
                      final details = _scheduleDetails
                          .where((e) => e.scheduleId == schedule.id)
                          .toList();
                      return DataCell(
                        Row(
                          children: [
                            ScheduleDetailButton(
                              schedule: schedule,
                              isExternal: widget.isExternal,
                            ),
                            Visibility(
                              visible: details.isEmpty,
                              child: ScheduleEditButton(
                                schedule: schedule,
                                isExternal: widget.isExternal,
                              ),
                            ),
                            if (schedule.isClose == false)
                              ScheduleCloseButton.prepare(
                                schedule: schedule,
                                isExternal: widget.isExternal,
                              ),
                            if (schedule.isClose == false)
                              ScheduleDeleteButton.prepare(
                                schedule: schedule,
                                isExternal: widget.isExternal,
                              ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
