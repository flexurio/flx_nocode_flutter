import 'package:flexurio_chiron_material/src/app/bloc/unit_convert/unit_convert_bloc.dart';
import 'package:flexurio_chiron_material/src/app/model/unit_convert.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/material_unit.dart';
import 'package:flexurio_chiron_material/src/app/bloc/material_unit_query/material_unit_query_bloc.dart';
import 'package:flexurio_chiron_material/src/app/model/material_unit.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class UnitConvertCreatePage extends StatefulWidget {
  const UnitConvertCreatePage({
    required this.unit,
    super.key,
    this.unitConvert,
  });

  final UnitConvert? unitConvert;
  final MaterialUnit unit;

  static Widget prepare({
    required MaterialUnit unit,
    UnitConvert? unitConvert,
  }) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UnitConvertBloc(),
        ),
        BlocProvider(
          create: (context) => MaterialUnitQueryBloc()
            ..add(MaterialUnitQueryEvent.fetch(
              pageOptions: PageOptions.emptyNoLimit(),
            )),
        ),
      ],
      child: UnitConvertCreatePage(
        unitConvert: unitConvert,
        unit: unit,
      ),
    );
  }

  @override
  State<UnitConvertCreatePage> createState() => _UnitConvertCreatePageState();
}

class _UnitConvertCreatePageState extends State<UnitConvertCreatePage> {
  final _formKey = GlobalKey<FormState>();
  final _convertFormulaController = TextEditingController();

  late DataAction _action;
  late MaterialUnit _materialUnit;

  @override
  void initState() {
    _action = createOrEdit(widget.unitConvert);
    if (_action.isEdit) {
      _convertFormulaController.text = widget.unitConvert!.formula;
      _materialUnit = widget.unitConvert!.materialUnit;
    }
    super.initState();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      if (_action.isEdit) {
        context.read<UnitConvertBloc>().add(
              UnitConvertEvent.edit(
                id: widget.unitConvert!.id,
                convertFormula: _convertFormulaController.text,
                unit: widget.unit,
                convertedUnit: _materialUnit,
              ),
            );
      } else {
        context.read<UnitConvertBloc>().add(
              UnitConvertEvent.create(
                convertFormula: _convertFormulaController.text,
                unit: widget.unit,
                convertedUnit: _materialUnit,
              ),
            );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final entity = Entity.unitConvert;
    return BlocListener<UnitConvertBloc, UnitConvertState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          error: (error) => Toast(context).fail(error),
          success: () {
            Toast(context).dataChanged(_action, entity);
            Navigator.pop(context, true);
          },
        );
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleFormPanel(
          formKey: _formKey,
          action: _action,
          entity: entity,
          actions: [
            BlocBuilder<UnitConvertBloc, UnitConvertState>(
              builder: (context, state) {
                return Button(
                  action: _action,
                  permission: null,
                  onPressed: _submit,
                  isInProgress: state.maybeWhen(
                    orElse: () => false,
                    loading: () => true,
                  ),
                );
              },
            ),
          ],
          children: [
            if (_action.isCreate)
              FDropDownSearchMaterialUnit(
                label: 'ID Convert',
                onChanged: (unit) {
                  if (unit != null) {
                    _materialUnit = unit;
                  }
                },
              ),
            if (_action.isEdit)
              Row(
                children: [
                  Text(
                    'ID : ${widget.unitConvert!.convertUnit.id}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            const Gap(24),
            FTextFormField(
              labelText: 'Formula',
              controller: _convertFormulaController,
              validator: requiredValidator.call,
            ),
          ],
        ),
      ),
    );
  }
}
