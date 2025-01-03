import 'package:flexurio_chiron_business_trip/src/app/bloc/fuel/fuel_bloc.dart';
import 'package:flexurio_chiron_business_trip/src/app/model/fuel.dart';
import 'package:appointment/src/app/view/widget/select_field_chip.dart';
import 'package:appointment/src/app/view/widget/string_to_double.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pattern_formatter/numeric_formatter.dart';

class FuelCreatePage extends StatefulWidget {
  const FuelCreatePage._(this.fuel);

  final Fuel? fuel;

  static Route<bool?> route({Fuel? fuel}) {
    return PageTransition(
      opaque: true,
      type: PageTransitionType.rightToLeft,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => FuelBloc()),
        ],
        child: FuelCreatePage._(fuel),
      ),
    );
  }

  @override
  State<FuelCreatePage> createState() => _FuelCreatePageState();
}

class _FuelCreatePageState extends State<FuelCreatePage> {
  late DataAction _action;
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _brandController = TextEditingController();
  final _startDateController = TextEditingController();
  final _endDateController = TextEditingController();
  final _typeController = TextEditingController();
  final _priceController = TextEditingController();

  late DateTime _startDate;

  @override
  void initState() {
    super.initState();
    _action = createOrEdit(widget.fuel);
    if (_action.isEdit) {
      _nameController.text = widget.fuel!.name;
      _brandController.text = widget.fuel!.brand;
      _startDateController.text = widget.fuel!.startDate.yMMMMd;
      _endDateController.text = widget.fuel!.endDate.yMMMMd;
      _typeController.text = widget.fuel!.typeFuel;
      _priceController.text = widget.fuel!.price.toString();

      _startDate = widget.fuel!.startDate;
    }
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      late FuelEvent event;

      _action = createOrEdit(widget.fuel);
      if (_action.isEdit) {
        event = FuelEvent.update(
          startDate: _startDate,
          fuel: widget.fuel!,
          price: stringDecimalToDouble(_priceController.text),
        );
      } else {
        event = FuelEvent.create(
          name: _nameController.text,
          price: stringDecimalToDouble(_priceController.text),
          startDate: _startDate,
          typeFuel: _typeController.text,
          brand: _brandController.text,
        );
      }
      context.read<FuelBloc>().add(event);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<FuelBloc, FuelState>(
      listener: (context, state) {
        state.maybeWhen(
          success: () {
            Toast(context).dataChanged(_action, Entity.fuel);
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
          entity: Entity.fuel,
          actions: [
            BlocBuilder<FuelBloc, FuelState>(
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
            RowFields(
              children: [
                if (_action.isEdit)
                  FTextFormField(
                    labelText: 'Name',
                    controller: _nameController,
                    validator: requiredValidator.call,
                    enabled: false,
                  ),
                if (!_action.isEdit)
                  FTextFormField(
                    labelText: 'Name',
                    controller: _nameController,
                    validator: requiredValidator.call,
                  ),
                if (_action.isEdit)
                  FTextFormField(
                    labelText: 'Brand',
                    controller: _brandController,
                    validator: requiredValidator.call,
                    enabled: false,
                  ),
                if (!_action.isEdit)
                  FTextFormField(
                    labelText: 'Brand',
                    controller: _brandController,
                    validator: requiredValidator.call,
                  ),
              ],
            ),
            const Gap(24),
            FieldDatePicker(
              onChanged: (value) => _startDate = value,
              controller: _startDateController,
              labelText: 'Period Start',
            ),
            const Gap(24),
            if (_action.isEdit)
              FTextFormField(
                labelText: 'Type Fuel',
                controller: _typeController,
                validator: requiredValidator.call,
                enabled: false,
              ),
            if (!_action.isEdit)
              SelectChipField<String>(
                validator: requiredValidator.call,
                label: 'Type Fuel',
                controller: _typeController,
                getLabel: (type) => type,
                options: const [
                  'Diesel',
                  'Gasoline',
                ],
                onChanged: (value) {
                  _typeController.text = value;
                },
              ),
            const Gap(24),
            FTextFormField(
              controller: _priceController,
              labelText: 'Price per Liter',
              inputFormatters: [
                ThousandsFormatter(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
