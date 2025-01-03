import 'package:flexurio_chiron_material/src/app/bloc/unit_convert_query/unit_convert_query_bloc.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/material_type.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/material_unit.dart';
import 'package:appointment/src/app/view/widget/string_to_double.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_material/src/app/bloc/material/material_bloc.dart'
    as bloc;
import 'package:flexurio_chiron_material/src/app/bloc/material_group_query/material_group_query_bloc.dart';
import 'package:flexurio_chiron_material/src/app/bloc/material_type_query/material_type_query_bloc.dart';
import 'package:flexurio_chiron_material/src/app/bloc/material_unit_query/material_unit_query_bloc.dart';
import 'package:flexurio_chiron_material/src/app/model/material.dart' as model;
import 'package:flexurio_chiron_material/src/app/model/material_group.dart';
import 'package:flexurio_chiron_material/src/app/model/material_type.dart'
    as model_material_type;
import 'package:flexurio_chiron_material/src/app/model/material_unit.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:gap/gap.dart';
import 'package:page_transition/page_transition.dart';
import 'package:appointment/src/app/model/config.dart';

class MaterialCreatePage extends StatefulWidget {
  const MaterialCreatePage._(
    this.material,
    this.isExternal,
    this.duplicate,
  );

  final model.Material? material;
  final model.Material? duplicate;
  final bool isExternal;

  static Route<bool?> route({
    model.Material? material,
    model.Material? duplicate,
    required isExternal,
  }) {
    return PageTransition(
      opaque: true,
      type: PageTransitionType.rightToLeft,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => MaterialUnitQueryBloc()
              ..add(MaterialUnitQueryEvent.fetch(
                pageOptions: PageOptions.emptyNoLimit(),
              )),
          ),
          BlocProvider(
            create: (context) => MaterialGroupQueryBloc()
              ..add(MaterialGroupQueryEvent.fetch(
                pageOptions: PageOptions.emptyNoLimit(),
              )),
          ),
          BlocProvider(
            create: (context) => MaterialTypeQueryBloc(),
          ),
          BlocProvider(create: (context) => UnitConvertQueryBloc()),
          BlocProvider(
              create: (context) => bloc.MaterialBloc(
                  isExternal: duplicate != null || isExternal)),
        ],
        child: MaterialCreatePage._(material, isExternal, duplicate),
      ),
    );
  }

  @override
  State<MaterialCreatePage> createState() => _MaterialCreatePageState();
}

class _MaterialCreatePageState extends State<MaterialCreatePage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _idController = TextEditingController();
  final _packSizeController = TextEditingController();
  bool? _isAssets;
  model_material_type.MaterialType? _type;
  MaterialUnit? _materialUnit;
  MaterialUnit? _stockUnit;
  MaterialGroup? _materialGroup;
  late DataAction _action;
  String? _companyId;

  @override
  void initState() {
    super.initState();

    if (!widget.isExternal) {
      _companyId = (flavorConfig.applicationConfig as AppConfig).companyId;
    }

    _action = createOrEdit(widget.material);
    if (_action.isEdit || widget.duplicate != null) {
      final material = _action.isEdit ? widget.material : widget.duplicate;

      context.read<MaterialTypeQueryBloc>().add(
            MaterialTypeQueryEvent.fetch(
              materialGroup: material!.materialGroup,
              pageOptions: PageOptions.emptyNoLimit(),
            ),
          );
      if (_action.isEdit) _companyId = material.company;
      _nameController.text = material.name;
      _materialGroup = material.materialGroup;
      _materialUnit = material.materialUnit;
      _type = material.materialType;
      _stockUnit = material.stockUnit;
      _idController.text = material.id;
      _isAssets = material.isAsset;
      _packSizeController.text = material.packSize.round().toString();
      _updateUnitConvert();
    }
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      late bloc.MaterialEvent event;
      bool? valueGet() {
        if (_isAssets == null) {
          return false;
        } else {
          return _isAssets;
        }
      }

      final packSize = stringToInt(_packSizeController.text);

      if (_action.isEdit) {
        event = bloc.MaterialEvent.edit(
          isAssets: valueGet(),
          name: _nameController.text,
          materialGroup: _materialGroup!,
          materialUnit: _materialUnit!,
          id: _idController.text,
          packSize: packSize,
          type: _type!,
        );
      } else {
        event = bloc.MaterialEvent.create(
          name: _nameController.text,
          materialUnit: _materialUnit!,
          stockUnit: _stockUnit!,
          materialGroup: _materialGroup!,
          id: _idController.text,
          isAssets: valueGet(),
          packSize: packSize,
          type: _type!,
          companyId: _companyId!,
        );
      }

      context.read<bloc.MaterialBloc>().add(event);
    }
  }

  void _updateUnitConvert() {
    if (_materialUnit != null && _stockUnit != null) {
      context.read<UnitConvertQueryBloc>().add(
            UnitConvertQueryEvent.fetch(
              unitFrom: _materialUnit!,
              unitTo: _stockUnit!,
              pageOptions: PageOptions.emptyNoLimit(),
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<bloc.MaterialBloc, bloc.MaterialState>(
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
          formKey: _formKey,
          action: _action,
          entity: Entity.material,
          actions: [
            BlocBuilder<bloc.MaterialBloc, bloc.MaterialState>(
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
            BlocBuilder<MaterialGroupQueryBloc, MaterialGroupQueryState>(
              builder: (context, state) {
                return FDropDownSearch<MaterialGroup>(
                  enabled: _action.isCreate,
                  initialValue: _materialGroup,
                  validator: requiredObjectValidator.call,
                  status: state.maybeWhen(
                    error: (_) => Status.error,
                    loading: (_) => Status.progress,
                    orElse: () => Status.loaded,
                  ),
                  labelText: 'Group',
                  items: state.maybeWhen(
                    orElse: () => [],
                    loaded: (materialGroups) => materialGroups.data,
                  ),
                  onChanged: (value) {
                    if (value != null) {
                      _materialGroup = value;
                      context.read<MaterialTypeQueryBloc>().add(
                            MaterialTypeQueryEvent.fetch(
                              materialGroup: value,
                              pageOptions: PageOptions.emptyNoLimit(),
                            ),
                          );
                      setState(() {});
                    }
                  },
                  itemAsString: (materialGroup) => materialGroup.id,
                );
              },
            ),
            const Gap(24),
            RowFields(
              children: [
                FTextFormField(
                  labelText: 'ID',
                  enabled: _action.isCreate,
                  controller: _idController,
                  validator: requiredValidator.call,
                  maxLength: 30,
                ),
                FTextFormField(
                  labelText: 'name'.tr(),
                  controller: _nameController,
                  validator: requiredValidator.call,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                      RegExp("[a-zA-Z /0-9()',.]"),
                    ),
                  ],
                  maxLength: 50,
                ),
              ],
            ),
            const Gap(24),
            RowFields(
              children: [
                FTextFormField(
                  labelText: 'Pack Size',
                  controller: _packSizeController,
                  validator: MultiValidator([
                    requiredValidator,
                    MinNumberValidator(minNumber: 1),
                  ]),
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  maxLength: 30,
                ),
                FDropDownSearchMaterialType(
                  label: 'type'.tr(),
                  onChanged: (value) {
                    if (value != null) {
                      _type = value;
                    }
                  },
                  initialValue: _type,
                ),
              ],
            ),
            const Gap(24),
            RowFields(
              children: [
                FDropDownSearchMaterialUnit(
                  label: 'Unit Order',
                  onChanged: (value) {
                    _materialUnit = value;
                    _updateUnitConvert();
                  },
                  initialValue: _materialUnit,
                ),
                FDropDownSearchMaterialUnit(
                  enabled: _action.isCreate,
                  label: 'Unit Stock',
                  onChanged: (value) {
                    _stockUnit = value;
                    _updateUnitConvert();
                  },
                  initialValue: _stockUnit,
                ),
              ],
            ),
            const Gap(12),
            BlocBuilder<UnitConvertQueryBloc, UnitConvertQueryState>(
              builder: (context, state) {
                final formula = state.maybeWhen(
                  orElse: () => '-',
                  error: (error) => error,
                  loading: (_) => 'Please wait',
                  loaded: (unitConvert) {
                    if (unitConvert != null) {
                      return 'Quantity ${_materialUnit!.id} * ${unitConvert.formula} = Quantity ${_stockUnit!.id} ';
                    }
                    return '-';
                  },
                );

                return BlockNote(
                  title: 'Unit Convert Formula',
                  subtitle: formula,
                );
              },
            ),
            if (!['BAKU', 'BANTU', 'KEMASAN'].contains(_materialGroup?.id))
              Padding(
                padding: const EdgeInsets.only(top: 24),
                child: CheckboxWithText(
                  initialValue: _isAssets ?? false,
                  text: 'Asset',
                  onChanged: (value) {
                    setState(() {
                      _isAssets = value;
                    });
                  },
                ),
              ),
            const Gap(12),
            FDropDownSearch<String>(
              enabled: _action.isCreate && widget.isExternal,
              initialValue: _companyId,
              labelText: 'company'.tr(),
              items: (flavorConfig.applicationConfig as AppConfig)
                  .companyExternals,
              itemAsString: (value) => value,
              onChanged: (value) {
                if (value != null) {
                  _companyId = value;
                }
              },
              validator: requiredObjectValidator.call,
            )
          ],
        ),
      ),
    );
  }
}
