import 'package:appointment/src/app/view/widget/drop_down_items/material_group.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_material/src/app/bloc/material_query/material_query_bloc.dart';
import 'package:flexurio_chiron_material/src/app/model/material.dart' as model;
import 'package:flexurio_chiron_material/src/app/model/material_group.dart';
import 'package:flexurio_chiron_material/src/app/model/permission.dart';
import 'package:flexurio_chiron_material/src/app/view/page/material/widget/export_excel_button.dart';
import 'package:flexurio_chiron_material/src/app/view/page/material/widget/material_activate_deactivate_is_order_button.dart';
import 'package:flexurio_chiron_material/src/app/view/page/material/widget/material_activate_deactivate_is_stock_button.dart';
import 'package:flexurio_chiron_material/src/app/view/page/material/widget/material_activate_deactivate_switch_button.dart';
import 'package:flexurio_chiron_material/src/app/view/page/material/widget/material_approve_vendor_button.dart';
import 'package:flexurio_chiron_material/src/app/view/page/material/widget/material_approve_vendor_export_pdf_button.dart';
import 'package:flexurio_chiron_material/src/app/view/page/material/widget/material_create_button.dart';
import 'package:flexurio_chiron_material/src/app/view/page/material/widget/material_delete_button.dart';
import 'package:flexurio_chiron_material/src/app/view/page/material/widget/material_duplicate_external_button.dart';
import 'package:flexurio_chiron_material/src/app/view/page/material/widget/material_halal_certificate_export_excel_button.dart';
import 'package:flexurio_chiron_material/src/app/view/page/material/widget/export_excel_price_supplier_button.dart';
import 'package:flexurio_chiron_material/src/app/view/page/material/widget/material_lead_time_button.dart';
import 'package:flexurio_chiron_material/src/app/view/page/material/widget/material_leadtime_export_excel_button.dart'
    as btn;
import 'package:flexurio_chiron_material/src/app/view/page/material/widget/material_update_button.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MaterialDataTable extends StatefulWidget {
  const MaterialDataTable({
    super.key,
    required this.isExternal,
  });

  final bool isExternal;

  @override
  State<MaterialDataTable> createState() => _MaterialDataTableState();
}

class _MaterialDataTableState extends State<MaterialDataTable> {
  MaterialGroup? _materialGroup;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MaterialQueryBloc, MaterialQueryState>(
      builder: (context, state) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: DataTableBackend<model.Material>(
            freezeFirstColumn: true,
            freezeLastColumn: true,
            onRefresh: () => context.read<MaterialQueryBloc>().add(
                  MaterialQueryEvent.fetch(
                    materialGroup: _materialGroup,
                  ),
                ),
            key: ValueKey(state.hashCode),
            status: state.maybeWhen(
              loading: (_) => Status.progress,
              orElse: () => Status.error,
              loaded: (materials) => Status.loaded,
            ),
            pageOptions: state.maybeWhen(
              loaded: (data) => data,
              loading: (data) => data,
              orElse: PageOptions.empty,
            ),
            onChanged: (pageOptions) {
              context.read<MaterialQueryBloc>().add(
                    MaterialQueryEvent.fetch(
                      pageOptions: pageOptions,
                      materialGroup: _materialGroup,
                    ),
                  );
            },
            actionLeft: [
              FDropDownSearchMaterialGroup(
                small: true,
                initialValue: _materialGroup,
                onChanged: (materialGroup) {
                  if (materialGroup != null) {
                    _materialGroup = materialGroup;
                    context.read<MaterialQueryBloc>().add(
                          MaterialQueryEvent.fetch(
                            materialGroup: _materialGroup,
                          ),
                        );
                  }
                },
              ),
            ],
            actionRight: (refreshButton) => [
              LightButtonSmallGroup(
                action: DataAction.exportExcel,
                children: {
                  if (!widget.isExternal)
                    PermissionMaterial.materialLeadtimeExportExcel:
                        btn.MaterialLeadTimeExportExcelButton.prepare(),
                  PermissionMaterial.materialReceiveDetailExportExcel:
                      MaterialReceiveDetailExportExcelButton.prepare(
                          isExternal: widget.isExternal),
                  if (!widget.isExternal)
                    PermissionMaterial.materialHalalCertificateExportExcel:
                        MaterialHalalCertificateExportExcelButton.prepare(),
                  PermissionMaterial.materialExportExcel(
                          isExternal: widget.isExternal):
                      MaterialApproveVendorExportExcelButton(
                    isExternal: widget.isExternal,
                  ),
                },
              ),
              MaterialApprovedVendorPrintPDFButton(
                isExternal: widget.isExternal,
              ),
              refreshButton,
              MaterialCreateButton(isExternal: widget.isExternal),
            ],
            columns: [
              DTColumn(
                widthFlex: 10,
                head: DTHead(
                  backendColumn: 'name',
                  label: 'name'.tr(),
                ),
                body: (material) => DataCell(Text(material.name)),
              ),
              DTColumn(
                widthFlex: 10,
                head: const DTHead(backendColumn: 'id', label: 'ID'),
                body: (material) => DataCell(Text(material.id).canCopy()),
              ),
              DTColumn(
                widthFlex: 5,
                head: DTHead(
                  backendColumn: 'MaterialType.id',
                  label: 'type'.tr(),
                ),
                body: (material) => DataCell(Text(material.materialType.id)),
              ),
              DTColumn(
                widthFlex: 5,
                head: DTHead(
                  backendColumn: 'MaterialGroup.id',
                  label: 'group'.tr(),
                ),
                body: (material) => DataCell(Text(material.materialGroup.id)),
              ),
              DTColumn(
                widthFlex: 5,
                head: DTHead(
                  backendColumn: 'MaterialUnit.id',
                  label: 'unit_order'.tr(),
                ),
                body: (material) => DataCell(
                  Text(material.materialUnit.id),
                ),
              ),
              DTColumn(
                widthFlex: 5,
                head: DTHead(
                  backendColumn: 'StockUnit.id',
                  label: 'stock_unit'.tr(),
                ),
                body: (material) => DataCell(
                  Text(material.stockUnit.id),
                ),
              ),
              DTColumn(
                widthFlex: 5,
                head: DTHead(
                  backendColumn: 'pack_size',
                  numeric: true,
                  label: 'pack_size'.tr(),
                ),
                body: (material) => DataCell(
                  Text(material.packSize.toString()),
                ),
              ),
              DTColumn(
                widthFlex: 6,
                head: DTHead(
                  backendColumn: 'halal_certificate_id',
                  label: 'halal_certificate'.tr(),
                ),
                body: (material) => DataCell(
                  Text(material.halalCertificateId ?? ''),
                ),
              ),
              if (widget.isExternal)
                DTColumn(
                  widthFlex: 6,
                  head: DTHead(
                    backendColumn: 'company',
                    label: 'company'.tr(),
                  ),
                  body: (material) => DataCell(
                    Text(material.company),
                  ),
                ),
              DTColumn(
                widthFlex: 4,
                head: DTHead(
                  backendColumn: 'is_stock',
                  label: 'stock'.tr(),
                ),
                body: (material) => DataCell(
                  MaterialActivateDeactivateIsStockButton.prepare(
                    material: material,
                    isExternal: widget.isExternal,
                  ),
                ),
              ),
              DTColumn(
                widthFlex: 4,
                head: DTHead(
                  backendColumn: 'is_order',
                  label: 'order'.tr(),
                ),
                body: (material) => DataCell(
                  MaterialActivateDeactivateIsOrderButton.prepare(
                    material: material,
                    isExternal: widget.isExternal,
                  ),
                ),
              ),
              DTColumn(
                widthFlex: 4,
                head: DTHead(
                  backendColumn: 'is_active',
                  label: 'active'.tr(),
                ),
                body: (material) => DataCell(
                  MaterialActivateDeactivateSwitchButton.prepare(
                    material: material,
                  ),
                ),
              ),
              DTColumn(
                widthFlex: 6,
                head: DTHead(
                  backendColumn: 'created_at',
                  label: 'created_at'.tr(),
                  numeric: true,
                ),
                body: (material) => DataCell(
                  Text(material.createdAt.yMMMdHm),
                ),
              ),
              DTColumn(
                widthFlex: 6,
                head: DTHead(
                  backendColumn: 'updated_at'.tr(),
                  label: 'updated_at'.tr(),
                  numeric: true,
                ),
                body: (material) => DataCell(
                  Text(
                    material.updatedAt.yMMMdHm,
                  ),
                ),
              ),
              DTColumn(
                widthFlex: 13,
                head: DTHead(
                  backendColumn: '',
                  label: 'actions'.tr(),
                ),
                body: (material) => DataCell(
                  Row(
                    children: [
                      if (!widget.isExternal)
                        MaterialDuplicateExternalButton(material: material),
                      if (!widget.isExternal)
                        MaterialLeadTimeButton.prepare(material: material),
                      if (!widget.isExternal &&
                          material.materialGroup.hasVendor)
                        MaterialApproveVendorDetailButton(material: material),
                      MaterialUpdateButton(
                        material: material,
                        isExternal: widget.isExternal,
                      ),
                      MaterialDeleteButton.prepare(
                        material: material,
                        isExternal: widget.isExternal,
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
