import 'package:appointment/src/app/view/widget/drop_down_items/product.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/production_line.dart';
import 'package:appointment/src/app/view/widget/select_field_chip.dart';
import 'package:flexurio_chiron_product/src/app/bloc/product_query/bloc/product_query_bloc.dart';
import 'package:flexurio_chiron_product/src/app/model/product.dart';
import 'package:flexurio_chiron_production/src/app/bloc/production_line_query/production_line_query_bloc.dart';
import 'package:flexurio_chiron_production/src/app/bloc/production_machine_query/production_machine_query_bloc.dart';
import 'package:flexurio_chiron_production/src/app/bloc/production_stage_process/production_stage_process_bloc.dart';
import 'package:flexurio_chiron_production/src/app/bloc/production_stage_process_query/production_stage_process_query_bloc.dart';
import 'package:flexurio_chiron_production/src/app/model/production_line.dart';
import 'package:flexurio_chiron_production/src/app/model/production_stage_process.dart';
import 'package:flexurio_chiron_production/src/app/model/production_stage_process_group.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';

class ProductionStageProcessEditPage extends StatefulWidget {
  const ProductionStageProcessEditPage({
    required this.stageProcessGroup,
    super.key,
  });

  final ProductionStageProcessGroup stageProcessGroup;

  static Route<bool?> route({
    required ProductionStageProcessGroup stageProcessGroup,
  }) {
    return PageTransition(
      opaque: true,
      type: PageTransitionType.rightToLeft,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => ProductionStageProcessBloc()),
          BlocProvider(
            create: (context) =>
                ProductQueryBloc(isExternal: false)..add(const ProductQueryEvent.fetch()),
          ),
          BlocProvider(
            create: (context) => ProductionStageProcessQueryBloc()
              ..add(const ProductionStageProcessQueryEvent.fetch()),
          ),
          BlocProvider(
            create: (context) => ProductionLineQueryBloc()
              ..add(const ProductionLineQueryEvent.get()),
          ),
          BlocProvider(
            create: (context) => ProductionMachineQueryBloc()
              ..add(const ProductionMachineQueryEvent.get()),
          ),
        ],
        child: ProductionStageProcessEditPage(
          stageProcessGroup: stageProcessGroup,
        ),
      ),
    );
  }

  @override
  State<ProductionStageProcessEditPage> createState() =>
      _ProductionStageProcessEditPageState();
}

class _ProductionStageProcessEditPageState
    extends State<ProductionStageProcessEditPage> {
  final _formKey = GlobalKey<FormState>();
  final _typeController = TextEditingController();

  late Product _product;
  late ProductionLine _productionLine;
  late DataAction _action;
  late ProductionStageProcessType _type;

  @override
  void initState() {
    _action = createOrEdit(widget.stageProcessGroup);
    if (_action.isEdit) {
      _product = widget.stageProcessGroup.product;
      _productionLine = widget.stageProcessGroup.line;
      _type = widget.stageProcessGroup.type;
      _typeController.text = widget.stageProcessGroup.type.label;
    }
    super.initState();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      context.read<ProductionStageProcessBloc>().add(
            ProductionStageProcessEvent.edit(
              stageProcessGroup: ProductionStageProcessGroup(
                product: _product,
                line: _productionLine,
                type: _type,
                items: widget.stageProcessGroup.items,
              ),
              stageProcessDetail: widget.stageProcessGroup.items.first,
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    const action = DataAction.edit;
    final entity = Entity.productionStageProcess;
    return BlocListener<ProductionStageProcessBloc,
        ProductionStageProcessState>(
      listener: (context, state) {
        state.maybeWhen(
          success: (_) {
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
          action: action,
          entity: entity,
          formKey: _formKey,
          actions: [
            BlocBuilder<ProductionStageProcessBloc,
                ProductionStageProcessState>(
              builder: (context, state) {
                return Button(
                  action: action,
                  permission: null,
                  onPressed: _submit,
                  isInProgress: state.maybeWhen(
                    loading: () => true,
                    orElse: () => false,
                  ),
                );
              },
            ),
          ],
          children: [
            FDropDownSearchProduct(
              enabled: _action.isCreate,
              initialValue: widget.stageProcessGroup.product,
              onChanged: (value) {
                if (value != null) {
                  _product = value;
                }
              },
            ),
            const SizedBox(height: 12),
            FDropDownSearchProductionLine(
              initialValue: widget.stageProcessGroup.line,
              onChanged: (value) {
                if (value != null) {
                  _productionLine = value;
                }
              },
            ),
            const SizedBox(height: 12),
            SelectChipField<ProductionStageProcessType>(
              enabled: false,
              label: 'Type',
              getLabel: (category) => category.label,
              controller: _typeController,
              options: const [
                ProductionStageProcessType.regular,
                ProductionStageProcessType.ruahan,
              ],
              onChanged: (value) {
                _type = value;
              },
            ),
          ],
        ),
      ),
    );
  }
}
