import 'package:flexurio_chiron_purchase_request/src/app/bloc/material_request_detail_query/material_request_detail_query_bloc.dart';
import 'package:flexurio_chiron_purchase_request/src/app/bloc/material_request_detail_temporary/material_request_detail_temporary_bloc.dart';
import 'package:flexurio_chiron_purchase_request/src/app/model/material_request_detail.dart';
import 'package:flexurio_chiron_purchase_order/src/app/bloc/purchase_order/purchase_order_bloc.dart';
import 'package:flexurio_chiron_purchase_order/src/app/model/purchase_order_detail.dart';
import 'package:flexurio_chiron_purchase_order/src/app/view/page/purchase_order_create/widget/material_add_button.dart';
import 'package:flexurio_chiron_purchase_order/src/app/view/page/purchase_order_create/widget/material_table_edit.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class PurchaseOrderCreateMaterialForm extends StatefulWidget {
  const PurchaseOrderCreateMaterialForm({
    required this.onNext,
    required this.onPrevious,
    super.key,
  });

  final void Function() onNext;
  final void Function() onPrevious;

  @override
  State<PurchaseOrderCreateMaterialForm> createState() =>
      _PurchaseOrderCreateMaterialFormState();
}

class _PurchaseOrderCreateMaterialFormState
    extends State<PurchaseOrderCreateMaterialForm> {
  final _formKey = GlobalKey<FormState>();
  final _materials = <int, PurchaseOrderDetail>{};

  void _submit(BuildContext context) {
    if (_materials.isNotEmpty) {
      context.read<PurchaseOrderBloc>().add(
            PurchaseOrderEvent.createFormMaterial(_materials.values.toList()),
          );
      widget.onNext();
      return;
    }
    Toast(context).fail('Please provide the price for at least one material');
  }

  @override
  Widget build(BuildContext context) {
    return FormAction(
      formKey: _formKey,
      actions: [
        Button(
          permission: null,
          isSecondary: true,
          action: DataAction.back,
          onPressed: () => widget.onPrevious(),
        ),
        const Gap(12),
        Button(
          permission: null,
          action: DataAction.next,
          onPressed: () => _submit(context),
        ),
      ],
      children: [
        BlocBuilder<MaterialRequestDetailQueryBloc,
            MaterialRequestDetailQueryState>(
          builder: (context, state) {
            return state.maybeWhen(
              loaded: (materialRequestDetails) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      AddButton(
                        initialQuantity: materialRequestDetails.first.quantity,
                      ),
                    ],
                  ),
                );
              },
              orElse: SizedBox.shrink,
            );
          },
        ),
        BlocBuilder<MaterialRequestDetailTemporaryBloc,
            List<PurchaseRequestDetail>>(
          builder: (context, temporary) {
            return BlocBuilder<MaterialRequestDetailQueryBloc,
                MaterialRequestDetailQueryState>(
              builder: (context, state) {
                final data = state.maybeWhen(
                  loaded: (materialRequestDetail) =>
                      List<PurchaseRequestDetail>.from(materialRequestDetail)
                        ..addAll(temporary),
                  orElse: () => <PurchaseRequestDetail>[],
                );
                final status = state.maybeWhen(
                  loaded: (_) => Status.loaded,
                  loading: () => Status.progress,
                  orElse: () => Status.error,
                );
                return state.maybeWhen(
                  orElse: SizedBox.shrink,
                  loading: () {
                    return const Center(child: CupertinoActivityIndicator());
                  },
                  loaded: (materialRequest) {
                    return PurchaseOrderDetailMaterialTableEdit(
                      data: data,
                      status: status,
                      onChangedPrice: (price, materialRequestDetail, index) {
                        if (price > 0) {
                          _materials[index] =
                              PurchaseOrderDetail.empty().copyWith(
                            product: materialRequestDetail.product,
                            material: materialRequestDetail.material,
                            quantity: materialRequestDetail.quantity,
                            price: price,
                            id: materialRequestDetail.id,
                            materialDesign:
                                materialRequestDetail.materialDesign,
                            materialRequestDetail:
                                materialRequestDetail.status ==
                                        PurchaseRequestDetailStatus.temporary
                                    ? null
                                    : materialRequestDetail,
                            unit: materialRequestDetail.unit,
                          );
                        } else {
                          _materials.remove(index);
                        }
                        setState(() {});
                      },
                      materials: _materials,
                      temporaryLength: temporary.length,
                    );
                  },
                );
              },
            );
          },
        ),
      ],
    );
  }
}
