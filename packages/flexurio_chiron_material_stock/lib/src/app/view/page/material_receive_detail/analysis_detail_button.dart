import 'package:flexurio_chiron_material_stock/flexurio_chiron_material_stock.dart';
import 'package:flexurio_chiron_material_stock/src/app/view/page/material_receive_detail/material_analysis_detail_form.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MaterialReceiveDetailAnalysisButton extends StatelessWidget {
  const MaterialReceiveDetailAnalysisButton({
    required this.materialReceiveDetail,
    required this.materialReceive,
    required this.isExternal,
    super.key,
  });

  final MaterialReceiveDetail materialReceiveDetail;
  final MaterialReceive materialReceive;
  final bool isExternal;

  @override
  Widget build(BuildContext context) {
    return IconButtonSmall(
      permission: Permission.materialAnalysis,
      action: DataAction.editAnalysis,
      onPressed: () async {
        await showDialog<bool?>(
          context: context,
          builder: (context) {
            return SimpleDialog(
              backgroundColor: Colors.transparent,
              children: [
                BlocProvider(
                  create: (context) =>
                      MaterialReceiveBloc(isExternal: isExternal),
                  child: MaterialReceiveDetailAnalysisForm.prepare(
                      detail: materialReceiveDetail),
                ),
              ],
            );
          },
        ).then(
          (value) {
            if (value ?? false) {
              context.read<MaterialReceiveDetailQueryBloc>().add(
                    MaterialReceiveDetailQueryEvent.fetch(
                      materialReceive: materialReceive,
                    ),
                  );
            }
          },
        );
      },
    );
  }
}
