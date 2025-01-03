import 'package:flexurio_chiron_product/src/app/bloc/product_formulation_detail/product_formulation_detail_bloc.dart';
import 'package:flexurio_chiron_product/src/app/model/product_formulation.dart';
import 'package:flexurio_chiron_product/src/app/model/product_formulation_detail.dart';
import 'package:flexurio_chiron_product/src/app/view/page/product_formulation_create/product_formulation_detail_delete_button.dart';
import 'package:flexurio_chiron_product/src/app/view/page/product_formulation_create/product_formulation_detail_edit_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductFormulationDetailTable extends StatelessWidget {
  const ProductFormulationDetailTable({
    required this.action,
    required this.header,
    required this.isExternal,
    super.key,
    this.productFormulationType,
    this.hideAction = false,
  });

  final ProductFormulationType? productFormulationType;
  final DataAction action;
  final Widget header;
  final bool hideAction;
  final bool isExternal;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FCard(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                header,
                const SizedBox(height: 30),
                _MaterialRequestDetailTable(
                  hideAction: hideAction,
                  productFormulationType: productFormulationType,
                  isExternal: isExternal,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _MaterialRequestDetailTable extends StatelessWidget {
  const _MaterialRequestDetailTable({
    required this.hideAction,
    this.productFormulationType,
    required this.isExternal,
  });

  final bool hideAction;
  final ProductFormulationType? productFormulationType;
  final bool isExternal;

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProductFormulationDetailBloc,
        List<ProductFormulationDetailTemporary>>(
      listener: (context, state) {},
      child: BlocBuilder<ProductFormulationDetailBloc,
          List<ProductFormulationDetailTemporary>>(
        builder: (context, temporary) {
          final sortedDetails =
              List<ProductFormulationDetailTemporary>.from(temporary)
                ..sort((a, b) {
                  final groupA = a.material?.materialGroup.id ?? '';
                  final groupB = b.material?.materialGroup.id ?? '';
                  final compare = groupA.compareTo(groupB);
                  if (compare != 0) {
                    return compare;
                  } else {
                    final materialA = a.material?.name ?? '';
                    final materialB = b.material?.name ?? '';
                    return materialA.compareTo(materialB);
                  }
                });
          return YuhuTable<ProductFormulationDetailTemporary>(
            data: sortedDetails,
            width: 1050,
            columns: [
              TableColumn(
                width: 200,
                title: 'Material ID',
                builder: (formulation, _) {
                  return Text(formulation.material!.id);
                },
              ),
              TableColumn(
                width: 250,
                title: 'material_name'.tr(),
                builder: (formulation, _) {
                  return Text(formulation.material!.name);
                },
              ),
              TableColumn(
                width: 150,
                title: 'Unit',
                builder: (formulation, _) {
                  return Text(formulation.material!.stockUnit.id);
                },
              ),
              TableColumn(
                width: 150,
                title: 'quantity'.tr(),
                builder: (formulation, _) {
                  return Text('${formulation.quantity}');
                },
              ),
              if (!hideAction)
                TableColumn(
                  width: 150,
                  title: 'actions'.tr(),
                  builder: (formulation, _) {
                    return Row(
                      children: [
                        UpdateButton(
                          isExternal: isExternal,
                          productFormulationType: productFormulationType,
                          productFormulationDetailTemporary: formulation,
                        ),
                        MaterialRequestDetailDeleteButton(
                          detail: formulation,
                        ),
                      ],
                    );
                  },
                ),
            ],
          );
        },
      ),
    );
  }
}
