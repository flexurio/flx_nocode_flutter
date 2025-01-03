import 'package:flexurio_chiron_production/src/app/bloc/production_stage/production_stage_bloc.dart';
import 'package:flexurio_chiron_production/src/app/model/production_stage.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';

class ProductionStageCreatePage extends StatefulWidget {
  const ProductionStageCreatePage._(this.productionStage);

  final ProductionStage? productionStage;

  static Route<bool?> route({ProductionStage? productionStage}) {
    return PageTransition(
      opaque: true,
      type: PageTransitionType.rightToLeft,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => ProductionStageBloc()),
        ],
        child: ProductionStageCreatePage._(productionStage),
      ),
    );
  }

  @override
  State<ProductionStageCreatePage> createState() =>
      _ProductionStageCreatePageState();
}

class _ProductionStageCreatePageState extends State<ProductionStageCreatePage> {
  late DataAction _action;
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _action = createOrEdit(widget.productionStage);
    if (_action.isEdit) {
      _nameController.text = widget.productionStage!.name;
    }
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      late ProductionStageEvent event;

      if (_action.isEdit) {
        event = ProductionStageEvent.update(
          widget.productionStage!.id,
          _nameController.text,
        );
      } else {
        event = ProductionStageEvent.create(_nameController.text);
      }

      context.read<ProductionStageBloc>().add(event);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProductionStageBloc, ProductionStageState>(
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
          entity: Entity.productionStage,
          actions: [
            BlocBuilder<ProductionStageBloc, ProductionStageState>(
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
              maxLength: 25,
            ),
          ],
        ),
      ),
    );
  }
}
