import 'package:flexurio_chiron_business_trip/src/app/bloc/vehicle_query/vehicle_query_bloc.dart';
import 'package:flexurio_chiron_business_trip/src/app/model/vehicle.dart';
import 'package:flexurio_chiron_business_trip/src/app/view/page/vehicle/widget/vehicle_active_deactive_button.dart';
import 'package:flexurio_chiron_business_trip/src/app/view/page/vehicle/widget/vehicle_create_button.dart';
import 'package:flexurio_chiron_business_trip/src/app/view/page/vehicle/widget/vehicle_delete_button.dart';
import 'package:flexurio_chiron_business_trip/src/app/view/page/vehicle/widget/vehicle_update_button.dart';
import 'package:appointment/src/app/view/widget/get_user_name.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VehicleDataTable extends StatefulWidget {
  const VehicleDataTable({super.key});

  static Widget prepare() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              VehicleQueryBloc()..add(const VehicleQueryEvent.fetch()),
        ),
      ],
      child: const VehicleDataTable(),
    );
  }

  @override
  State<VehicleDataTable> createState() => _VehicleDataTableState();
}

class _VehicleDataTableState extends State<VehicleDataTable> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VehicleQueryBloc, VehicleQueryState>(
      builder: (context, state) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          // child: DataTableSet2<Vehicle>(
          //   status: state.maybeWhen(
          //     loading: () => Status.progress,
          //     loaded: (_) => Status.loaded,
          //     orElse: () => Status.error,
          //   ),
          //   onRefresh: () => context.read<VehicleQueryBloc>().add(
          //         const VehicleQueryEvent.fetch(),
          //       ),
          //   key: ValueKey(state.hashCode),
          //   data: state.maybeWhen(
          //     loaded: (fuel) {
          //       return fuel;
          //     },
          //     orElse: () => [],
          //   ),
          //   title: Entity.vehicle.title,
          //   search: (vehicle) => [
          //     vehicle.vehicleRegistrationNumber,
          //     vehicle.brand,
          //     vehicle.category.label,
          //     vehicle.typeFuel.label,
          //     vehicle.manufactureYear.toString(),
          //     vehicle.fuelPerKilometer.toString(),
          //   ],
          //   actionRight: (refreshButton) => [
          //     refreshButton,
          //     const VehicleCreateButton(),
          //   ],
          //   columns: [
          //     DTColumnXX(
          //       head: DTHeadXX(
          //         label: const Text('plate_number').tr(),
          //         sortString: (vehicle) => vehicle.vehicleRegistrationNumber,
          //       ),
          //       body: (vehicle) => DataCell(
          //         Text(vehicle.vehicleRegistrationNumber),
          //       ),
          //     ),
          //     DTColumnXX(
          //       head: DTHeadXX(
          //         label: const Text('Brand'),
          //         sortString: (vehicle) => vehicle.brand,
          //       ),
          //       body: (vehicle) => DataCell(Text(vehicle.brand)),
          //     ),
          //     DTColumnXX(
          //       head: DTHeadXX(
          //         label: const Text('Category'),
          //         sortString: (vehicle) => vehicle.category.label,
          //       ),
          //       body: (vehicle) => DataCell(ChipType(vehicle.category)),
          //     ),
          //     DTColumnXX(
          //       head: DTHeadXX(
          //         label: const Text('Type Fuel'),
          //         sortString: (vehicle) => vehicle.typeFuel.label,
          //       ),
          //       body: (vehicle) => DataCell(ChipType(vehicle.typeFuel)),
          //     ),
          //     DTColumnXX(
          //       head: DTHeadXX(
          //         label: Text('active'.tr()),
          //       ),
          //       body: (vehicle) => DataCell(
          //         VehicleActiveDeActiveButton.prepare(
          //           vehicle: vehicle,
          //         ),
          //       ),
          //     ),
          //     DTColumnXX(
          //       head: DTHeadXX(
          //         label: const Text('Manufacture Year'),
          //         sortNum: (vehicle) => vehicle.manufactureYear,
          //       ),
          //       body: (vehicle) =>
          //           DataCell(Text(vehicle.manufactureYear.toString())),
          //     ),
          //     DTColumnXX(
          //       head: DTHeadXX(
          //         label: const Text('Fuel per Kilometer'),
          //         sortNum: (vehicle) => vehicle.fuelPerKilometer,
          //       ),
          //       body: (vehicle) =>
          //           DataCell(Text(vehicle.fuelPerKilometer.toString())),
          //     ),
          //     DTColumnXX(
          //       head: const DTHeadXX(label: Text('Action')),
          //       body: (vehicle) => DataCell(
          //         Row(
          //           children: [
          //             VehicleUpdateButton(vehicle: vehicle),
          //             VehicleDeleteButton.prepare(vehicle: vehicle),
          //           ],
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
          child: DataTableBackend<Vehicle>(
            freezeFirstColumn: true,
            freezeLastColumn: true,
            key: ValueKey(state.hashCode),
            status: state.maybeWhen(
              loading: (_) => Status.progress,
              loaded: (_) => Status.loaded,
              orElse: () => Status.error,
            ),
            onChanged: (pageOptions) {
              context.read<VehicleQueryBloc>().add(
                    VehicleQueryEvent.fetch(pageOptions: pageOptions),
                  );
            },
            pageOptions: state.maybeWhen(
              loaded: (data) => data,
              loading: (data) => data,
              orElse: PageOptions.empty,
            ),
            actionRight: (refreshButton) => [
              refreshButton,
              const VehicleCreateButton(),
            ],
            onRefresh: () => context.read<VehicleQueryBloc>().add(
                  VehicleQueryEvent.fetch(),
                ),
            columns: [
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'plate_number'.tr(),
                  backendColumn: 'vehicle_registration_number',
                ),
                body: (vehicle) => DataCell(
                  Text(vehicle.vehicleRegistrationNumber).canCopy(),
                ),
              ),
              DTColumn(
                widthFlex: 5,
                head: DTHead(
                  label: 'brand'.tr(),
                  backendColumn: 'brand',
                ),
                body: (vehicle) => DataCell(Text(vehicle.brand)),
              ),
              DTColumn(
                widthFlex: 5,
                head: DTHead(
                  label: 'category'.tr(),
                  backendColumn: null,
                ),
                body: (vehicle) => DataCell(ChipType(vehicle.category)),
              ),
              DTColumn(
                widthFlex: 7,
                head: DTHead(
                  label: 'type_fuel'.tr(),
                  backendColumn: null,
                ),
                body: (vehicle) => DataCell(
                  ChipType(vehicle.typeFuel),
                ),
              ),
              DTColumn(
                widthFlex: 7,
                head: DTHead(
                  label: 'active'.tr(),
                  backendColumn: null,
                ),
                body: (vehicle) => DataCell(
                  VehicleActiveDeActiveButton.prepare(
                    vehicle: vehicle,
                  ),
                ),
              ),
              DTColumn(
                widthFlex: 7,
                head: DTHead(
                  numeric: true,
                  label: 'manufacture_year'.tr(),
                  backendColumn: 'manufacture_year',
                ),
                body: (vehicle) =>
                    DataCell(Text(vehicle.manufactureYear.toString())),
              ),
              DTColumn(
                widthFlex: 7,
                head: DTHead(
                  numeric: true,
                  label: 'fuel_per_kilometer'.tr(),
                  backendColumn: null,
                ),
                body: (vehicle) =>
                    DataCell(Text(vehicle.fuelPerKilometer.toString())),
              ),
              DTColumn(
                widthFlex: 7,
                head: DTHead(
                  label: 'created_by'.tr(),
                  backendColumn: null,
                ),
                body: (vehicle) => DataCell(
                  GetNameUser(userId: vehicle.createdById),
                ),
              ),
              DTColumn(
                widthFlex: 10,
                head: DTHead(
                  label: 'actions'.tr(),
                  backendColumn: null,
                ),
                body: (vehicle) => DataCell(
                  Row(
                    children: [
                      VehicleUpdateButton(vehicle: vehicle),
                      VehicleDeleteButton.prepare(vehicle: vehicle),
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
