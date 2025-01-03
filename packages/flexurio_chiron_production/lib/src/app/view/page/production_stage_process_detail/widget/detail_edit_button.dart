import 'package:flexurio_chiron_production/flexurio_chiron_production.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductionStageProcessDetailEditButton extends StatelessWidget {
  const ProductionStageProcessDetailEditButton({
    required this.stageProcessDetail,
    required this.stageProcessGroup,
    required this.index,
    super.key,
  });

  final int index;
  final ProductionStageProcessDetail stageProcessDetail;
  final ProductionStageProcessGroup stageProcessGroup;

  @override
  Widget build(BuildContext context) {
    final temporaryBloc = context.read<ProductionStageProcessTemporaryBloc>();
    return IconButtonSmall(
      permission: PermissionProduction.productionStageProcessEdit,
      action: DataAction.edit,
      onPressed: () {
        Navigator.push(
          context,
          ProductStageProcessDetailCreatePage.route(
            onSuccess: (stageProcessDetail) {
              final event = ProductStageProcessTemporaryEvent.replace(
                index,
                stageProcessDetail.first,
              );
              temporaryBloc.add(event);
            },
            onSubmitForm: (context, stageProcessDetail) {
              context.read<ProductionStageProcessBloc>().add(
                    ProductionStageProcessEvent.edit(
                      stageProcessGroup: ProductionStageProcessGroup(
                        product: stageProcessGroup.product,
                        line: stageProcessGroup.line,
                        type: stageProcessGroup.type,
                        items: stageProcessDetail,
                      ),
                      stageProcessDetail: stageProcessDetail.first,
                    ),
                  );
            },
            showOrderField: true,
            stageProcessDetail: stageProcessDetail,
          ),
        );
      },
    );
  }
}
