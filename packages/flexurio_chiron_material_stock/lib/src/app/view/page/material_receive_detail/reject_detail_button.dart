import 'package:flexurio_chiron_material_stock/flexurio_chiron_material_stock.dart';
import 'package:flexurio_chiron_material_stock/src/app/view/page/material_receive_detail/release_reject_form.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MaterialReceiveDetailRejectButton extends StatelessWidget {
  const MaterialReceiveDetailRejectButton({
    required this.detail,
    required this.materialReceive,
    super.key,
    required this.isExternal,
  });

  final MaterialReceiveDetail detail;
  final MaterialReceive materialReceive;
  final bool isExternal;

  @override
  Widget build(BuildContext context) {
    return IconButtonSmall(
      permission:
          PermissionMaterialStock.materialReceiveReject(isExternal: isExternal),
      action: DataAction.reject,
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
                    action: DataAction.reject,
                    onSubmitted: (
                            {required bloc,
                            date,
                            rejectReason,
                            rejectStatus,
                            required vatNoFirst,
                            required vatNoLast}) =>
                        bloc.add(
                      MaterialReceiveDetailEvent.reject(
                        materialReceiveDetail: detail,
                        vatNo: [
                          vatNoFirst,
                          vatNoLast,
                        ],
                        statusReject: rejectStatus,
                        reason: rejectReason,
                      ),
                    ),
                    // onSubmitted: (
                    //   bloc,
                    //   vatNoFirst,
                    //   vatNoLast,
                    //   date,
                    //   rejectStatus,
                    //   rejectReason,
                    // ) =>
                    //     bloc.add(
                    //   MaterialReceiveDetailEvent.reject(
                    //     materialReceiveDetail: detail,
                    //     vatNo: [
                    //       vatNoFirst,
                    //       vatNoLast,
                    //     ],
                    //     statusReject: rejectStatus,
                    //     reason: rejectReason,
                    //   ),
                    // ),
                    isExternal: isExternal,
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
