import 'package:flexurio_chiron_production/src/app/bloc/production_stage_process/production_stage_process_bloc.dart';
import 'package:flexurio_chiron_production/src/app/bloc/production_stage_process_temporary/production_stage_process_temporary_bloc.dart';
import 'package:flexurio_chiron_production/src/app/model/production_stage_process_group.dart';
import 'package:flexurio_chiron_production/src/app/view/page/production_stage_process_detail/widget/detail_delete_button.dart';
import 'package:flexurio_chiron_production/src/app/view/page/production_stage_process_detail/widget/detail_edit_button.dart';
import 'package:flexurio_chiron_production/src/app/view/page/production_stage_process_detail/widget/production_stage_process_detail_data_table.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:page_transition/page_transition.dart';

class ProductionStageProcessDetailPage extends StatefulWidget {
  const ProductionStageProcessDetailPage._({
    required this.stageProcessGroup,
  });
  final ProductionStageProcessGroup stageProcessGroup;
  static Route<bool> route({
    required ProductionStageProcessGroup stageProcessGroup,
  }) {
    return PageTransition(
      opaque: true,
      type: PageTransitionType.rightToLeft,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ProductionStageProcessBloc(),
          ),
          BlocProvider(
            create: (context) => ProductionStageProcessTemporaryBloc(),
          ),
        ],
        child: ProductionStageProcessDetailPage._(
          stageProcessGroup: stageProcessGroup,
        ),
      ),
    );
  }

  @override
  State<ProductionStageProcessDetailPage> createState() =>
      ProductionStageProcessDetailPageState();
}

class ProductionStageProcessDetailPageState
    extends State<ProductionStageProcessDetailPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    context.read<ProductionStageProcessTemporaryBloc>().add(
          ProductStageProcessTemporaryEvent.addAll(
            widget.stageProcessGroup.items,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    const action = DataAction.viewDetail;
    final entity = Entity.productionStageProcess;
    final temporaryBloc = context.read<ProductionStageProcessTemporaryBloc>();
    return Scaffold(
      backgroundColor: const Color.fromARGB(0, 192, 26, 26),
      body: ListView(
        children: [
          SingleFormPanel(
            action: action,
            entity: entity,
            size: SingleFormPanelSize.large,
            formKey: _formKey,
            children: [
              RowFields(
                children: [
                  TileDataVertical(
                    label: 'Line',
                    child: Text(widget.stageProcessGroup.line.name),
                  ),
                  TileDataVertical(
                    label: 'Product ID',
                    child: Text(widget.stageProcessGroup.product.id),
                  ),
                  TileDataVertical(
                    label: 'Product Name',
                    child: Text(widget.stageProcessGroup.product.name),
                  ),
                  TileDataVertical(
                    label: 'Type',
                    child: ChipType(widget.stageProcessGroup.type),
                  ),
                ],
              ),
              const Gap(48),
              ProductionStageProcessDetailTable(
                actionColumn: (stageProcessDetail, index) {
                  return Row(
                    children: [
                      ProductionStageProcessDetailDeleteButton.prepare(
                        stageProcessDetail,
                      ),
                      ProductionStageProcessDetailEditButton(
                        index: index,
                        stageProcessDetail: stageProcessDetail,
                        stageProcessGroup: widget.stageProcessGroup,
                      ),
                    ],
                  );
                },
                showOrderField: true,
                onSuccess: (details) {
                  for (final detail in details) {
                    final event = ProductStageProcessTemporaryEvent.add(detail);
                    temporaryBloc.add(event);
                  }
                },
                onSubmitForm: (context, detail) {
                  context.read<ProductionStageProcessBloc>().add(
                        ProductionStageProcessEvent.create(
                          stageProcessGroup: ProductionStageProcessGroup(
                            product: widget.stageProcessGroup.product,
                            line: widget.stageProcessGroup.line,
                            type: widget.stageProcessGroup.type,
                            items: detail,
                          ),
                        ),
                      );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
