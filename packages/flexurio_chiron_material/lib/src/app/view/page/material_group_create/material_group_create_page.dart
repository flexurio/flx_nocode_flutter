import 'package:appointment/src/app/view/widget/select_field_chip.dart';
import 'package:flexurio_chiron_material/src/app/bloc/material_group/material_group_bloc.dart';
import 'package:flexurio_chiron_material/src/app/model/material_group.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:page_transition/page_transition.dart';

class MaterialGroupCreatePage extends StatefulWidget {
  const MaterialGroupCreatePage._();

  static Route<bool?> route() {
    return PageTransition(
      opaque: true,
      type: PageTransitionType.rightToLeft,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => MaterialGroupBloc()),
        ],
        child: const MaterialGroupCreatePage._(),
      ),
    );
  }

  @override
  State<MaterialGroupCreatePage> createState() =>
      _MaterialGroupCreatePageState();
}

class _MaterialGroupCreatePageState extends State<MaterialGroupCreatePage> {
  final _formKey = GlobalKey<FormState>();
  final _idController = TextEditingController();
  final _categoryController = TextEditingController();
  late MaterialGroupCategory _category;
  var _hasVendor = false;


  @override
  void initState() {
    super.initState();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      late MaterialGroupEvent event;

      event = MaterialGroupEvent.create(
        id: _idController.text,
        category: _category,
        hasVendor: _hasVendor,
      );

      context.read<MaterialGroupBloc>().add(event);
    }
  }

  @override
  Widget build(BuildContext context) {
    const action = DataAction.create;
    return BlocListener<MaterialGroupBloc, MaterialGroupState>(
      listener: (context, state) {
        state.maybeWhen(
          success: () {
            Toast(context).dataChanged(DataAction.delete, Entity.materialGroup);
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
          entity: Entity.materialGroup,
          actions: [
            BlocBuilder<MaterialGroupBloc, MaterialGroupState>(
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
            ),
            const Gap(24),
            SelectChipField<MaterialGroupCategory>(
              label: 'Category',
              getLabel: (category) => category.label,
              controller: _categoryController,
              validator: requiredValidator.call,
              options: const [
                MaterialGroupCategory.material,
                MaterialGroupCategory.product,
                MaterialGroupCategory.service,
              ],
              onChanged: (value) {
                _category = value;
              },
            ),
            const Gap(24),
            CheckboxWithText(
              initialValue: _hasVendor,
              text: 'Producer',
              onChanged: (value) {
                _hasVendor = value;
              },
            ),
          ],
        ),
      ),
    );
  }
}
