import 'package:flexurio_chiron_material_stock/src/app/bloc/material_retest/material_retest_bloc.dart';
import 'package:flexurio_chiron_material_stock/src/app/model/material_retest.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart' as ui;
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';

class MaterialRetestsUpdatePage extends ui.StatefulWidget {
  const MaterialRetestsUpdatePage._({required this.materialRetests});

  static ui.Route<bool?> route({required MaterialRetest materialRetests}) {
    return PageTransition(
      opaque: true,
      type: PageTransitionType.rightToLeft,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => MaterialRetestBloc(),
          ),
        ],
        child: MaterialRetestsUpdatePage._(
          materialRetests: materialRetests,
        ),
      ),
    );
  }

  final MaterialRetest materialRetests;

  @override
  ui.State<MaterialRetestsUpdatePage> createState() =>
      _MaterialRetestsUpdatePageState();
}

class _MaterialRetestsUpdatePageState
    extends ui.State<MaterialRetestsUpdatePage> {
  final _formKey = GlobalKey<FormState>();

  MaterialRetestStatus _status = MaterialRetestStatus.empty;
  late DateTime? _retestsDate;

  void _submit() {
    if (_formKey.currentState!.validate()) {
      final event = MaterialRetestEvent.update(
        materialRetest: widget.materialRetests,
        status: _status.label,
        retestsDate: _retestsDate!,
      );
      context.read<MaterialRetestBloc>().add(event);
    }
  }

  @override
  ui.Widget build(ui.BuildContext context) {
    const action = DataAction.update;
    return BlocListener<MaterialRetestBloc, MaterialRetestState>(
      listener: (context, state) {
        state.maybeWhen(
          success: () => ui.Navigator.pop(context, true),
          error: (error) => Toast(context).fail(error),
          orElse: () {},
        );
      },
      child: ui.Scaffold(
        backgroundColor: ui.Colors.transparent,
        body: SingleFormPanel(
          size: SingleFormPanelSize.large,
          formKey: _formKey,
          action: action,
          entity: Entity.materialRetest,
          actions: [
            BlocBuilder<MaterialRetestBloc, MaterialRetestState>(
              builder: (context, state) {
                return Button(
                  permission: null,
                  isInProgress: state.maybeWhen(
                    loading: () => true,
                    orElse: () => false,
                  ),
                  onPressed: _submit,
                  action: action,
                );
              },
            ),
          ],
          children: [
            FDropDownSearch<MaterialRetestStatus>(
              labelText: 'Status',
              items: const [
                MaterialRetestStatus.release,
                MaterialRetestStatus.reject,
              ],
              validator: requiredObjectValidator.call,
              onChanged: (value) {
                if (value != null) {
                  _status = value;
                }
              },
              itemAsString: (status) => status.label,
            ),
            const SizedBox(height: 15),
            FieldDatePicker(
              labelText: 'Input Retest Date',
              controller: ui.TextEditingController(),
              minDate: DateTime.now(),
              validator: requiredObjectValidator.call,
              onChanged: (value) => _retestsDate = value,
            ),
          ],
        ),
      ),
    );
  }
}
