import 'package:appointment/src/app/util/picker_file.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_material/src/app/bloc/material_halal_certificate_query/material_halal_certificate_query_bloc.dart';
import 'package:flexurio_chiron_material/src/app/model/material_halal_certificate.dart';
import 'package:flexurio_chiron_material/src/app/model/permission.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MaterialHalalCertificateExportExcelButton extends StatefulWidget {
  const MaterialHalalCertificateExportExcelButton({super.key});

  static Widget prepare() {
    return BlocProvider(
      create: (context) => MaterialHalalCertificateQueryBloc(),
      child: const MaterialHalalCertificateExportExcelButton(),
    );
  }

  @override
  State<MaterialHalalCertificateExportExcelButton> createState() =>
      _MaterialHalalCertificateExportExcelButtonState();
}

class _MaterialHalalCertificateExportExcelButtonState
    extends State<MaterialHalalCertificateExportExcelButton> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<MaterialHalalCertificateQueryBloc>();

    return BlocListener<MaterialHalalCertificateQueryBloc,
        MaterialHalalCertificateQueryState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          loaded: (pageOptions) {
            final bytes = simpleExcel<MaterialHalalCertificate>(
              context: context,
              data: pageOptions.data,
              columns: [
                TColumn(
                  title: 'material_group'.tr(),
                  builder: (data, index) => data.materialGroupId,
                ),
                TColumn(
                  title: 'material_id'.tr(),
                  builder: (data, index) => data.materialId,
                ),
                TColumn(
                  title: 'material_name'.tr(),
                  builder: (data, index) => data.materialName,
                ),
                TColumn(
                  title: 'unit'.tr(),
                  builder: (data, index) => data.materialUnitId,
                ),
                TColumn(
                  title: 'halal_certificate_expired'.tr(),
                  builder: (data, index) =>
                      data.halalCertificateExpired?.ddMMyyyy ?? '',
                ),
                TColumn(
                  title: 'active'.tr(),
                  builder: (data, index) => data.isActive ? 'Yes' : 'No',
                ),
              ],
            );
            saveFile(bytes, 'Material-Halal-Certificate.xlsx');
          },
        );
      },
      child: BlocBuilder<MaterialHalalCertificateQueryBloc,
          MaterialHalalCertificateQueryState>(
        builder: (context, state) {
          return LightButtonSmall(
            action: DataAction.exportExcel,
            title: 'material_halal_certificate'.tr(),
            status: state.maybeWhen(
              loading: (_) => Status.progress,
              orElse: () => null,
            ),
            permission: PermissionMaterial.materialHalalCertificateExportExcel,
            onPressed: () {
              bloc.add(
                MaterialHalalCertificateQueryEvent.fetch(
                  pageOptions: PageOptions.emptyNoLimit(
                    sortBy: 'material_group_id',
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
