import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_production/flexurio_chiron_production.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScheduleDetailPage extends StatefulWidget {
  const ScheduleDetailPage._({
    required this.schedule,
    required this.isExternal,
  });
  final bool isExternal;

  final Schedule schedule;

  static Route<void> route({
    required Schedule schedule,
    required bool isExternal,
  }) {
    return MaterialPageRoute(
      builder: (context) => BlocProvider(
        create: (context) => ScheduleDetailQueryBloc(
          isExternal: isExternal,
        )..add(
            ScheduleDetailQueryEvent.fetch(schedule.id),
          ),
        child: Material(
          color: Colors.transparent,
          child: ScheduleDetailPage._(
            schedule: schedule,
            isExternal: isExternal,
          ),
        ),
      ),
    );
  }

  @override
  State<ScheduleDetailPage> createState() => _ScheduleDetailPageState();
}

class _ScheduleDetailPageState extends State<ScheduleDetailPage> {
  Widget _buildDuration({
    required ScheduleDetailQueryState state,
  }) {
    return state.maybeWhen(
      loaded: (scheduleDetails) {
        print(scheduleDetails);
        final totalDuration = _calculateTotalDuration(scheduleDetails);
        print(totalDuration);
        return _buildTitle(
          title: 'duration'.tr(),
          value: ': ${totalDuration.toStringAsFixed(2)} ${'hours'.tr()}',
          canCopy: true,
        );
      },
      loading: () => _buildTitle(
        title: 'duration'.tr(),
        value: ': -',
        canCopy: true,
      ),
      orElse: () => _buildTitle(
        title: 'duration'.tr(),
        value: ': -',
        canCopy: true,
      ),
    );
  }

  Widget _buildTitle({
    required String title,
    required String value,
    bool canCopy = false,
    double? fontSize,
  }) {
    return Row(
      children: [
        SizedBox(
          width: 85,
          child: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: fontSize ?? 16,
            ),
          ),
        ),
        SizedBox(
          child: canCopy
              ? Text(
                  value,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: fontSize ?? 16,
                  ),
                ).canCopy()
              : Text(
                  value,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: fontSize ?? 16,
                  ),
                ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
        children: [
          const Row(
            children: [
              BackButton(),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${Entity.schedule.title} - ${widget.schedule.startTime.yMMMMd}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 8),
                  _buildTitle(
                    title: 'sub_stage'.tr(),
                    value:
                        ': ${widget.schedule.productionStageProcess.productionSubStage.name}',
                  ),
                  const SizedBox(height: 4),
                  _buildTitle(
                    title: 'product'.tr(),
                    value: ': ${widget.schedule.product.name}',
                  ),
                  const SizedBox(height: 4),
                  _buildTitle(
                    title: 'batch'.tr(),
                    value: ': ${widget.schedule.productionOrder.id}',
                    canCopy: true,
                  ),
                  const SizedBox(height: 4),
                  BlocBuilder<ScheduleDetailQueryBloc,
                      ScheduleDetailQueryState>(
                    builder: (context, stateDuration) {
                      print(stateDuration);
                      return _buildDuration(state: stateDuration);
                    },
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 4),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: ScheduleDetailDataTable.prepare(
              schedule: widget.schedule,
              isExternal: widget.isExternal,
              bloc: context.read<ScheduleDetailQueryBloc>(),
            ),
          ),
        ],
      ),
    );
  }
}

double _calculateTotalDuration(List<ScheduleDetail> details) {
  var totalDuration = 0.0;

  if (details.isNotEmpty) {
    final startX = <ScheduleDetail>[];
    final pendingX = <ScheduleDetail>[];
    final finisX = <ScheduleDetail>[];

    for (var i = 0; i < details.length; i++) {
      if (details[i].status == ScheduleDetailStatus.start) {
        startX.add(details[i]);
      }
      if (details[i].status == ScheduleDetailStatus.pending) {
        pendingX.add(details[i]);
      }
      if (details[i].status == ScheduleDetailStatus.finish) {
        finisX.add(details[i]);
      }
    }

    if (startX.isNotEmpty) {
      for (var i = 0; i < startX.length; i++) {
        if (pendingX.isNotEmpty) {
          for (var p = 0; p < pendingX.length; p++) {
            if (startX[i].cycle == pendingX[p].cycle) {
              totalDuration += pendingX[p]
                      .startTime
                      .difference(startX[i].startTime)
                      .inMinutes /
                  60;
            }
          }
        }
      }
    }
    if (startX.isNotEmpty) {
      startX.sort((a, b) => b.cycle.compareTo(a.cycle));
      final lastStartX = startX.first;
      if (finisX.isNotEmpty) {
        totalDuration +=
            finisX[0].startTime.difference(lastStartX.startTime).inMinutes / 60;
      }
    }
  }
  return totalDuration;
}
