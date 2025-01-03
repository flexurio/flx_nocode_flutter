import 'package:flexurio_chiron_material_stock/src/app/bloc/material_receive_detail_query/material_receive_detail_query_bloc.dart';
import 'package:flexurio_chiron_material_stock/src/app/bloc/material_receive_query/material_receive_query_bloc.dart';
import 'package:flexurio_chiron_material_stock/src/app/model/entity.dart';
import 'package:flexurio_chiron_material_stock/src/app/model/material_receive.dart';
import 'package:flexurio_chiron_material_stock/src/app/model/material_receive_detail.dart';
import 'package:flexurio_chiron_material_stock/src/app/view/page/material_receive_create/widget/edit_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_material_stock/src/app/view/page/material_receive_view/widget/detail_table.dart';
import 'package:flexurio_chiron_purchase_order/flexurio_chiron_purchase_order.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class MaterialReceiveDetailPage extends StatefulWidget {
  const MaterialReceiveDetailPage._({
    required this.materialReceive,
    required this.action,
    required this.detail,
    required this.isExternal,
  });

  final bool isExternal;
  final MaterialReceive materialReceive;
  final DataAction action;
  final MaterialReceiveDetail detail;

  static Widget prepare({
    required MaterialReceive materialReceive,
    required DataAction action,
    required MaterialReceiveDetail detail,
    required bool isExternal,
  }) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PurchaseOrderDetailQueryBloc()
            ..add(
              PurchaseOrderDetailQueryEvent.fetchAll(
                purchaseOrder: materialReceive.purchaseOrder,
                material: detail.material,
              ),
            ),
        ),
        BlocProvider(
          create: (context) => MaterialReceiveDetailQueryBloc(
            isExternal: isExternal,
          )..add(
              MaterialReceiveDetailQueryEvent.fetch(
                period: DateTime.now(),
                pageOptions: PageOptions.empty(
                  sortBy: 'vat_no',
                  ascending: true,
                ),
                materialReceive: materialReceive,
              ),
            ),
        ),
        BlocProvider(
          create: (context) => MaterialReceiveQueryBloc(isExternal: isExternal)
            ..add(MaterialReceiveQueryEvent.fetchById(materialReceive.id)),
        ),
      ],
      child: MaterialReceiveDetailPage._(
        materialReceive: materialReceive,
        action: action,
        detail: detail,
        isExternal: isExternal,
      ),
    );
  }

  @override
  State<MaterialReceiveDetailPage> createState() =>
      _MaterialReceiveDetailPageState();
}

class _MaterialReceiveDetailPageState extends State<MaterialReceiveDetailPage> {
  var _showEditButton = false;

  @override
  Widget build(BuildContext context) {
    var purchaseOrderDetail = PurchaseOrderDetail.empty();
    const action = DataAction.viewDetail;
    final entity = EntityMaterialStock.materialReceive;
    final queryId = context.read<MaterialReceiveQueryBloc>();
    return BlocBuilder<MaterialReceiveQueryBloc, MaterialReceiveQueryState>(
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () => Scaffold(
            backgroundColor: Colors.transparent,
            body: SingleFormPanel(
              action: action,
              entity: entity,
              size: SingleFormPanelSize.large,
              children: const [],
            ),
          ),
          loaded: (materialReceive) {
            return Scaffold(
              backgroundColor: Colors.transparent,
              body: SingleFormPanel(
                action: action,
                entity: entity,
                size: SingleFormPanelSize.large,
                children: [
                  _buildEditButton(queryId),
                  RowFields(
                    children: [
                      TileDataVertical(
                        label: 'type'.tr(),
                        child: ChipType(widget.materialReceive.type),
                      ),
                      TileDataVertical(
                        label: 'transaction_type'.tr(),
                        child: Text(
                          materialReceive.first.transactionType.name.isEmpty
                              ? ''
                              : materialReceive.first.transactionType.name,
                        ),
                      ),
                    ],
                  ),
                  RowFields(
                    children: [
                      TileDataVertical(
                        label: 'purchase_order'.tr(),
                        child: Text(materialReceive.first.purchaseOrder.id),
                      ),
                      TileDataVertical(
                        label: 'delivery_order_date'.tr(),
                        child: Text(
                          materialReceive.first.deliveryOrderDate.yMMMd,
                        ),
                      ),
                    ],
                  ),
                  RowFields(
                    children: [
                      TileDataVertical(
                        label: 'warehouse'.tr(),
                        child: Text(materialReceive.first.warehouse.label),
                      ),
                      TileDataVertical(
                        label: 'manufacturer'.tr(),
                        child: Text(
                          materialReceive.first.vendor.name.isEmpty
                              ? ''
                              : materialReceive.first.vendor.name,
                        ),
                      ),
                    ],
                  ),
                  RowFields(
                    children: [
                      TileDataVertical(
                        label: 'delivery_order'.tr(),
                        child: Text(materialReceive.first.deliveryOrderId),
                      ),
                      TileDataVertical(
                        label: 'description'.tr(),
                        child: Text(materialReceive.first.description),
                      ),
                    ],
                  ),
                  const Gap(12),
                  BlocBuilder<PurchaseOrderDetailQueryBloc,
                      PurchaseOrderDetailQueryState>(
                    builder: (context, state) {
                      final data = state.maybeWhen(
                        orElse: () => <PurchaseOrderDetail>[],
                        loaded: (data) => data
                            .where(
                              (element) => widget
                                  .materialReceive.purchaseOrder.id
                                  .contains(element.purchaseOrder.id),
                            )
                            .toList(),
                      );
                      return BlocBuilder<MaterialReceiveDetailQueryBloc,
                          MaterialReceiveDetailQueryState>(
                        builder: (context, state) {
                          final formatter = NumberFormat.decimalPatternDigits(
                            locale: 'en_us',
                            decimalDigits: 0,
                          );
                          final details = state.maybeWhen(
                            orElse: () => <MaterialReceiveDetail>[],
                            loaded: (pageOptions) => pageOptions.data,
                          );
                          for (var i = 0; i < details.length; i++) {
                            purchaseOrderDetail = data.isEmpty
                                ? PurchaseOrderDetail.empty()
                                : data.first;
                          }
                          return MaterialReceiveDetailTable(
                            materialReceive: widget.materialReceive,
                            isExternal: widget.isExternal,
                            purchaseOrderDetail: purchaseOrderDetail,
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildEditButton(MaterialReceiveQueryBloc queryId) {
    return BlocListener<MaterialReceiveDetailQueryBloc,
        MaterialReceiveDetailQueryState>(
      listener: (context, state) {
        final isAnyRelease = state.maybeWhen(
          loaded: (pageOptions) => pageOptions.data
              .map(
                (e) => e.materialStatus == MaterialReceiveDetailStatus.release,
              )
              .contains(true),
          orElse: () => true,
        );
        setState(() {
          _showEditButton = !isAnyRelease;
        });
      },
      child: _showEditButton
          ? Column(
              children: [
                const Padding(padding: EdgeInsets.only(bottom: 24)),
                Align(
                  alignment: Alignment.centerRight,
                  child: MaterialReceiveEditButton(
                    isExternal: widget.isExternal,
                    queryBloc: queryId,
                    materialReceive: widget.materialReceive,
                  ),
                ),
              ],
            )
          : const SizedBox(),
    );
  }
}
