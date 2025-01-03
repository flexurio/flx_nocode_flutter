import 'package:flexurio_chiron_purchase_request/src/app/bloc/material_request_detail_temporary/material_request_detail_temporary_bloc.dart';
import 'package:flexurio_chiron_purchase_request/src/app/model/material_request_detail.dart';
import 'package:flexurio_chiron_material/src/app/model/material_group.dart';
import 'package:flexurio_chiron_vendor/src/app/model/vendors.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MaterialRequestDetailTable extends StatefulWidget {
  const MaterialRequestDetailTable({
    required this.action,
    required this.header,
    required this.vendor,
    super.key,
    this.materialGroup,
  });

  final MaterialGroup? materialGroup;
  final Widget header;
  final Vendor? vendor;
  final List<Widget> Function(PurchaseRequestDetail) action;

  @override
  State<MaterialRequestDetailTable> createState() =>
      _MaterialRequestDetailTableState();
}

class _MaterialRequestDetailTableState
    extends State<MaterialRequestDetailTable> {
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
                widget.header,
                const SizedBox(height: 30),
                BlocBuilder<MaterialRequestDetailTemporaryBloc,
                    List<PurchaseRequestDetail>>(
                  builder: (context, state) {
                    return YuhuTable<PurchaseRequestDetail>(
                      width: 1700,
                      data: state
                        ..sort((a, b) => a.itemName.compareTo(b.itemName)),
                      columns: [
                        TableColumn(
                          width: 80,
                          title: 'Action',
                          builder: (materialRequestDetail, index) {
                            return Row(
                              children: widget.action(materialRequestDetail),
                            );
                          },
                        ),
                        TableColumn(
                          width: 200,
                          title: 'Item Name',
                          builder: (materialRequestDetail, index) {
                            return Text(materialRequestDetail.itemName);
                          },
                        ),
                        TableColumn(
                          width: 120,
                          alignment: Alignment.centerRight,
                          title: 'Quantity',
                          builder: (materialRequestDetail, index) {
                            return Text('${materialRequestDetail.quantity}');
                          },
                        ),
                        TableColumn(
                          width: 120,
                          title: 'Unit',
                          builder: (materialRequestDetail, index) {
                            return Text(materialRequestDetail.unit.id);
                          },
                        ),
                        TableColumn(
                          title: 'Batch',
                          width: 120,
                          builder: (materialRequestDetail, index) {
                            return Text(
                              materialRequestDetail.batchNo ?? '-',
                            );
                          },
                        ),
                        TableColumn(
                          title: 'Design',
                          width: 120,
                          builder: (materialRequestDetail, index) {
                            return Text(
                              materialRequestDetail
                                      .materialDesign?.designCode ??
                                  '-',
                            );
                          },
                        ),
                        TableColumn(
                          title: 'Manufacturer',
                          width: 200,
                          builder: (materialRequestDetail, index) {
                            return Text(widget.vendor?.name ?? '-');
                          },
                        ),
                        TableColumn(
                          width: 180,
                          title: 'Due Date',
                          builder: (materialRequestDetail, index) {
                            return Text(materialRequestDetail.dueDate.yMMMMd);
                          },
                        ),
                        TableColumn(
                          width: 100,
                          title: 'Order',
                          builder: (materialRequestDetail, index) {
                            return BoolIcon(materialRequestDetail.isOrder);
                          },
                        ),
                        TableColumn(
                          width: 100,
                          title: 'Fast Track',
                          builder: (materialRequestDetail, index) {
                            return BoolIcon(materialRequestDetail.isFastTrack);
                          },
                        ),
                        TableColumn(
                          width: 200,
                          title: 'Status',
                          builder: (materialRequestDetail, index) {
                            return ChipType(materialRequestDetail.status);
                          },
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
