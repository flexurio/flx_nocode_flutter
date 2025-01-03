import 'package:flexurio_chiron_production/src/app/bloc/production_line/production_line_bloc.dart';
import 'package:flexurio_chiron_production/src/app/model/production_line.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';

class ProductionLineCreatePage extends StatefulWidget {
  const ProductionLineCreatePage._(this.productionLine);

  final ProductionLine? productionLine;

  static Route<bool?> route({ProductionLine? productionLine}) {
    return PageTransition(
      opaque: true,
      type: PageTransitionType.rightToLeft,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => ProductionLineBloc()),
        ],
        child: ProductionLineCreatePage._(productionLine),
      ),
    );
  }

  @override
  State<ProductionLineCreatePage> createState() =>
      _ProductionLineCreatePageState();
}

class _ProductionLineCreatePageState extends State<ProductionLineCreatePage> {
  late DataAction _action;
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();


  @override
  void initState() {
    super.initState();
    _action = createOrEdit(widget.productionLine);
    if (_action.isEdit) {
      _nameController.text = widget.productionLine!.name;
    }
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      late ProductionLineEvent event;

      if (_action.isEdit) {
        event = ProductionLineEvent.update(
          widget.productionLine!.id,
          _nameController.text,
        );
      } else {
        event = ProductionLineEvent.create(_nameController.text);
      }

      context.read<ProductionLineBloc>().add(event);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProductionLineBloc, ProductionLineState>(
      listener: (context, state) {
        state.maybeWhen(
          success: () {
            if (_action == DataAction.create) {
              Toast(context)
                  .success(Message.successCreated(Entity.productionLine));
            }
            if (_action == DataAction.edit) {
              Toast(context)
                  .success(Message.successUpdated(Entity.productionLine));
            }
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
          entity: Entity.productionLine,
          actions: [
            BlocBuilder<ProductionLineBloc, ProductionLineState>(
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
