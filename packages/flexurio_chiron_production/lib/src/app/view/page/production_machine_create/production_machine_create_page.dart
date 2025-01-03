import 'package:flexurio_chiron_production/src/app/bloc/production_machine/production_machine_bloc.dart';
import 'package:flexurio_chiron_production/src/app/model/production_machine.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';

class ProductionMachineCreatePage extends StatefulWidget {
  const ProductionMachineCreatePage._(this.productionMachine);

  final ProductionMachine? productionMachine;

  static Route<bool?> route({ProductionMachine? productionMachine}) {
    return PageTransition(
      opaque: true,
      type: PageTransitionType.rightToLeft,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => ProductionMachineBloc()),
        ],
        child: ProductionMachineCreatePage._(productionMachine),
      ),
    );
  }

  @override
  State<ProductionMachineCreatePage> createState() =>
      _ProductionMachineCreatePageState();
}

class _ProductionMachineCreatePageState
    extends State<ProductionMachineCreatePage> {
  late DataAction _action;
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _assetNumberController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _action = createOrEdit(widget.productionMachine);
    if (_action.isEdit) {
      _nameController.text = widget.productionMachine!.name;
      _assetNumberController.text = widget.productionMachine!.assetNumber ?? '';
    }
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      late ProductionMachineEvent event;

      if (_action.isEdit) {
        event = ProductionMachineEvent.update(
          widget.productionMachine!.id,
          _nameController.text,
          _assetNumberController.text,
        );
      } else {
        event = ProductionMachineEvent.create(
          _nameController.text,
          _assetNumberController.text,
        );
      }

      context.read<ProductionMachineBloc>().add(event);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProductionMachineBloc, ProductionMachineState>(
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
          entity: Entity.productionMachine,
          actions: [
            BlocBuilder<ProductionMachineBloc, ProductionMachineState>(
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
            const SizedBox(height: 24),
            FTextFormField(
              labelText: 'Asset Number',
              controller: _assetNumberController,
              validator: requiredValidator.call,
            ),
          ],
        ),
      ),
    );
  }
}
