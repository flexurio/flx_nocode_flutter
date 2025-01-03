import 'package:appointment/src/app/view/widget/drop_down_items/product.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/production_line.dart';
import 'package:appointment/src/app/view/widget/select_field_chip.dart';
import 'package:flexurio_chiron_product/src/app/bloc/product_query/bloc/product_query_bloc.dart';
import 'package:flexurio_chiron_product/src/app/model/product.dart';
import 'package:flexurio_chiron_production/flexurio_chiron_production.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';

class ProductionStageProcessCreatePage extends StatefulWidget {
  const ProductionStageProcessCreatePage._(
    this.productionStageProcess,
  );

  final ProductionStageProcess? productionStageProcess;

  static Route<bool?> route({
    ProductionStageProcess? productionStageProcess,
  }) {
    return PageTransition(
      opaque: true,
      type: PageTransitionType.rightToLeft,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => ProductionStageProcessBloc()),
          BlocProvider(
            create: (context) => ProductQueryBloc(isExternal: false)
              ..add(
                ProductQueryEvent.fetch(
                  pageOptions: PageOptions.emptyNoLimit(),
                ),
              ),
          ),
          BlocProvider(
            create: (context) => ProductionStageProcessQueryBloc()
              ..add(
                ProductionStageProcessQueryEvent.fetch(
                  pageOptions: PageOptions.emptyNoLimit(),
                ),
              ),
          ),
          BlocProvider(
            create: (context) => ProductionLineQueryBloc()
              ..add(
                ProductionLineQueryEvent.get(
                  pageOptions: PageOptions.emptyNoLimit(),
                ),
              ),
          ),
          BlocProvider(
            create: (context) => ProductionMachineQueryBloc()
              ..add(
                ProductionMachineQueryEvent.get(
                  pageOptions: PageOptions.emptyNoLimit(),
                ),
              ),
          ),
          BlocProvider(
            create: (context) => ProductionStageProcessTemporaryBloc(),
          ),
        ],
        child: ProductionStageProcessCreatePage._(productionStageProcess),
      ),
    );
  }

  @override
  State<ProductionStageProcessCreatePage> createState() =>
      _ProductionStageProcessCreatePageState();
}

class _ProductionStageProcessCreatePageState
    extends State<ProductionStageProcessCreatePage> {
  final _formKey = GlobalKey<FormState>();
  ProductionMachine? productionMachine;
  late Product _product;
  late ProductionLine _productionLine;

  final _typeController = TextEditingController();
  late ProductionStageProcessType _type;

  void _submit(List<ProductionStageProcessDetail> items) {
    if (_formKey.currentState!.validate()) {
      late ProductionStageProcessEvent event;

      //   if (widget.productionStageProcess == null) {
      event = ProductionStageProcessEvent.createMulti(
        stageProcessGroup: ProductionStageProcessGroup(
          product: _product,
          line: _productionLine,
          type: _type,
          items: items,
        ),
      );
      //   }

      context.read<ProductionStageProcessBloc>().add(event);
    }
  }

  @override
  Widget build(BuildContext context) {
    const action = DataAction.create;
    final entity = Entity.productionStageProcess;
    final temporaryBloc = context.read<ProductionStageProcessTemporaryBloc>();
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
          size: SingleFormPanelSize.large,
          actions: [
            BlocBuilder<ProductionStageProcessBloc,
                ProductionStageProcessState>(
              builder: (context, state) {
                return BlocBuilder<ProductionStageProcessTemporaryBloc,
                    List<ProductionStageProcessDetail>>(
                  builder: (context, items) {
                    return Button(
                      permission: null,
                      action: action,
                      isInProgress: state.maybeWhen(
                        loading: () => true,
                        orElse: () => false,
                      ),
                      onPressed: items.isNotEmpty ? () => _submit(items) : null,
                    );
                  },
                );
              },
            ),
          ],
          formKey: _formKey,
          action: action,
          entity: entity,
          children: [
            Column(
              children: [
                FDropDownSearchProduct(
                  onChanged: (value) {
                    if (value != null) {
                      _product = value;
                    }
                  },
                ),
                const SizedBox(height: 12),
                FDropDownSearchProductionLine(
                  onChanged: (value) {
                    if (value != null) {
                      _productionLine = value;
                    }
                  },
                ),
                const SizedBox(height: 12),
                SelectChipField<ProductionStageProcessType>(
                  label: 'Type',
                  getLabel: (category) => category.label,
                  controller: _typeController,
                  validator: requiredValidator.call,
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
            const SizedBox(height: 24),
            const Divider(),
            const SizedBox(height: 24),
            ProductionStageProcessDetailTable(
              actionColumn: (stageProcessDetail, _) =>
                  _DeleteButton(stageProcessDetail),
              onSubmitForm: (context, details) {
                for (final detail in details) {
                  temporaryBloc.add(
                    ProductStageProcessTemporaryEvent.add(detail),
                  );
                }
                Navigator.pop(context);
              },
              showOrderField: false,
            ),
          ],
        ),
      ),
    );
  }
}

class _DeleteButton extends StatelessWidget {
  const _DeleteButton(this.stageProcess);

  final ProductionStageProcessDetail stageProcess;

  @override
  Widget build(BuildContext context) {
    return IconButtonSmall(
      permission: null,
      action: DataAction.delete,
      onPressed: () {
        final bloc = context.read<ProductionStageProcessTemporaryBloc>();
        _showDeleteDialog(context, bloc);
      },
    );
  }

  Future<bool?> _showDeleteDialog(
    BuildContext context,
    ProductionStageProcessTemporaryBloc bloc,
  ) {
    return showDialog<bool?>(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return CardConfirmation(
          isProgress: false,
          action: DataAction.delete,
          data: Entity.productionStageProcess,
          label: stageProcess.subStage.name,
          onConfirm: () {
            bloc.add(
              ProductStageProcessTemporaryEvent.remove(
                stageProcess,
              ),
            );
            Navigator.pop(context);
          },
        );
      },
    );
  }
}
