import 'package:flexurio_chiron_business_trip/flexurio_chiron_business_trip.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:appointment/src/app/util/picker_file.dart';

class VehicleRentExportExcelButton extends StatefulWidget {
  const VehicleRentExportExcelButton({super.key});

  static Widget prepare() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => VehicleRentQueryBloc()),
      ],
      child: const VehicleRentExportExcelButton(),
    );
  }

  @override
  State<VehicleRentExportExcelButton> createState() =>
      _VehicleRentExportExcelButtonState();
}

class _VehicleRentExportExcelButtonState
    extends State<VehicleRentExportExcelButton> {
  final _startDateController = TextEditingController();
  final _endDateController = TextEditingController();
  late DateTime _startDate;
  late DateTime _endDate;

  @override
  Widget build(BuildContext context) {
    final vehicleRentQuery = context.read<VehicleRentQueryBloc>();
    return BlocListener<VehicleRentQueryBloc, VehicleRentQueryState>(
      bloc: vehicleRentQuery,
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          loaded: (employee, vehicleRent) {
            final bytes = excelVehicleRent(employee, vehicleRent.data);
            saveFile(bytes, 'Vehicle_Rent_Report.xlsx');
          },
        );
      },
      child: LightButtonSmall(
        action: DataAction.exportExcel,
        permission: Permission.vehicleRentExportExcel,
        onPressed: () async {
          await _showFilter(
            context,
            vehicleRentQuery,
          );
        },
      ),
    );
  }

  Future<void> _showFilter(
    BuildContext context,
    VehicleRentQueryBloc vehicleRentQuery,
  ) async {
    await showDialog<bool?>(
      context: context,
      builder: (context) {
        return CardForm(
          popup: true,
          title: 'Filter',
          icon: FontAwesomeIcons.filter,
          actions: [
            Button(
              action: DataAction.cancel,
              isSecondary: true,
              permission: null,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            const Gap(12),
            BlocBuilder<VehicleRentQueryBloc, VehicleRentQueryState>(
              bloc: vehicleRentQuery,
              builder: (context, state) {
                final isInProgress = state.maybeWhen(
                  orElse: () => false,
                  loading: (_) => true,
                );
                return Button(
                  action: DataAction.export,
                  permission: null,
                  isInProgress: isInProgress,
                  onPressed: () {
                    vehicleRentQuery.add(
                      VehicleRentQueryEvent.fetch(
                        pageOptions: PageOptions.emptyNoLimit(),
                        status: VehicleRentStatus.approveCs.label,
                        scheduleStart: _startDate,
                        scheduleEnd: _endDate,
                      ),
                    );
                  },
                );
              },
            ),
          ],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FieldDatePicker(
                onChanged: (value) => _startDate = value,
                controller: _startDateController,
                labelText: 'schedule_start'.tr(),
                validator: requiredObjectValidator.call,
              ),
              Gap(12),
              FieldDatePicker(
                onChanged: (value) => _endDate = value,
                controller: _endDateController,
                labelText: 'schedule_end'.tr(),
                validator: requiredObjectValidator.call,
              ),
            ],
          ),
        );
      },
    );
  }
}
