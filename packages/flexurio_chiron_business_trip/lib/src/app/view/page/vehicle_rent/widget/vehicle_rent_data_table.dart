import 'package:flexurio_chiron_business_trip/flexurio_chiron_business_trip.dart';
import 'package:appointment/src/app/view/widget/get_user_name.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VehicleRentDataTable extends StatefulWidget {
  const VehicleRentDataTable({super.key});

  static Widget prepare() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => VehicleRentQueryBloc()
            ..add(VehicleRentQueryEvent.fetch(
              status: VehicleRentStatus.input.label,
            )),
        ),
      ],
      child: const VehicleRentDataTable(),
    );
  }

  @override
  State<VehicleRentDataTable> createState() => _VehicleRentDataTableState();
}

class _VehicleRentDataTableState extends State<VehicleRentDataTable> {
  VehicleRentStatus _statusSelected = VehicleRentStatus.input;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VehicleRentQueryBloc, VehicleRentQueryState>(
      builder: (context, state) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: DataTableBackend<VehicleRent>(
            freezeFirstColumn: true,
            freezeLastColumn: true,
            key: ValueKey(state.hashCode),
            status: state.maybeWhen(
              loading: (_) => Status.progress,
              loaded: (_, __) => Status.loaded,
              orElse: () => Status.error,
            ),
            onChanged: (pageOptions) {
              context.read<VehicleRentQueryBloc>().add(
                    VehicleRentQueryEvent.fetch(
                        pageOptions: pageOptions,
                        status: _statusSelected.label),
                  );
            },
            pageOptions: state.maybeWhen(
              loaded: (_, data) => data,
              loading: (data) => data,
              orElse: PageOptions.empty,
            ),
            actionLeft: [
              DropDownSmall<VehicleRentStatus>(
                initialValue: _statusSelected,
                labelText: 'Status',
                itemAsString: (status) => status.label,
                items: const [
                  VehicleRentStatus.input,
                  VehicleRentStatus.approveCs,
                  VehicleRentStatus.approveManager,
                  VehicleRentStatus.rejectCs,
                  VehicleRentStatus.rejectManager,
                  VehicleRentStatus.closed,
                ],
                onChanged: (selected) {
                  if (selected != null) {
                    _statusSelected = selected;
                    context.read<VehicleRentQueryBloc>().add(
                          VehicleRentQueryEvent.fetch(
                            status: _statusSelected.label,
                          ),
                        );
                  }
                },
              ),
            ],
            actionRight: (refreshButton) => [
              VehicleRentExportExcelButton.prepare(),
              refreshButton,
              const VehicleRentCalendarViewButton(),
              const VehicleRentCreateButton(),
            ],
            onRefresh: () => context.read<VehicleRentQueryBloc>().add(
                  VehicleRentQueryEvent.fetch(status: _statusSelected.label),
                ),
            columns: [
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'id'.tr(),
                  backendColumn: null,
                ),
                body: (vehicleRent) => DataCell(
                  Text(vehicleRent.id).canCopy(),
                ),
              ),
              DTColumn(
                widthFlex: 5,
                head: DTHead(
                  label: 'department'.tr(),
                  backendColumn: null,
                ),
                body: (vehicleRent) =>
                    DataCell(Text(vehicleRent.department.id)),
              ),
              DTColumn(
                widthFlex: 7,
                head: const DTHead(
                  label: 'User',
                  backendColumn: null,
                ),
                body: (vehicleRent) => DataCell(
                  GetNameUser(userId: vehicleRent.userId),
                ),
              ),
              DTColumn(
                widthFlex: 7,
                head: DTHead(
                  label: 'status'.tr(),
                  backendColumn: null,
                ),
                body: (vehicleRent) => DataCell(
                  ChipType(vehicleRent.status),
                ),
              ),
              DTColumn(
                widthFlex: 7,
                head: DTHead(
                  label: 'type'.tr(),
                  backendColumn: null,
                ),
                body: (vehicleRent) => DataCell(
                  ChipType(vehicleRent.type),
                ),
              ),
              DTColumn(
                widthFlex: 7,
                head: const DTHead(
                  numeric: true,
                  label: 'Total',
                  backendColumn: 'total',
                ),
                body: (vehicleRent) =>
                    DataCell(Text(vehicleRent.totalCost.idr)),
              ),
              DTColumn(
                widthFlex: 5,
                head: DTHead(
                  label: 'schedule_start'.tr(),
                  backendColumn: null,
                ),
                body: (vehicleRent) => DataCell(
                  Text(
                    DateFormat('y-MM-dd')
                        .format(vehicleRent.scheduledStartDate),
                  ),
                ),
              ),
              DTColumn(
                widthFlex: 5,
                head: DTHead(
                  label: 'schedule_end'.tr(),
                  backendColumn: null,
                ),
                body: (vehicleRent) => DataCell(
                  Text(
                    DateFormat('y-MM-dd').format(vehicleRent.scheduledEndDate),
                  ),
                ),
              ),
              DTColumn(
                widthFlex: 5,
                head: DTHead(
                  label: 'created_by'.tr(),
                  backendColumn: null,
                ),
                body: (vehicleRent) => DataCell(
                  GetNameUser(userId: vehicleRent.createdById),
                ),
              ),
              DTColumn(
                widthFlex: 15,
                head: DTHead(
                  label: 'actions'.tr(),
                  backendColumn: null,
                ),
                body: (vehicleRent) => DataCell(
                  Row(
                    children: [
                      VehicleRentViewButton(
                        vehicleRent: vehicleRent,
                        bloc: context.read<VehicleRentQueryBloc>(),
                        statusSelected: _statusSelected,
                      ),
                      if (vehicleRent.status == VehicleRentStatus.input)
                        VehicleRentDeleteButton.prepare(
                          vehicleRent: vehicleRent,
                        ),
                      if (vehicleRent.status == VehicleRentStatus.approveCs)
                        Row(
                          children: [
                            if (vehicleRent.actualStartDate == null)
                              VehicleRentActualStartButton(
                                vehicleRent: vehicleRent,
                              )
                            else if (vehicleRent.finalKilometer <= 0)
                              VehicleRentActualEndButton(
                                vehicleRent: vehicleRent,
                              ),
                          ],
                        ),
                      if (vehicleRent.status == VehicleRentStatus.input)
                        Row(
                          children: [
                            VehicleRentApproveManagerButton.prepare(
                              vehicleRent: vehicleRent,
                            ),
                            VehicleRentRejectManagerButton.prepare(
                              vehicleRent: vehicleRent,
                            ),
                          ],
                        ),
                      if (vehicleRent.status ==
                          VehicleRentStatus.approveManager)
                        Row(
                          children: [
                            VehicleRentApproveCsButton.prepare(
                              vehicleRent: vehicleRent,
                            ),
                            VehicleRentRejectCsButton.prepare(
                              vehicleRent: vehicleRent,
                            ),
                          ],
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
