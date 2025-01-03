import 'package:flexurio_chiron_company/src/app/bloc/office/office_bloc.dart';
import 'package:flexurio_chiron_company/src/app/model/office.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:page_transition/page_transition.dart';

class OfficeCreatePage extends StatefulWidget {
  const OfficeCreatePage._(this.office);

  final Office? office;

  static Route<bool?> route({Office? office}) {
    return PageTransition(
      opaque: true,
      type: PageTransitionType.rightToLeft,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => OfficeBloc()),
        ],
        child: OfficeCreatePage._(office),
      ),
    );
  }

  @override
  State<OfficeCreatePage> createState() => _OfficeCreatePageState();
}

class _OfficeCreatePageState extends State<OfficeCreatePage> {
  late DataAction _action;
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _addressController = TextEditingController();
  final _latitudeController = TextEditingController();
  final _longitudeController = TextEditingController();
  final _radiusController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _action = createOrEdit(widget.office);
    if (_action.isEdit) {
      _nameController.text = widget.office!.name;
      _descriptionController.text = widget.office!.description;
      _addressController.text = widget.office!.address;
      _radiusController.text = widget.office!.radius.toString();
      _latitudeController.text = widget.office!.latitude.toString();
      _longitudeController.text = widget.office!.longitude.toString();
    }
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      late OfficeEvent event;
      if (_action.isEdit) {
        event = OfficeEvent.update(
          widget.office!.id,
          _nameController.text,
          _descriptionController.text,
          _addressController.text,
          double.parse(_latitudeController.text),
          double.parse(_longitudeController.text),
          double.parse(_radiusController.text),
        );
      } else {
        event = OfficeEvent.create(
          _nameController.text,
          _descriptionController.text,
          _addressController.text,
          double.parse(_latitudeController.text),
          double.parse(_longitudeController.text),
          double.parse(_radiusController.text),
        );
      }

      context.read<OfficeBloc>().add(event);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<OfficeBloc, OfficeState>(
      listener: (context, state) {
        state.maybeWhen(
          success: () {
            Toast(context).dataChanged(_action, Entity.material);
            Navigator.pop(context, true);
          },
          error: (error) => Toast(context).fail(error),
          orElse: () {},
        );
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleFormPanel(
          actions: [
            BlocBuilder<OfficeBloc, OfficeState>(
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
          formKey: _formKey,
          action: _action,
          entity: Entity.office,
          children: [
            FTextFormField(
              labelText: 'Name',
              controller: _nameController,
              validator: requiredValidator.call,
              maxLength: 50,
            ),
            const Gap(24),
            FTextFormField(
              labelText: 'Description',
              controller: _descriptionController,
              validator: requiredValidator.call,
              maxLength: 500,
            ),
            const Gap(24),
            FTextFormField(
              labelText: 'Radius',
              controller: _radiusController,
              validator: requiredValidator.call,
              maxLength: 500,
            ),
            const Gap(24),
            FTextFormField(
              labelText: 'address'.tr(),
              controller: _addressController,
              validator: requiredValidator.call,
              maxLines: 5,
              maxLength: 500,
            ),
            const Gap(24),
            Row(
              children: [
                Expanded(
                  child: FTextFormField(
                    labelText: 'Latitude',
                    controller: _latitudeController,
                    validator: requiredValidator.call,
                    maxLength: 100,
                  ),
                ),
                const Gap(24),
                Expanded(
                  child: FTextFormField(
                    labelText: 'Longitude',
                    controller: _longitudeController,
                    validator: requiredValidator.call,
                    maxLength: 100,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
