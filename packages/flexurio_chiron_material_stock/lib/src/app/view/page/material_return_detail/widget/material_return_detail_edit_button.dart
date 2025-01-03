import 'package:flexurio_chiron_material_stock/flexurio_chiron_material_stock.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/model/transaction_type.dart';

class MaterialReturnDetailEditButton extends StatefulWidget {
  const MaterialReturnDetailEditButton({
    required this.materialReturnDetail,
    required this.bloc,
    this.materialReturnType,
    super.key,
  });

  final MaterialReturnDetail materialReturnDetail;
  final MaterialReturnBloc bloc;
  final MaterialReturnType? materialReturnType;

  @override
  State<MaterialReturnDetailEditButton> createState() =>
      _MaterialReturnDetailEditButtonState();
}

class _MaterialReturnDetailEditButtonState
    extends State<MaterialReturnDetailEditButton> {
  @override
  Widget build(BuildContext context) {
    const action = DataAction.edit;
    return IconButtonSmall(
      permission:
          PermissionMaterialStock.materialReturnDetailEdit(isExternal: false),
      action: action,
      onPressed: () async {
        await showDialog<bool?>(
          context: context,
          builder: (context) {
            return SimpleDialog(
              backgroundColor: Colors.transparent,
              children: [
                BlocProvider(
                  create: (context) => MaterialReturnBloc(),
                  child: MaterialReturnDetailCreatePage.prepare(
                      materialReturnDetail: widget.materialReturnDetail,
                      bloc: widget.bloc,
                      materialReturnType: widget.materialReturnDetail
                                  .materialReturn.transactionType.flag ==
                              TransactionTypeFlag.adjustmentMaterial
                          ? MaterialReturnType.adjustment
                          : MaterialReturnType.returnX),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
