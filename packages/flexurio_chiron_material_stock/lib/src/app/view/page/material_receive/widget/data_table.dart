import 'package:flexurio_chiron_material/flexurio_chiron_material.dart';
import 'package:flexurio_chiron_material_stock/flexurio_chiron_material_stock.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/material_group.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:appointment/src/app/resource/user_repository.dart';

class MaterialReceiveDataTable extends StatefulWidget {
  const MaterialReceiveDataTable._({required this.isExternal});

  final bool isExternal;

  static Widget prepare({
    required bool isExternal,
  }) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MaterialReceiveQueryBloc(
            isExternal: isExternal,
          )..add(const MaterialReceiveQueryEvent.fetch()),
        ),
        BlocProvider(
          create: (context) =>
              MaterialReceiveDetailQueryBloc(isExternal: isExternal),
        ),
        BlocProvider(
          create: (context) => MaterialReceiveByNaQueryBloc(),
        ),
        BlocProvider(
          create: (context) =>
              MaterialReceiveDetailBloc(isExternal: isExternal),
        ),
        BlocProvider(
          create: (context) => MaterialGroupQueryBloc()
            ..add(MaterialGroupQueryEvent.fetch(
              pageOptions: PageOptions.emptyNoLimit(),
            )),
        ),
      ],
      child: MaterialReceiveDataTable._(
        isExternal: isExternal,
      ),
    );
  }

  @override
  State<MaterialReceiveDataTable> createState() =>
      _MaterialReceiveDataTableState();
}

class _MaterialReceiveDataTableState extends State<MaterialReceiveDataTable> {
  MaterialGroup? _materialGroup;
  String? _materialStatus;

  @override
  void initState() {
    if (UserRepositoryApp.instance.department?.id == "QC" ||
        UserRepositoryApp.instance.department?.id == "IC") {
      _materialGroup = MaterialGroup.empty().copyWith(id: "KEMASAN");
      _materialStatus = "KARANTINA";
    }
    if (UserRepositoryApp.instance.department?.id == "EN") {
      _materialGroup = MaterialGroup.empty().copyWith(id: "ENGINEERING");
      _materialStatus = "KARANTINA";
    }
    if (UserRepositoryApp.instance.department?.id == "CS") {
      _materialGroup = MaterialGroup.empty().copyWith(id: "ATK");
      _materialStatus = "KARANTINA";
    }
    if (_materialGroup == null || _materialStatus == null) {
      _materialGroup = MaterialGroup.empty().copyWith(id: "UMUM");
      _materialStatus = "RELEASE";
    }
    if (widget.isExternal) {
      context.read<MaterialReceiveDetailQueryBloc>()
        ..add(
          MaterialReceiveDetailQueryEvent.fetch(
            materialGroupId: _materialGroup?.id,
            materialStatusQc: _materialStatus,
          ),
        );
    }
    context.read<MaterialReceiveByNaQueryBloc>()
      ..add(
        MaterialReceiveByNaQueryEvent.fetch(
          materialGroupId: _materialGroup?.id,
          materialStatusQc: _materialStatus,
        ),
      );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.isExternal) {
      return BlocBuilder<MaterialReceiveByNaQueryBloc,
          MaterialReceiveByNaQueryState>(
        builder: (context, state) {
          return SizedBox(
            width: MediaQuery.of(context).size.width,
            child: DataTableBackend<MaterialReceiveByNa>(
              freezeFirstColumn: true,
              freezeLastColumn: true,
              status: state.maybeWhen(
                orElse: () => Status.error,
                loading: (_) => Status.progress,
                loaded: (_) => Status.loaded,
              ),
              pageOptions: state.maybeWhen(
                loaded: (data) => data,
                loading: (data) => data,
                orElse: PageOptions.empty,
              ),
              key: ValueKey(state.hashCode),
              onChanged: (pageOptions) {
                context.read<MaterialReceiveByNaQueryBloc>().add(
                      MaterialReceiveByNaQueryEvent.fetch(
                        pageOptions: pageOptions,
                        materialGroupId: _materialGroup?.id,
                        materialStatusQc: _materialStatus,
                      ),
                    );
              },
              actionRight: (refreshButton) => [
                LightButtonSmallGroup(
                  action: DataAction.export,
                  children: {
                    PermissionMaterialStock.materialReceiveReportExportPdf(
                      isExternal: widget.isExternal,
                    ): MaterialReceiveExportExcelButton.prepare(
                        isExternal: widget.isExternal),
                    PermissionMaterialStock.materialReceiveReportExportPdf(
                      isExternal: widget.isExternal,
                    ): MaterialReceiveReportExportPdfButton(
                        isExternal: widget.isExternal),
                  },
                ),
                refreshButton,
                MaterialReceiveCreateButton(isExternal: widget.isExternal),
              ],
              actionLeft: [
                FDropDownSearchMaterialGroup(
                  small: true,
                  initialValue: _materialGroup ?? MaterialGroup.empty(),
                  onChanged: (materialGroup) {
                    if (materialGroup != null) {
                      _materialGroup = materialGroup;
                      context.read<MaterialReceiveByNaQueryBloc>().add(
                            MaterialReceiveByNaQueryEvent.fetch(
                              materialGroupId: materialGroup.id,
                              materialStatusQc: _materialStatus,
                            ),
                          );
                    }
                  },
                ),
                DropDownSmall<String>(
                  initialValue: _materialStatus,
                  labelText: 'Material Status',
                  itemAsString: (materialStatus) => materialStatus,
                  items: const ['KARANTINA', 'RELEASE', 'REJECT'],
                  onChanged: (materialStatus) {
                    if (materialStatus != null) {
                      _materialStatus = materialStatus;
                      context.read<MaterialReceiveByNaQueryBloc>().add(
                            MaterialReceiveByNaQueryEvent.fetch(
                              materialGroupId: _materialGroup?.id,
                              materialStatusQc: materialStatus,
                            ),
                          );
                    }
                  },
                ),
              ],
              onRefresh: () => context
                  .read<MaterialReceiveByNaQueryBloc>()
                  .add(MaterialReceiveByNaQueryEvent.fetch(
                    materialGroupId: _materialGroup?.id,
                    materialStatusQc: _materialStatus,
                  )),
              columns: [
                DTColumn(
                  widthFlex: 8,
                  head: const DTHead(
                    label: 'ID',
                    backendColumn: 'id',
                  ),
                  body: (materialReceive) => DataCell(
                    Text(materialReceive.id).canCopy(),
                  ),
                ),
                DTColumn(
                  widthFlex: 7,
                  head: DTHead(
                    label: 'purchase_order'.tr(),
                    backendColumn: 'purchase_order_id',
                  ),
                  body: (materialReceive) => DataCell(
                    Text(materialReceive.purchaseOrderId).canCopy(),
                  ),
                ),
                DTColumn(
                  widthFlex: 10,
                  head: DTHead(
                    label: 'material'.tr(),
                    backendColumn: 'material_id',
                  ),
                  body: (materialReceive) => DataCell(
                    Text(materialReceive.materialName),
                  ),
                ),
                DTColumn(
                  widthFlex: 7,
                  head: DTHead(
                    label: 'material_group'.tr(),
                    backendColumn: 'material_group_id',
                  ),
                  body: (materialReceive) => DataCell(
                    Text(materialReceive.materialGroupId),
                  ),
                ),
                DTColumn(
                  widthFlex: 7,
                  head: DTHead(
                    label: 'design_code'.tr(),
                    backendColumn: 'material_design_id',
                  ),
                  body: (materialReceive) => DataCell(
                    Text(materialReceive.designCodeId.toString()),
                  ),
                ),
                DTColumn(
                  widthFlex: 3,
                  head: DTHead(
                    numeric: true,
                    label: 'vat_total'.tr(),
                    backendColumn: 'vat_no',
                  ),
                  body: (materialReceive) => DataCell(
                    Text(materialReceive.vatTotal.toString()),
                  ),
                ),
                DTColumn(
                  widthFlex: 4,
                  head: DTHead(
                    numeric: true,
                    label: 'quantity'.tr(),
                    backendColumn: 'quantity',
                  ),
                  body: (materialReceive) => DataCell(
                    Text(materialReceive.totalQty.toString()),
                  ),
                ),
                DTColumn(
                  widthFlex: 4,
                  head: const DTHead(
                    label: 'Unit',
                    backendColumn: 'unit_id',
                  ),
                  body: (materialReceive) => DataCell(
                    Text(materialReceive.materialUnitId),
                  ),
                ),
                DTColumn(
                  widthFlex: 7,
                  head: const DTHead(
                    label: 'Status',
                    backendColumn: 'status',
                  ),
                  body: (materialReceive) => DataCell(
                    ChipType(materialReceive.materialStatus),
                  ),
                ),
                DTColumn(
                  widthFlex: 5,
                  head: const DTHead(
                    label: 'NA',
                    backendColumn: 'na',
                  ),
                  body: (materialReceive) => DataCell(
                    Text(materialReceive.na),
                  ),
                ),
                DTColumn(
                  widthFlex: 4,
                  head: DTHead(
                    label: 'batch'.tr(),
                    backendColumn: 'batch_no',
                  ),
                  body: (materialReceive) => DataCell(
                    Text(materialReceive.batchNo),
                  ),
                ),
                DTColumn(
                  widthFlex: 7,
                  head: DTHead(
                    label: 'created_at'.tr(),
                    backendColumn: 'created_at',
                  ),
                  body: (materialReceive) => DataCell(
                    Text(materialReceive.createdAt.yMMMdHm),
                  ),
                ),
                DTColumn(
                  widthFlex: 15,
                  head: DTHead(
                    label: 'actions'.tr(),
                    backendColumn: null,
                  ),
                  body: (materialReceive) => DataCell(
                    Row(
                      children: [
                        ExportMaterialReturnReceiptPdfButton.prepare(
                          materialReceiveDetail: MaterialReceiveDetail.empty()
                              .copyWith(
                                  materialStatus:
                                      materialReceive.materialStatus,
                                  materialReceive: MaterialReceive.empty()
                                      .copyWith(id: materialReceive.id)),
                          isExternal: widget.isExternal,
                        ),
                        ExportPdfButton.prepare(
                          materialReceiveDetail:
                              MaterialReceiveDetail.empty().copyWith(
                            materialReceive: MaterialReceive.empty().copyWith(
                              id: materialReceive.id,
                              materialGroup: MaterialGroup.empty().copyWith(
                                  id: materialReceive.materialGroupId),
                            ),
                          ),
                          isExternal: widget.isExternal,
                        ),
                        ExportKarantinaPdfButton.prepare(
                          materialReceiveDetail: MaterialReceiveDetail.empty()
                              .copyWith(
                                  materialStatus:
                                      materialReceive.materialStatus,
                                  materialReceive: MaterialReceive.empty()
                                      .copyWith(id: materialReceive.id)),
                          isExternal: widget.isExternal,
                        ),
                        MaterialReceiveDetailButton(
                          action: DataAction.viewDetail,
                          materialReceive: MaterialReceive.empty()
                              .copyWith(id: materialReceive.id),
                          detail: MaterialReceiveDetail.empty().copyWith(
                              materialReceive: MaterialReceive.empty()
                                  .copyWith(id: materialReceive.id)),
                          isExternal: widget.isExternal,
                        ),
                        if (materialReceive.materialStatus.isQuarantine)
                          MaterialReceiveDetailDeleteButton.prepare(
                            isByNa: true,
                            isExternal: widget.isExternal,
                            materialReceiveDetail: MaterialReceiveDetail.empty()
                                .copyWith(
                                    materialReceive: MaterialReceive.empty()
                                        .copyWith(id: materialReceive.id)),
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      );
    }
    return BlocBuilder<MaterialReceiveDetailQueryBloc,
        MaterialReceiveDetailQueryState>(
      builder: (context, state) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: DataTableBackend<MaterialReceiveDetail>(
            freezeFirstColumn: true,
            freezeLastColumn: true,
            status: state.maybeWhen(
              orElse: () => Status.error,
              loading: (_) => Status.progress,
              loaded: (_) => Status.loaded,
            ),
            pageOptions: state.maybeWhen(
              loaded: (data) => data,
              loading: (data) => data,
              orElse: PageOptions.empty,
            ),
            key: ValueKey(state.hashCode),
            onChanged: (pageOptions) {
              context.read<MaterialReceiveDetailQueryBloc>().add(
                    MaterialReceiveDetailQueryEvent.fetch(
                      pageOptions: pageOptions,
                      materialGroupId: _materialGroup?.id,
                      materialStatusQc: _materialStatus,
                    ),
                  );
            },
            actionRight: (refreshButton) => [
              LightButtonSmallGroup(
                action: DataAction.export,
                children: {
                  PermissionMaterialStock.materialReceiveReportExportPdf(
                    isExternal: widget.isExternal,
                  ): MaterialReceiveExportExcelButton.prepare(
                      isExternal: widget.isExternal),
                  PermissionMaterialStock.materialReceiveReportExportPdf(
                    isExternal: widget.isExternal,
                  ): MaterialReceiveReportExportPdfButton(
                      isExternal: widget.isExternal),
                },
              ),
              refreshButton,
              MaterialReceiveCreateButton(isExternal: widget.isExternal),
            ],
            actionLeft: [
              FDropDownSearchMaterialGroup(
                small: true,
                initialValue: _materialGroup!,
                onChanged: (materialGroup) {
                  if (materialGroup != null) {
                    _materialGroup = materialGroup;
                    context.read<MaterialReceiveDetailQueryBloc>().add(
                          MaterialReceiveDetailQueryEvent.fetch(
                            materialGroupId: materialGroup.id,
                            materialStatusQc: _materialStatus,
                          ),
                        );
                  }
                },
              ),
              DropDownSmall<String>(
                initialValue: _materialStatus,
                labelText: 'Material Status',
                itemAsString: (materialStatus) => materialStatus,
                items: const ['KARANTINA', 'RELEASE', 'REJECT'],
                onChanged: (materialStatus) {
                  if (materialStatus != null) {
                    _materialStatus = materialStatus;
                    context.read<MaterialReceiveDetailQueryBloc>().add(
                          MaterialReceiveDetailQueryEvent.fetch(
                            materialGroupId: _materialGroup?.id,
                            materialStatusQc: materialStatus,
                          ),
                        );
                  }
                },
              ),
            ],
            onRefresh: () => context
                .read<MaterialReceiveDetailQueryBloc>()
                .add(MaterialReceiveDetailQueryEvent.fetch(
                  materialGroupId: _materialGroup?.id,
                  materialStatusQc: _materialStatus,
                )),
            columns: [
              DTColumn(
                widthFlex: 8,
                head: const DTHead(
                  label: 'ID',
                  backendColumn: 'id',
                ),
                body: (materialReceiveDetail) => DataCell(
                  Text(materialReceiveDetail.materialReceive.id).canCopy(),
                ),
              ),
              DTColumn(
                widthFlex: 7,
                head: const DTHead(
                  label: 'Purchase Order',
                  backendColumn: 'purchase_order_id',
                ),
                body: (materialReceiveDetail) => DataCell(
                  Text(materialReceiveDetail.materialReceive.purchaseOrder.id)
                      .canCopy(),
                ),
              ),
              DTColumn(
                widthFlex: 10,
                head: const DTHead(
                  label: 'Material',
                  backendColumn: 'material_id',
                ),
                body: (materialReceiveDetail) => DataCell(
                  Text(materialReceiveDetail.material.name),
                ),
              ),
              DTColumn(
                widthFlex: 7,
                head: const DTHead(
                  label: 'Material Group',
                  backendColumn: 'material_group_id',
                ),
                body: (materialReceiveDetail) => DataCell(
                  Text(materialReceiveDetail.materialReceive.materialGroup.id),
                ),
              ),
              DTColumn(
                widthFlex: 7,
                head: const DTHead(
                  label: 'Design Code',
                  backendColumn: 'material_design_id',
                ),
                body: (materialReceiveDetail) => DataCell(
                  Text(
                    materialReceiveDetail.materialDesign?.designCode ?? '-',
                  ),
                ),
              ),
              DTColumn(
                widthFlex: 3,
                head: const DTHead(
                  numeric: true,
                  label: 'VAT',
                  backendColumn: 'vat_no',
                ),
                body: (materialReceiveDetail) => DataCell(
                  Text(materialReceiveDetail.vatNo.toString()),
                ),
              ),
              DTColumn(
                widthFlex: 4,
                head: const DTHead(
                  numeric: true,
                  label: 'Quantity',
                  backendColumn: 'quantity',
                ),
                body: (materialReceiveDetail) => DataCell(
                  Text(materialReceiveDetail.totalQuantity.toString()),
                ),
              ),
              DTColumn(
                widthFlex: 4,
                head: const DTHead(
                  label: 'Unit',
                  backendColumn: 'unit_id',
                ),
                body: (materialReceiveDetail) => DataCell(
                  Text(materialReceiveDetail.materialUnit.id),
                ),
              ),
              DTColumn(
                widthFlex: 7,
                head: const DTHead(
                  label: 'Status',
                  backendColumn: 'status',
                ),
                body: (materialReceiveDetail) => DataCell(
                  ChipType(materialReceiveDetail.materialStatus),
                ),
              ),
              DTColumn(
                widthFlex: 5,
                head: const DTHead(
                  label: 'NA',
                  backendColumn: 'na',
                ),
                body: (materialReceiveDetail) => DataCell(
                  Text(materialReceiveDetail.na),
                ),
              ),
              DTColumn(
                widthFlex: 4,
                head: const DTHead(
                  label: 'Batch',
                  backendColumn: 'batch_no',
                ),
                body: (materialReceiveDetail) => DataCell(
                  Text(materialReceiveDetail.batchNo),
                ),
              ),
              DTColumn(
                widthFlex: 4,
                head: const DTHead(
                  label: 'Invoice Receive',
                  backendColumn: null,
                ),
                body: (materialReceiveDetail) => DataCell(
                  SizedBox(
                    child: BoolIcon(
                      materialReceiveDetail.materialReceive.isInvoiceReceive,
                    ),
                  ),
                ),
              ),
              DTColumn(
                widthFlex: 6,
                head: const DTHead(
                  label: 'Transaction Date',
                  backendColumn: 'transaction_date',
                ),
                body: (materialReceiveDetail) => DataCell(
                  Text(materialReceiveDetail.transactionDate.yMMMdHm),
                ),
              ),
              DTColumn(
                widthFlex: 7,
                head: DTHead(
                  label: 'created_at'.tr(),
                  backendColumn: 'created_at',
                ),
                body: (materialReceive) => DataCell(
                  Text(materialReceive.createdAt.yMMMdHm),
                ),
              ),
              DTColumn(
                widthFlex: 7,
                head: const DTHead(
                  label: 'Updated At',
                  backendColumn: 'updated_at',
                ),
                body: (materialReceiveDetail) => DataCell(
                  Text(materialReceiveDetail.updatedAt.yMMMdHm),
                ),
              ),
              DTColumn(
                widthFlex: 15,
                head: const DTHead(
                  label: 'Actions',
                  backendColumn: null,
                ),
                body: (materialReceiveDetail) => DataCell(
                  Row(
                    children: [
                      ExportMaterialReturnReceiptPdfButton.prepare(
                        materialReceiveDetail: materialReceiveDetail,
                        isExternal: widget.isExternal,
                      ),
                      ExportPdfButton.prepare(
                        materialReceiveDetail: materialReceiveDetail,
                        isExternal: widget.isExternal,
                      ),
                      ExportKarantinaPdfButton.prepare(
                        materialReceiveDetail: materialReceiveDetail,
                        isExternal: widget.isExternal,
                      ),
                      MaterialReceiveDetailButton(
                        action: DataAction.viewDetail,
                        materialReceive: materialReceiveDetail.materialReceive,
                        detail: materialReceiveDetail,
                        isExternal: widget.isExternal,
                      ),
                      if (materialReceiveDetail.materialStatus.isQuarantine)
                        MaterialReceiveDetailDeleteButton.prepare(
                          isByNa: false,
                          isExternal: widget.isExternal,
                          materialReceiveDetail: materialReceiveDetail,
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
