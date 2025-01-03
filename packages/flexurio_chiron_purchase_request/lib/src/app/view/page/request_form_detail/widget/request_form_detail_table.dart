import 'package:flexurio_chiron_purchase_request/src/app/bloc/request_form_detail_temporary/request_form_detail_temporary_bloc.dart';
import 'package:flexurio_chiron_material/src/app/model/material_group.dart';
import 'package:flexurio_chiron_purchase_request/src/app/model/request_form_detail.dart';
import 'package:flexurio_chiron_vendor/flexurio_chiron_vendor.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RequestFormDetailTable extends StatelessWidget {
  const RequestFormDetailTable({
    required this.action,
    required this.header,
    required this.vendor,
    super.key,
    this.materialGroup,
    this.showStatus = false,
  });

  final MaterialGroup? materialGroup;
  final Widget header;
  final Vendor? vendor;
  final List<Widget> Function(RequestFormDetail) action;
  final bool? showStatus;

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
                  action: action,
                  vendor: vendor,
                  showStatus: showStatus ?? false,
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
    required this.action,
    required this.showStatus,
    this.vendor,
  });

  final List<Widget> Function(RequestFormDetail) action;
  final Vendor? vendor;
  final bool showStatus;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RequestFormDetailTemporaryBloc, List<RequestFormDetail>>(
      builder: (context, state) {
        return YuhuTable<RequestFormDetail>(
          data: state..sort((a, b) => a.itemName.compareTo(b.itemName)),
          columns: [
            TableColumn(
              width: 50,
              title: 'Action',
              builder: (materialRequestDetail, index) {
                return Row(
                  children: action(materialRequestDetail),
                );
              },
            ),
            TableColumn(
              width: 50,
              title: 'Item Name',
              builder: (materialRequestDetail, index) {
                return buildMaterialText(materialRequestDetail);
              },
            ),
            TableColumn(
              width: 50,
              alignment: Alignment.centerRight,
              title: 'Quantity',
              builder: (materialRequestDetail, index) {
                return Text('${materialRequestDetail.quantity}');
              },
            ),
            TableColumn(
              width: 50,
              alignment: Alignment.centerRight,
              title: 'Unit',
              builder: (materialRequestDetail, index) {
                return Text(
                  '${materialRequestDetail.materialType != null ? 'PCS' : materialRequestDetail.unit != null ? materialRequestDetail.unit?.id : '-'}',
                );
              },
            ),
            if (showStatus)
              TableColumn(
                width: 50,
                alignment: Alignment.centerRight,
                title: 'Status',
                builder: (materialRequestDetail, index) {
                  return ChipType(materialRequestDetail.status);
                },
              ),
          ],
        );
      },
    );
  }
}

Widget buildMaterialText(RequestFormDetail materialRequestDetail) {
  var materialText = '-';
  if (materialRequestDetail.materialType != null) {
    if (materialRequestDetail.materialType!.id != '') {
      materialText = materialRequestDetail.materialType!.id;
    }
  }
  if (materialRequestDetail.material != null) {
    if (materialRequestDetail.material!.name != '') {
      materialText = materialRequestDetail.material!.name;
    }
  }
  return Text(materialText);
}
