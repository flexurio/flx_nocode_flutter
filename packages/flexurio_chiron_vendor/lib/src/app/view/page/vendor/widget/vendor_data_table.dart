import 'package:flexurio_chiron_vendor/src/app/bloc/vendor_query/vendor_query_bloc.dart';
import 'package:flexurio_chiron_vendor/src/app/model/vendors.dart';
import 'package:flexurio_chiron_vendor/src/app/view/page/vendor/widget/vendor_create_button.dart';
import 'package:flexurio_chiron_vendor/src/app/view/page/vendor/widget/vendor_delete_button.dart';
import 'package:flexurio_chiron_vendor/src/app/view/page/vendor/widget/vendor_excel_button.dart';
import 'package:flexurio_chiron_vendor/src/app/view/page/vendor/widget/vendor_update_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VendorDataTable extends StatelessWidget {
  const VendorDataTable._();

  static Widget prepare() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              VendorQueryBloc()..add(const VendorQueryEvent.fetch()),
        ),
      ],
      child: const VendorDataTable._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VendorQueryBloc, VendorQueryState>(
      builder: (context, state) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: DataTableBackend<Vendor>(
            freezeFirstColumn: true,
            freezeLastColumn: true,
            onRefresh: () => context
                .read<VendorQueryBloc>()
                .add(const VendorQueryEvent.fetch()),
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
              context.read<VendorQueryBloc>().add(
                    VendorQueryEvent.fetch(
                      pageOptions: pageOptions,
                    ),
                  );
            },
            actionRight: (refreshButton) => [
              const VendorExportExcelButton(),
              refreshButton,
              const VendorCreateButton(),
            ],
            columns: [
              DTColumn(
                widthFlex: 5,
                head: const DTHead(
                  backendColumn: 'id',
                  label: 'ID',
                ),
                body: (vendor) => DataCell(
                  Text(vendor.id).canCopy(),
                ),
              ),
              DTColumn(
                widthFlex: 6,
                head: DTHead(
                  backendColumn: 'name',
                  label: 'name'.tr(),
                ),
                body: (vendor) => DataCell(
                  Text(vendor.name),
                ),
              ),
              DTColumn(
                widthFlex: 6,
                head: DTHead(
                  backendColumn: 'email',
                  label: 'email'.tr(),
                ),
                body: (vendor) => DataCell(
                  Text(vendor.email),
                ),
              ),
              DTColumn(
                widthFlex: 5,
                head: DTHead(
                  backendColumn: 'phone',
                  label: 'phone'.tr(),
                ),
                body: (vendor) => DataCell(
                  Text(vendor.phone),
                ),
              ),
              DTColumn(
                widthFlex: 6,
                head: DTHead(
                  backendColumn: 'address',
                  label: 'address'.tr(),
                ),
                body: (vendor) => DataCell(
                  Text(vendor.address),
                ),
              ),
              DTColumn(
                widthFlex: 4,
                head: DTHead(
                  backendColumn: 'city_name',
                  label: 'city_name'.tr(),
                ),
                body: (vendor) => DataCell(
                  Text(vendor.city),
                ),
              ),
              DTColumn(
                widthFlex: 4,
                head: DTHead(
                  backendColumn: 'country_name',
                  label: 'country_name'.tr(),
                ),
                body: (vendor) => DataCell(
                  Text(vendor.country),
                ),
              ),
              DTColumn(
                widthFlex: 4,
                head: DTHead(
                  backendColumn: 'pic',
                  label: 'pic'.tr(),
                ),
                body: (vendor) => DataCell(
                  Text(vendor.pic),
                ),
              ),
              DTColumn(
                widthFlex: 5,
                head: DTHead(
                  backendColumn: 'fax',
                  label: 'fax'.tr(),
                ),
                body: (vendor) => DataCell(
                  Text(vendor.fax),
                ),
              ),
              DTColumn(
                widthFlex: 5,
                head: DTHead(
                  backendColumn: 'npwp',
                  label: 'npwp'.tr(),
                ),
                body: (vendor) => DataCell(
                  Text(vendor.npwp),
                ),
              ),
              DTColumn(
                widthFlex: 4,
                head: DTHead(
                  backendColumn: 'postal_code',
                  label: 'postal_code'.tr(),
                ),
                body: (vendor) => DataCell(
                  Text(
                    vendor.postalCode == 0 ? '' : vendor.postalCode.toString(),
                  ),
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
                widthFlex: 6,
                head: DTHead(
                  backendColumn: '',
                  label: 'actions'.tr(),
                ),
                body: (vendor) => DataCell(
                  Row(
                    children: [
                      VendorUpdateButton(vendor: vendor),
                      VendorDeleteButton.prepare(vendors: vendor),
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
