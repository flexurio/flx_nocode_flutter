import 'package:flexurio_chiron_purchase_request/src/app/model/material_request_detail.dart';
import 'package:flexurio_chiron_purchase_request/src/app/view/page/material_request_detail/widget/delete_button.dart';
import 'package:appointment/src/app/view/widget/string_to_double.dart';
import 'package:flexurio_chiron_purchase_order/src/app/model/purchase_order_detail.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';

class PurchaseOrderDetailMaterialTableEdit extends StatefulWidget {
  const PurchaseOrderDetailMaterialTableEdit({
    required this.data,
    required this.status,
    required this.onChangedPrice,
    required this.materials,
    required this.temporaryLength,
    super.key,
    this.hideAction = false,
    this.onChangedQuantity,
  });

  final List<PurchaseRequestDetail> data;
  final Status status;
  final bool hideAction;
  final int temporaryLength;
  final void Function(
    double price,
    PurchaseRequestDetail materialRequestDetail,
    int index,
  )? onChangedPrice;
  final void Function(
    double quantity,
    int index,
  )? onChangedQuantity;
  final Map<int, PurchaseOrderDetail> materials;

  @override
  State<PurchaseOrderDetailMaterialTableEdit> createState() =>
      _PurchaseOrderDetailMaterialTableEditState();
}

class _PurchaseOrderDetailMaterialTableEditState
    extends State<PurchaseOrderDetailMaterialTableEdit> {
  final priceControllers = <TextEditingController>[];
  final quantityControllers = <TextEditingController>[];

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < widget.materials.length; i++) {
      priceControllers.add(
        TextEditingController()..text = widget.materials[i]!.price.toString(),
      );
      quantityControllers.add(
        TextEditingController()
          ..text = widget.materials[i]!.quantity.toString(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return YuhuTable<PurchaseRequestDetail>(
      rowHeight: 80,
      columns: [
        TableColumn(
          width: 90,
          title: 'Type',
          builder: (materialRequestDetail, _) {
            final isProduct = materialRequestDetail.product != null &&
                materialRequestDetail.product!.id != '';
            return Text(
              isProduct ? Entity.product.title : Entity.material.title,
            );
          },
        ),
        TableColumn(
          title: 'Name',
          builder: (materialRequestDetail, _) {
            return Text(
              materialRequestDetail.itemName,
            );
          },
        ),
        TableColumn(
          title: 'Design',
          builder: (materialRequestDetail, _) {
            return Text(
              materialRequestDetail.materialDesign?.designCode ?? '-',
            );
          },
        ),
        TableColumn(
          title: 'Quantity',
          alignment: Alignment.centerRight,
          builder: (materialRequestDetail, index) {
            if (widget.onChangedQuantity != null) {
              return FTextFormField(
                controller: index < quantityControllers.length
                    ? quantityControllers[index]
                    : null,
                inputFormatters: [
                  currencyFormatter,
                ],
                onChanged: (value) => widget.onChangedQuantity!(
                  stringDecimalToDouble(value),
                  index,
                ),
              );
            }
            return Text('${materialRequestDetail.quantity}');
          },
        ),
        TableColumn(
          title: 'Unit',
          width: 80,
          builder: (materialRequestDetail, _) {
            return Text(materialRequestDetail.unit.id);
          },
        ),
        TableColumn(
          width: 150,
          title: 'Unit Price',
          builder: (materialRequestDetail, index) {
            if (widget.onChangedPrice != null) {
              return FTextFormField(
                controller: index < priceControllers.length
                    ? priceControllers[index]
                    : null,
                inputFormatters: [
                  currencyFormatter,
                ],
                onChanged: (value) => widget.onChangedPrice!(
                  stringDecimalToDouble(value),
                  materialRequestDetail,
                  index,
                ),
              );
            }
            return Text(widget.materials[index]?.subtotal.format() ?? '');
          },
        ),
        TableColumn(
          title: 'Sub Total',
          alignment: Alignment.centerRight,
          builder: (materialRequestDetail, index) {
            return Text(widget.materials[index]?.subtotal.format() ?? '');
          },
        ),
        if (!widget.hideAction)
          TableColumn(
            title: 'Action',
            alignment: Alignment.centerRight,
            builder: (materialRequestDetail, index) {
              return widget.data.length - widget.temporaryLength - 1 < index
                  ? MaterialRequestDetailTemporaryDeleteButton(
                      materialRequestDetail: materialRequestDetail,
                    )
                  : Container();
            },
          ),
      ],
      status: widget.status,
      data: widget.data,
    );
  }
}
