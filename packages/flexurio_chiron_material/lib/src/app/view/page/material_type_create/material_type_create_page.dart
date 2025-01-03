import 'package:flexurio_chiron_material/src/app/bloc/material_group_query/material_group_query_bloc.dart';
import 'package:flexurio_chiron_material/src/app/bloc/material_type/material_type_bloc.dart';
import 'package:flexurio_chiron_material/src/app/model/material_group.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:page_transition/page_transition.dart';
import 'package:easy_localization/easy_localization.dart';

class MaterialTypeCreatePage extends StatefulWidget {
  const MaterialTypeCreatePage._();

  static Route<bool?> route() {
    return PageTransition(
      opaque: true,
      type: PageTransitionType.rightToLeft,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => MaterialTypeBloc()),
          BlocProvider(
            create: (context) => MaterialGroupQueryBloc()
              ..add(MaterialGroupQueryEvent.fetch(
                pageOptions: PageOptions.emptyNoLimit(),
              )),
          ),
        ],
        child: const MaterialTypeCreatePage._(),
      ),
    );
  }

  @override
  State<MaterialTypeCreatePage> createState() => _MaterialTypeCreatePageState();
}

class _MaterialTypeCreatePageState extends State<MaterialTypeCreatePage> {
  final _formKey = GlobalKey<FormState>();
  final _typeController = TextEditingController();
  late MaterialGroup _materialGroup;

  final _requiredObjectValidator = RequiredObjectValidator<dynamic>(
    errorText: pleaseFillOutThisField.tr(),
  );

  @override
  void initState() {
    super.initState();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      final event = MaterialTypeEvent.create(
        materialGroup: _materialGroup,
        type: _typeController.text,
      );

      context.read<MaterialTypeBloc>().add(event);
    }
  }

  @override
  Widget build(BuildContext context) {
    final entity = Entity.materialType;
    const action = DataAction.create;
    return BlocListener<MaterialTypeBloc, MaterialTypeState>(
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
          actions: [
            BlocBuilder<MaterialTypeBloc, MaterialTypeState>(
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
          formKey: _formKey,
          action: action,
          entity: Entity.materialType,
          children: [
            Column(
              children: [
                BlocBuilder<MaterialGroupQueryBloc, MaterialGroupQueryState>(
                  builder: (context, state) {
                    return FDropDownSearch<MaterialGroup>(
                      validator: _requiredObjectValidator.call,
                      status: state.maybeWhen(
                        error: (_) => Status.error,
                        loading: (_) => Status.progress,
                        orElse: () => Status.loaded,
                      ),
                      labelText: 'Group',
                      items: state.maybeWhen(
                        orElse: () => [],
                        loaded: (materialUnit) => materialUnit.data,
                      ),
                      onChanged: (value) {
                        if (value != null) {
                          _materialGroup = value;
                        }
                      },
                      itemAsString: (materialGroup) => materialGroup.id,
                    );
                  },
                ),
                const Gap(24),
                FTextFormField(
                  labelText: 'Type',
                  controller: _typeController,
                  validator: requiredValidator.call,
                  inputFormatters: inputLetterOnly,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
