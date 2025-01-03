import 'package:flexurio_chiron_production/flexurio_chiron_production.dart';
import 'package:flexurio_chiron_production/src/app/bloc/production_sub_stage/production_sub_stage_bloc.dart';
import 'package:flexurio_chiron_production/src/app/model/production_sub_stage.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';

class ProductionSubStageCreatePage extends StatefulWidget {
  const ProductionSubStageCreatePage._({
    required this.productionSubStage,
    required this.productionStage,
  });

  final ProductionSubStage? productionSubStage;
  final ProductionStage productionStage;

  static Route<bool?> route({
    required ProductionStage productionStage,
    ProductionSubStage? productionSubStage,
  }) {
    return PageTransition(
      opaque: true,
      type: PageTransitionType.rightToLeft,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => ProductionSubStageBloc()),
        ],
        child: ProductionSubStageCreatePage._(
          productionStage: productionStage,
          productionSubStage: productionSubStage,
        ),
      ),
    );
  }

  @override
  State<ProductionSubStageCreatePage> createState() =>
      _ProductionSubStageCreatePageState();
}

class _ProductionSubStageCreatePageState
    extends State<ProductionSubStageCreatePage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  late DataAction _action;

  @override
  void initState() {
    super.initState();

    _action = createOrEdit(widget.productionSubStage);

    if (_action.isEdit) {
      _nameController.text = widget.productionSubStage!.name;
    }
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      late ProductionSubStageEvent event;

      if (_action.isEdit) {
        event = ProductionSubStageEvent.update(
          widget.productionSubStage!.id,
          _nameController.text,
        );
      } else {
        event = ProductionSubStageEvent.create(
          _nameController.text,
          widget.productionStage.id,
        );
      }

      context.read<ProductionSubStageBloc>().add(event);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProductionSubStageBloc, ProductionSubStageState>(
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
          entity: Entity.productionSubStage,
          actions: [
            BlocBuilder<ProductionSubStageBloc, ProductionSubStageState>(
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
            FTextFormField(
              labelText: 'Name',
              controller: _nameController,
              validator: requiredValidator.call,
            ),
          ],
        ),
      ),
    );
  }
}
