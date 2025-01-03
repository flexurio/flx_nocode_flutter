import 'package:appointment/src/app/view/widget/select_field_chip_old.dart';
import 'package:flexurio_chiron_material/src/app/bloc/material_unit/material_unit_bloc.dart';
import 'package:flexurio_chiron_material/src/app/model/material_unit.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:page_transition/page_transition.dart';

class MaterialUnitCreatePage extends StatefulWidget {
  const MaterialUnitCreatePage._();

  static Route<bool?> route() {
    return PageTransition(
      opaque: true,
      type: PageTransitionType.rightToLeft,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => MaterialUnitBloc()),
        ],
        child: const MaterialUnitCreatePage._(),
      ),
    );
  }

  @override
  State<MaterialUnitCreatePage> createState() => _MaterialUnitCreatePageState();
}

class _MaterialUnitCreatePageState extends State<MaterialUnitCreatePage> {
  final _formKey = GlobalKey<FormState>();
  final _typeController = TextEditingController();
  final _idController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      final event = MaterialUnitEvent.create(
        _idController.text,
        _typeController.text,
      );
      context.read<MaterialUnitBloc>().add(event);
    }
  }

  @override
  Widget build(BuildContext context) {
    const action = DataAction.create;
    final entity = Entity.materialUnit;

    return BlocListener<MaterialUnitBloc, MaterialUnitState>(
      listener: (context, state) {
        state.maybeWhen(
          success: () {
            Toast(context).dataChanged(action, entity);
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
          action: action,
          entity: entity,
          actions: [
            BlocBuilder<MaterialUnitBloc, MaterialUnitState>(
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
            FTextFormField(
              labelText: 'ID',
              controller: _idController,
              validator: requiredValidator.call,
              inputFormatters: inputLetterOnly,
              maxLength: 5,
            ),
            const Gap(24),
            SelectChipFieldOld(
              label: 'Type',
              controller: _typeController,
              validator: requiredValidator.call,
              options: [
                MaterialUnitType.asset.type,
                MaterialUnitType.general.type,
                MaterialUnitType.material.type,
                MaterialUnitType.product.type,
              ],
            ),
          ],
        ),
      ),
    );
  }
}
