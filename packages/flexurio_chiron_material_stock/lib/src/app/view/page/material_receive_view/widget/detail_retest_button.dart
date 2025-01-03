import 'package:flexurio_chiron_material_stock/flexurio_chiron_material_stock.dart';
import 'package:flexurio_chiron_material_stock/src/app/view/page/material_receive_detail/release_reject_form.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MaterialReceiveDetailRetestButton extends StatelessWidget {
  const MaterialReceiveDetailRetestButton({
    required this.detail,
    required this.materialReceive,
    required this.isExternal,
    super.key,
  });

  final MaterialReceiveDetail detail;
  final MaterialReceive materialReceive;
  final bool isExternal;

  @override
  Widget build(BuildContext context) {
    return IconButtonSmall(
      permission: PermissionMaterialStock.materialReceiveRetestEdit(
        isExternal: isExternal,
      ),
      action: DataAction.retest,
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
                  child: MaterialReceiveDetailReleaseRejectForm.prepare(
                    detail: detail,
                    isExternal: isExternal,
                    action: DataAction.retest,
                    onSubmitted: (
                            {required bloc,
                            date,
                            rejectReason,
                            rejectStatus,
                            required vatNoFirst,
                            required vatNoLast}) =>
                        bloc.add(
                      MaterialReceiveDetailEvent.retest(
                        materialReceiveDetail: detail,
                        vatNo: [
                          vatNoFirst,
                          vatNoLast,
                        ],
                        retestDateQc: date,
                      ),
                    ),
                  ),
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
