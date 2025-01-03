import 'package:flexurio_chiron_material_stock/src/app/model/material_receive.dart';
import 'package:flexurio_chiron_material_stock/src/app/view/page/material_receive_detail/remove_button.dart';
import 'package:appointment/src/app/view/widget/string_to_double.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_purchase_order/flexurio_chiron_purchase_order.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:pattern_formatter/numeric_formatter.dart';

class MaterialReceiveDetailTable extends StatefulWidget {
  const MaterialReceiveDetailTable({
    required this.createType,
    required this.action,
    required this.purchaseOrderDetails,
    required this.temporaryLength,
    super.key,
    this.canDelete = false,
    this.canEdit = true,
    this.onChangedQuantity,
    this.onChangedVatTotal,
    this.onChangedBatch,
    this.onChangedExpDate,
    this.onChangedBestBefore,
    this.onChangedMfgDate,
    this.onChangedRetestDate,
    this.onRemoveDetail,
    this.onChangedShelfLife,
    required this.initialBatch,
    required this.initialQuantity,
    required this.initialVatTotal,
    required this.initialExpDate,
    required this.initialBestBefore,
    required this.initialMfgDate,
    required this.initialRetestDate,
    required this.initialShelfLife,
    required this.isExternal,
  });
  final bool canDelete;
  final bool canEdit;
  final DataAction action;
  final MaterialReceiveType createType;
  final List<PurchaseOrderDetail> purchaseOrderDetails;
  final int temporaryLength;
  final void Function(int index)? onRemoveDetail;
  final void Function(int index, double quantity)? onChangedQuantity;
  final void Function(int index, int vatTotal)? onChangedVatTotal;
  final void Function(int index, String batch)? onChangedBatch;
  final void Function(int index, DateTime date)? onChangedExpDate;
  final void Function(int index, DateTime date)? onChangedBestBefore;
  final void Function(int index, DateTime date)? onChangedMfgDate;
  final void Function(int index, DateTime date)? onChangedRetestDate;
  final void Function(int index, DateTime date)? onChangedShelfLife;
  final List<String> initialBatch;
  final List<double> initialQuantity;
  final List<int> initialVatTotal;
  final List<DateTime?> initialExpDate;
  final List<DateTime?> initialBestBefore;
  final List<DateTime?> initialMfgDate;
  final List<DateTime?> initialRetestDate;
  final List<DateTime?> initialShelfLife;
  final bool isExternal;

  @override
  State<MaterialReceiveDetailTable> createState() =>
      _MaterialReceiveDetailTableState();
}

class _MaterialReceiveDetailTableState
    extends State<MaterialReceiveDetailTable> {
  final _batchControllers = <TextEditingController>[];
  final _expDates = <TextEditingController>[];
  final _bestBeforeDates = <TextEditingController>[];
  final _mfgDates = <TextEditingController>[];
  final _retestDates = <TextEditingController>[];
  final _shelfLife = <TextEditingController>[];
  final _quantityControllers = <TextEditingController>[];
  final _vatControllers = <TextEditingController>[];

  @override
  void initState() {
    for (var i = 0; i < widget.purchaseOrderDetails.length; i++) {
      _batchControllers.add(
        TextEditingController(text: widget.initialBatch[i]),
      );
      _quantityControllers.add(
        TextEditingController(text: widget.initialQuantity[i].toString()),
      );
      _vatControllers.add(
        TextEditingController(text: widget.initialVatTotal[i].toString()),
      );
      _bestBeforeDates.add(TextEditingController(
          text: widget.initialBestBefore[i] != null
              ? widget.initialBestBefore[i].toString()
              : ''));
      _expDates.add(TextEditingController(
          text: widget.initialExpDate[i] != null
              ? widget.initialExpDate[i].toString()
              : ''));
      _mfgDates.add(TextEditingController(
          text: widget.initialMfgDate[i] != null
              ? widget.initialMfgDate[i].toString()
              : ''));
      _retestDates.add(TextEditingController(
          text: widget.initialRetestDate[i] != null
              ? widget.initialRetestDate[i].toString()
              : ''));
      _shelfLife.add(TextEditingController(
          text: widget.initialShelfLife[i] != null
              ? widget.initialShelfLife[i].toString()
              : ''));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return YuhuTable<PurchaseOrderDetail>(
      freezeLastColumn: true,
      rowHeight: 65,
      width: 2540,
      data: widget.purchaseOrderDetails,
      columns: [
        TableColumn(
          width: 140,
          title: 'material_id'.tr(),
          builder: (purchaseOrderDetails, _) {
            return Text(
              purchaseOrderDetails.material?.id ?? '-',
            );
          },
        ),
        TableColumn(
          width: 180,
          title: 'material_name'.tr(),
          builder: (purchaseOrderDetails, _) {
            return Text(
              purchaseOrderDetails.material?.name ?? '-',
            );
          },
        ),
        TableColumn(
          title: 'Unit',
          width: 100,
          builder: (purchaseOrderDetails, _) {
            return Text(
              purchaseOrderDetails.unit.id,
            );
          },
        ),
        TableColumn(
          width: 180,
          title: 'design_code'.tr(),
          builder: (purchaseOrderDetails, _) {
            return Text(
              purchaseOrderDetails.materialDesign?.designCode ?? '-',
            );
          },
        ),
        TableColumn(
          width: 180,
          title: 'batch'.tr(),
          builder: (purchaseOrderDetails, index) {
            if (widget.onChangedBatch != null) {
              return FTextFormField(
                controller: _batchControllers[index],
                onChanged: (value) {
                  widget.onChangedBatch!(
                    index,
                    value,
                  );
                },
              );
            }
            return Text(purchaseOrderDetails.productionOrder?.id ?? '-');
          },
        ),
        TableColumn(
          width: 160,
          title: 'pack_size'.tr(),
          builder: (purchaseOrderDetails, _) {
            return Text(
              purchaseOrderDetails.material?.packSize.format() ?? '0',
            );
          },
        ),
        TableColumn(
          alignment: Alignment.centerRight,
          width: 180,
          title: 'quantity_po'.tr(),
          builder: (purchaseOrderDetails, index) {
            return Text(
              widget.purchaseOrderDetails[index].quantityPurchaseOrder.format(),
            );
          },
        ),
        TableColumn(
          alignment: Alignment.centerRight,
          title: 'quantity'.tr(),
          width: 140,
          builder: (purchaseOrderDetails, index) {
            if (widget.onChangedQuantity != null) {
              return FTextFormField(
                controller: _quantityControllers[index],
                inputFormatters: [
                  DecimalInputFormatter(),
                ],
                onChanged: (value) {
                  widget.onChangedQuantity!(index, double.parse(value));
                },
              );
            }
            return Text(_quantityControllers[index].text);
          },
        ),
        TableColumn(
          alignment: Alignment.centerRight,
          width: 160,
          title: 'vat_total'.tr(),
          builder: (purchaseOrderDetails, index) {
            if (widget.onChangedVatTotal != null) {
              return FTextFormField(
                controller: _vatControllers[index],
                inputFormatters: [
                  ThousandsFormatter(),
                ],
                onChanged: (value) {
                  widget.onChangedVatTotal!(
                    index,
                    stringToInt(value),
                  );
                },
              );
            }
            return Text(_vatControllers[index].text);
          },
        ),
        TableColumn(
          alignment: Alignment.centerRight,
          width: 160,
          title: 'total_quantity'.tr(),
          builder: (purchaseOrderDetails, index) {
            return Text(
              (widget.initialQuantity[index] * widget.initialVatTotal[index])
                  .format(),
            );
          },
        ),
        TableColumn(
          width: 160,
          title: 'mfg_date'.tr(),
          builder: (purchaseOrderDetails, index) {
            return FieldDatePicker(
              controller: _mfgDates[index],
              labelText: '',
              maxDate: DateTime.now(),
              onChanged: (value) {
                _mfgDates[index].text = value.yMMMMd;
                widget.onChangedMfgDate!(index, value);
              },
            );
          },
        ),
        TableColumn(
          width: 160,
          title: 'expired_date'.tr(),
          builder: (purchaseOrderDetails, index) {
            return FieldDatePicker(
              controller: _expDates[index],
              labelText: '',
              minDate: DateTime.now(),
              onChanged: (value) {
                _expDates[index].text = value.yMMMMd;
                widget.onChangedExpDate!(index, value);
              },
            );
          },
        ),
        TableColumn(
          width: 160,
          title: 'shelf_life'.tr(),
          builder: (purchaseOrderDetails, index) {
            return FieldDatePicker(
              controller: _shelfLife[index],
              minDate: DateTime.now(),
              labelText: '',
              onChanged: (value) {
                _shelfLife[index].text = value.yMMMMd;
                widget.onChangedShelfLife!(index, value);
              },
            );
          },
        ),
        TableColumn(
          width: 160,
          title: 'best_before'.tr(),
          builder: (purchaseOrderDetails, index) {
            return FieldDatePicker(
              controller: _bestBeforeDates[index],
              labelText: '',
              minDate: DateTime.now(),
              onChanged: (value) {
                _bestBeforeDates[index].text = value.yMMMMd;
                widget.onChangedBestBefore!(index, value);
              },
            );
          },
        ),
        TableColumn(
          width: 160,
          title: 'retest_date'.tr(),
          builder: (purchaseOrderDetails, index) {
            return FieldDatePicker(
              controller: _retestDates[index],
              minDate: DateTime.now(),
              labelText: '',
              onChanged: (value) {
                _retestDates[index].text = value.yMMMMd;
                widget.onChangedRetestDate!(index, value);
              },
            );
          },
        ),
        TableColumn(
          width: 160,
          title: 'actions'.tr(),
          builder: (purchaseOrderDetails, index) {
            return widget.purchaseOrderDetails.length -
                        widget.temporaryLength -
                        1 <
                    index
                ? MaterialReceiveDetailTemporaryRemoveButton.prepare(
                    onRemoveDetail: () => widget.onRemoveDetail?.call(index),
                    purchaseOrderDetail: purchaseOrderDetails,
                    isExternal: widget.isExternal,
                  )
                : Container();
          },
        ),
      ],
    );
  }
}
