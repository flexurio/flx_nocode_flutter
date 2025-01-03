import 'package:flexurio_chiron_business_trip/flexurio_chiron_business_trip.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  static Widget prepare() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              VehicleQueryBloc()..add(const VehicleQueryEvent.fetch()),
        ),
        BlocProvider(
          create: (context) =>
              VehicleRentQueryBloc()..add(const VehicleRentQueryEvent.fetch()),
        ),
      ],
      child: const Calendar(),
    );
  }

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  VehicleRentDataSource? vehicleRentDataSource;
  CalendarController calendarController = CalendarController();
  Vehicle? _vehicle;

  void _refresh() {
    context
        .read<VehicleRentQueryBloc>()
        .add(const VehicleRentQueryEvent.fetch());
    _vehicle = Vehicle.empty();
  }

  late String _headerText;
  List<String> titles = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    _headerText = DateFormat('MMMM yyyy').format(now);
  }

  @override
  Widget build(BuildContext context) {
    Widget buildLegend({required String title, required Color color}) {
      return Row(
        children: [
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              color: color,
              borderRadius: const BorderRadius.all(Radius.circular(5)),
            ),
          ),
          const Gap(5),
          Text(title),
        ],
      );
    }

    Widget buildCellDay(String title) {
      return Expanded(
        child: Container(
          height: 50,
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Center(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.grey.shade500),
            ),
          ),
        ),
      );
    }

    return BlocListener<VehicleRentQueryBloc, VehicleRentQueryState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          loaded: (_, vehicleRent) {
            setState(() {
              vehicleRentDataSource = VehicleRentDataSource(vehicleRent.data);
            });
          },
        );
      },
      child: FCard(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            Container(
              color: Colors.white,
              height: 60,
              child: Row(
                children: [
                  const Text(
                    'Timeline',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const Gap(12),
                  BlocBuilder<VehicleRentQueryBloc, VehicleRentQueryState>(
                    builder: (context, state) {
                      return state.maybeWhen(
                        orElse: SizedBox.shrink,
                        loaded: (_, tasks) => IconButton(
                          icon: const Icon(Icons.sync),
                          onPressed: _refresh,
                          tooltip: 'refresh'.tr(),
                        ),
                        loading: (_) => const Center(
                          child: CupertinoActivityIndicator(),
                        ),
                        error: (message) => Tooltip(
                          message: message,
                          child: const Icon(
                            Icons.error,
                            color: Colors.red,
                          ),
                        ),
                      );
                    },
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          visualDensity: VisualDensity.comfortable,
                          onPressed: () {
                            calendarController.backward!();
                          },
                          icon: Icon(
                            Icons.arrow_left,
                            size: 30,
                            color: Colors.grey.shade700,
                          ),
                        ),
                        const Gap(12),
                        Text(
                          _headerText,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 25,
                            color: Colors.black,
                          ),
                        ),
                        const Gap(12),
                        IconButton(
                          visualDensity: VisualDensity.comfortable,
                          onPressed: () {
                            calendarController.forward!();
                          },
                          icon: Icon(
                            Icons.arrow_right,
                            size: 30,
                            color: Colors.grey.shade700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(right: 90),
                          child: Text(
                            'Plat Number',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const Gap(5),
                        BlocBuilder<VehicleQueryBloc, VehicleQueryState>(
                          builder: (context, state) {
                            return DropDownSmall<Vehicle>(
                              key: ValueKey(_vehicle),
                              initialValue: _vehicle,
                              labelText: 'Plat Number',
                              itemAsString: (vehicle) =>
                                  vehicle.vehicleRegistrationNumber,
                              items: state.maybeWhen(
                                loaded: (vehicles) => vehicles.data,
                                orElse: () => [],
                              ),
                              onChanged: (vehicle) {
                                if (vehicle != null) {
                                  _vehicle = vehicle;
                                  context.read<VehicleRentQueryBloc>().add(
                                        VehicleRentQueryEvent.fetch(
                                          vehicle: vehicle,
                                        ),
                                      );
                                }
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Gap(12),
            Offstage(
              offstage: calendarController.view == CalendarView.day,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Offstage(
                    offstage: calendarController.view == CalendarView.month,
                    child: const SizedBox(
                      width: 50,
                    ),
                  ),
                  ...List.generate(titles.length, (index) {
                    return buildCellDay(titles[index]);
                  }),
                ],
              ),
            ),
            Expanded(
              child: SfCalendar(
                onViewChanged: (viewChangedDetails) {
                  _headerText = DateFormat('MMMM yyyy').format(
                    viewChangedDetails.visibleDates[
                        viewChangedDetails.visibleDates.length ~/ 2],
                  );
                  if (calendarController.view == CalendarView.month) {
                    titles[0] = DateFormat('EEEE\n')
                        .format(viewChangedDetails.visibleDates[0])
                        .toUpperCase();
                    titles[1] = DateFormat('EEEE\n')
                        .format(viewChangedDetails.visibleDates[1])
                        .toUpperCase();
                    titles[2] = DateFormat('EEEE\n')
                        .format(viewChangedDetails.visibleDates[2])
                        .toUpperCase();
                    titles[3] = DateFormat('EEEE\n')
                        .format(viewChangedDetails.visibleDates[3])
                        .toUpperCase();
                    titles[4] = DateFormat('EEEE\n')
                        .format(viewChangedDetails.visibleDates[4])
                        .toUpperCase();
                    titles[5] = DateFormat('EEEE\n')
                        .format(viewChangedDetails.visibleDates[5])
                        .toUpperCase();
                    titles[6] = DateFormat('EEEE\n')
                        .format(viewChangedDetails.visibleDates[6])
                        .toUpperCase();
                  }
                  if (calendarController.view == CalendarView.week) {
                    titles[0] = DateFormat('EEEE\nd')
                        .format(viewChangedDetails.visibleDates[0])
                        .toUpperCase();
                    titles[1] = DateFormat('EEEE\nd')
                        .format(viewChangedDetails.visibleDates[1])
                        .toUpperCase();
                    titles[2] = DateFormat('EEEE\nd')
                        .format(viewChangedDetails.visibleDates[2])
                        .toUpperCase();
                    titles[3] = DateFormat('EEEE\nd')
                        .format(viewChangedDetails.visibleDates[3])
                        .toUpperCase();
                    titles[4] = DateFormat('EEEE\nd')
                        .format(viewChangedDetails.visibleDates[4])
                        .toUpperCase();
                    titles[5] = DateFormat('EEEE\nd')
                        .format(viewChangedDetails.visibleDates[5])
                        .toUpperCase();
                    titles[6] = DateFormat('EEEE\nd')
                        .format(viewChangedDetails.visibleDates[6])
                        .toUpperCase();
                  }
                  if (calendarController.view == CalendarView.day) {
                    _headerText = DateFormat('EEEE, dd MMMM yyyy').format(
                      viewChangedDetails.visibleDates[
                          viewChangedDetails.visibleDates.length ~/ 2],
                    );
                  }
                  SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
                    setState(() {});
                  });
                },
                onLongPress: (calendarTapDetails) {
                  showDialog<void>(
                    context: context,
                    builder: (context) => PopUpTask(
                      vehicleRent:
                          calendarTapDetails.appointments!.first as VehicleRent,
                    ),
                  );
                },
                headerHeight: 0,
                viewHeaderHeight: 0,
                controller: calendarController,
                view: CalendarView.month,
                dataSource: vehicleRentDataSource,
                allowedViews: const [
                  CalendarView.month,
                  CalendarView.week,
                ],
                headerStyle: const CalendarHeaderStyle(
                  textAlign: TextAlign.center,
                  textStyle: TextStyle(fontSize: 22),
                ),
                firstDayOfWeek: 1,
                monthViewSettings: const MonthViewSettings(
                  appointmentDisplayMode:
                      MonthAppointmentDisplayMode.appointment,
                  appointmentDisplayCount: 5,
                ),
              ),
            ),
            const Gap(20),
            Row(
              children: [
                buildLegend(
                  title: 'Input',
                  color: VehicleRentStatus.input.color,
                ),
                const Gap(15),
                buildLegend(
                  title: 'Approve CS',
                  color: VehicleRentStatus.approveCs.color,
                ),
                const Gap(15),
                buildLegend(
                  title: 'Approve Manager',
                  color: VehicleRentStatus.approveManager.color,
                ),
                const Gap(15),
                buildLegend(
                  title: 'Reject CS',
                  color: VehicleRentStatus.rejectCs.color,
                ),
                const Gap(15),
                buildLegend(
                  title: 'Reject Manager',
                  color: VehicleRentStatus.rejectManager.color,
                ),
                const Gap(15),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class VehicleRentDataSource extends CalendarDataSource {
  VehicleRentDataSource(List<VehicleRent> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    final vehicleRent = appointments![index] as VehicleRent;
    return vehicleRent.scheduledStartDate;
  }

  @override
  DateTime getEndTime(int index) {
    final vehicleRent = appointments![index] as VehicleRent;
    return vehicleRent.scheduledEndDate;
  }

  @override
  String getSubject(int index) {
    final vehicleRent = appointments![index] as VehicleRent;
    return vehicleRent.vehicle == null
        ? '-'
        : vehicleRent.vehicle!.vehicleRegistrationNumber;
  }

  @override
  Color getColor(int index) {
    final vehicleRent = appointments![index] as VehicleRent;
    return vehicleRent.status.color;
  }
}
