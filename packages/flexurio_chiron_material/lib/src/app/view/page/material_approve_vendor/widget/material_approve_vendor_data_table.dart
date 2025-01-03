import 'package:flexurio_chiron_vendor/src/app/bloc/material_approve_vendor_query/material_approve_vendor_query_bloc.dart';
import 'package:flexurio_chiron_vendor/src/app/model/material_approved_vendor.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_material/src/app/model/material.dart' as model;
import 'package:flexurio_chiron_material/src/app/view/page/material_approve_vendor/widget/edit_halal_certificate_button.dart';
import 'package:flexurio_chiron_material/src/app/view/page/material_approve_vendor/widget/material_approve_vendor_create_button.dart';
import 'package:flexurio_chiron_material/src/app/view/page/material_approve_vendor/widget/material_approve_vendor_delete_button.dart';
import 'package:flexurio_chiron_material/src/app/view/page/material_approve_vendor/widget/material_approve_vendor_update_button.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MaterialApproveVendorDataTable extends StatelessWidget {
  const MaterialApproveVendorDataTable._(this.material);

  final model.Material material;

  static Widget prepare({
    required model.Material material,
  }) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MaterialApproveVendorQueryBloc()
            ..add(MaterialApproveVendorQueryEvent.fetch(material: material)),
        ),
      ],
      child: MaterialApproveVendorDataTable._(material),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MaterialApproveVendorQueryBloc,
        MaterialApproveVendorQueryState>(
      builder: (context, state) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: DataTableBackend<MaterialApprovedVendor>(
            freezeFirstColumn: true,
            freezeLastColumn: true,
            onRefresh: () => context
                .read<MaterialApproveVendorQueryBloc>()
                .add(MaterialApproveVendorQueryEvent.fetch(material: material)),
            key: ValueKey(state.hashCode),
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
            onChanged: (pageOptions) {
              context.read<MaterialApproveVendorQueryBloc>().add(
                    MaterialApproveVendorQueryEvent.fetch(
                      pageOptions: pageOptions,
                    ),
                  );
            },
            actionRight: (refreshButton) => [
              refreshButton,
              MaterialApproveVendorCreateButton(
                material: material,
              ),
            ],
            columns: [
              DTColumn(
                widthFlex: 5,
                head: const DTHead(
                  backendColumn: 'id',
                  label: 'ID',
                ),
                body: (materialApproved) => DataCell(
                  Text(materialApproved.id.toString()).canCopy(),
                ),
              ),
              DTColumn(
                widthFlex: 6,
                head: DTHead(
                  backendColumn: 'material',
                  label: 'material'.tr(),
                ),
                body: (materialApproved) => DataCell(
                  Text(materialApproved.material.id),
                ),
              ),
              DTColumn(
                widthFlex: 6,
                head: DTHead(
                  backendColumn: 'manufacturer',
                  label: 'manufacturer'.tr(),
                ),
                body: (materialApproved) => DataCell(
                  Text(materialApproved.vendor.name),
                ),
              ),
              DTColumn(
                widthFlex: 6,
                head: DTHead(
                  backendColumn: 'supplier',
                  label: 'supplier'.tr(),
                ),
                body: (materialApproved) => DataCell(
                  Text(
                    materialApproved.supplier.name,
                  ),
                ),
              ),
              DTColumn(
                widthFlex: 7,
                head: DTHead(
                  backendColumn: 'halal_certificate_expired',
                  label: 'halal_certificate_expired'.tr(),
                ),
                body: (materialApproved) => DataCell(
                  Text(materialApproved.halalCertificateExpired?.yMMMd ?? ''),
                ),
              ),
              DTColumn(
                widthFlex: 6,
                head: DTHead(
                  backendColumn: 'halal_institution',
                  label: 'halal_institution'.tr(),
                ),
                body: (materialApproved) => DataCell(
                  Text(materialApproved.halalInstitution),
                ),
              ),
              DTColumn(
                widthFlex: 6,
                head: DTHead(
                  backendColumn: 'halal_no_certificate',
                  label: 'halal_no_certificate'.tr(),
                ),
                body: (materialApproved) => DataCell(
                  Text(materialApproved.halalNoCertificate),
                ),
              ),
              DTColumn(
                widthFlex: 6,
                head: DTHead(
                  backendColumn: 'storage_procedure',
                  label: 'storage_procedure'.tr(),
                ),
                body: (materialApproved) => DataCell(
                  Tooltip(
                    message: materialApproved.storageProcedure,
                    child: SizedBox(
                      width: 250,
                      child: Text(materialApproved.storageProcedure),
                    ),
                  ),
                ),
              ),
              DTColumn(
                widthFlex: 10,
                head: DTHead(
                  backendColumn: 'category',
                  label: 'category'.tr(),
                ),
                body: (materialApproved) => DataCell(
                  ChipType(materialApproved.category),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  backendColumn: 'type',
                  label: 'type'.tr(),
                ),
                body: (materialApproved) => DataCell(
                  ChipType(materialApproved.type),
                ),
              ),
              DTColumn(
                widthFlex: 5,
                head: DTHead(
                  backendColumn: 'created_at',
                  label: 'created_at'.tr(),
                  numeric: true,
                ),
                body: (vendor) => DataCell(
                  Text(vendor.createdAt.yMMMdHm),
                ),
              ),
              DTColumn(
                widthFlex: 5,
                head: DTHead(
                  backendColumn: 'updated_at',
                  label: 'updated_at'.tr(),
                  numeric: true,
                ),
                body: (vendor) => DataCell(
                  Text(
                    vendor.updatedAt.yMMMdHm,
                  ),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  backendColumn: '',
                  label: 'actions'.tr(),
                ),
                body: (materialApproved) => DataCell(
                  Row(
                    children: [
                      MaterialApproveVendorUpdateButton(
                        material: material,
                        materialApproved: materialApproved,
                      ),
                      MaterialApprovedVendorEditHalalCertificateButton(
                        material: material,
                        materialApprovedVendor: materialApproved,
                      ),
                      MaterialApproveVendorDeleteButton.prepare(
                        material: material,
                        materialApproved: materialApproved,
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
