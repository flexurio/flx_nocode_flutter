import 'package:flexurio_chiron_business_trip/src/app/bloc/fuel_query/fuel_query_bloc.dart';
import 'package:flexurio_chiron_business_trip/src/app/bloc/vehicle/vehicle_bloc.dart';
import 'package:flexurio_chiron_business_trip/src/app/model/vehicle.dart';
import 'package:appointment/src/app/view/widget/select_field_chip.dart';
import 'package:flexurio_chiron_purchase_request/flexurio_chiron_purchase_request.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:page_transition/page_transition.dart';

class VehicleCreatePage extends StatefulWidget {
  const VehicleCreatePage._({this.vehicle});

  final Vehicle? vehicle;

  static Route<bool?> route({Vehicle? vehicle}) {
    return PageTransition(
      opaque: true,
      type: PageTransitionType.rightToLeft,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => VehicleBloc()),
          BlocProvider(
            create: (context) =>
                FuelQueryBloc()..add(const FuelQueryEvent.fetchCurrentPeriod()),
          ),
        ],
        child: VehicleCreatePage._(
          vehicle: vehicle,
        ),
      ),
    );
  }

  @override
  State<VehicleCreatePage> createState() => _VehicleCreatePageState();
}

class _VehicleCreatePageState extends State<VehicleCreatePage> {
  late DataAction _action;
  final _formKey = GlobalKey<FormState>();

  final _plateController = TextEditingController();
  final _brandController = TextEditingController();
  final _categoryController = TextEditingController();
  final _manufactureYearController = TextEditingController();
  final _typeFuelController = TextEditingController();

  late DateTime _manufactureYear;

  @override
  void initState() {
    super.initState();
    _action = createOrEdit(widget.vehicle);
    if (_action.isEdit) {
      _plateController.text = widget.vehicle!.vehicleRegistrationNumber;
      _brandController.text = widget.vehicle!.brand;
      _categoryController.text = widget.vehicle!.category.label;
      _manufactureYearController.text =
          widget.vehicle!.manufactureYear.toString();

      _typeFuelController.text = widget.vehicle!.typeFuel.label;
      _manufactureYear = DateTime(widget.vehicle!.manufactureYear);
    }
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      late VehicleEvent event;

      _action = createOrEdit(widget.vehicle);
      if (_action.isEdit) {
        event = VehicleEvent.update(
          vehicle: widget.vehicle!,
          brand: _brandController.text,
          category: _categoryController.text,
          fuel: _typeFuelController.text,
          manufacturerYear: _manufactureYear.year,
        );
      } else {
        event = VehicleEvent.create(
          vehicleNo: _plateController.text,
          brand: _brandController.text,
          category: _categoryController.text,
          fuel: _typeFuelController.text,
          manufacturerYear: _manufactureYear.year,
        );
      }
      context.read<VehicleBloc>().add(event);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<VehicleBloc, VehicleState>(
      listener: (context, state) {
        state.maybeWhen(
          success: () {
            Toast(context).dataChanged(_action, Entity.vehicle);
            Navigator.pop(context, true);
          },
          error: (error) => Toast(context).fail(error),
          orElse: () {},
        );
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleFormPanel(
          formKey: _formKey,
          action: _action,
          entity: Entity.vehicle,
          actions: [
            BlocBuilder<VehicleBloc, VehicleState>(
              builder: (context, state) {
                return Button(
                  permission: null,
                  isInProgress: state.maybeWhen(
                    loading: () => true,
                    orElse: () => false,
                  ),
                  onPressed: _submit,
                  action: _action,
                );
              },
            ),
          ],
          children: [
            if (_action.isCreate)
              FTextFormField(
                labelText: 'Plate Number',
                controller: _plateController,
                validator: requiredValidator.call,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9]')),
                ],
              ),
            const Gap(24),
            RowFields(
              children: [
                FTextFormField(
                  labelText: 'Brand',
                  controller: _brandController,
                  validator: requiredValidator.call,
                ),
                FDropDownSearch<String>(
                  initialValue: _categoryController.text == ''
                      ? null
                      : _categoryController.text,
                  labelText: 'Category',
                  items: ['Mobil Penumpang', 'L300 Box', 'Colt Diesel'],
                  onChanged: (value) {
                    if (value != null) {
                      _categoryController.text = value;
                    }
                  },
                  itemAsString: (category) => category,
                  validator: requiredObjectValidator.call,
                ),
              ],
            ),
            const Gap(24),
            FieldMonthPicker(
              maxDate: dateNow,
              onChanged: (value) => _manufactureYear = value,
              controller: _manufactureYearController,
              labelText: 'Manufacture Year',
            ),
            const Gap(24),
            SelectChipField<String>(
              validator: requiredValidator.call,
              label: 'Type Fuel',
              controller: _typeFuelController,
              getLabel: (type) => type,
              options: const [
                'Diesel',
                'Gasoline',
              ],
              onChanged: (value) {
                _typeFuelController.text = value;
              },
            ),
          ],
        ),
      ),
    );
  }
}
