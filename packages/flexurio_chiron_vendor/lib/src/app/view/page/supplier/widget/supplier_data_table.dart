import 'package:flexurio_chiron_vendor/src/app/bloc/supplier_query/supplier_query_bloc.dart';
import 'package:flexurio_chiron_vendor/src/app/model/supplier.dart';
import 'package:flexurio_chiron_vendor/src/app/view/page/supplier/widget/supplier_create_button.dart';
import 'package:flexurio_chiron_vendor/src/app/view/page/supplier/widget/supplier_delete_button.dart';
import 'package:flexurio_chiron_vendor/src/app/view/page/supplier/widget/supplier_excel_button.dart';
import 'package:flexurio_chiron_vendor/src/app/view/page/supplier/widget/supplier_update_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SupplierDataTable extends StatelessWidget {
  const SupplierDataTable._();

  static Widget prepare() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              SupplierQueryBloc()..add(const SupplierQueryEvent.fetch()),
        ),
      ],
      child: const SupplierDataTable._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SupplierQueryBloc, SupplierQueryState>(
      builder: (context, state) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: DataTableBackend<Supplier>(
            freezeFirstColumn: true,
            freezeLastColumn: true,
            onRefresh: () => context
                .read<SupplierQueryBloc>()
                .add(const SupplierQueryEvent.fetch()),
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
              context.read<SupplierQueryBloc>().add(
                    SupplierQueryEvent.fetch(
                      pageOptions: pageOptions,
                    ),
                  );
            },
            actionRight: (refreshButton) => [
              SupplierExportExcelButton.prepare(),
              refreshButton,
              const SupplierCreateButton(),
            ],
            columns: [
              DTColumn(
                widthFlex: 5,
                head: const DTHead(
                  backendColumn: 'id',
                  label: 'ID',
                ),
                body: (supplier) => DataCell(
                  Text(supplier.id).canCopy(),
                ),
              ),
              DTColumn(
                widthFlex: 5,
                head: DTHead(
                  backendColumn: 'name',
                  label: 'name'.tr(),
                ),
                body: (supplier) => DataCell(
                  Text(supplier.name),
                ),
              ),
              DTColumn(
                widthFlex: 5,
                head: DTHead(
                  backendColumn: 'email',
                  label: 'email'.tr(),
                ),
                body: (supplier) => DataCell(
                  Text(supplier.email),
                ),
              ),
              DTColumn(
                widthFlex: 5,
                head: DTHead(
                  backendColumn: 'phone',
                  label: 'phone'.tr(),
                ),
                body: (supplier) => DataCell(
                  Text(supplier.phone),
                ),
              ),
              DTColumn(
                widthFlex: 6,
                head: DTHead(
                  backendColumn: 'address',
                  label: 'address'.tr(),
                ),
                body: (supplier) => DataCell(
                  Text(supplier.address),
                ),
              ),
              DTColumn(
                widthFlex: 4,
                head: DTHead(
                  backendColumn: 'city_name',
                  label: 'city_name'.tr(),
                ),
                body: (supplier) => DataCell(
                  Text(supplier.city),
                ),
              ),
              DTColumn(
                widthFlex: 4,
                head: DTHead(
                  backendColumn: 'country_name',
                  label: 'country_name'.tr(),
                ),
                body: (supplier) => DataCell(
                  Text(supplier.country),
                ),
              ),
              DTColumn(
                widthFlex: 4,
                head: DTHead(
                  backendColumn: 'pic',
                  label: 'pic'.tr(),
                ),
                body: (supplier) => DataCell(
                  Text(supplier.pic),
                ),
              ),
              DTColumn(
                widthFlex: 5,
                head: DTHead(
                  backendColumn: 'fax',
                  label: 'fax'.tr(),
                ),
                body: (supplier) => DataCell(
                  Text(supplier.fax),
                ),
              ),
              DTColumn(
                widthFlex: 5,
                head: DTHead(
                  backendColumn: 'npwp',
                  label: 'npwp'.tr(),
                ),
                body: (supplier) => DataCell(
                  Text(supplier.npwp),
                ),
              ),
              DTColumn(
                widthFlex: 4,
                head: DTHead(
                  backendColumn: 'postal_code',
                  label: 'postal_code'.tr(),
                ),
                body: (supplier) => DataCell(
                  Text(
                    supplier.postalCode == 0
                        ? ''
                        : supplier.postalCode.toString(),
                  ),
                ),
              ),
              DTColumn(
                widthFlex: 5,
                head: DTHead(
                  backendColumn: 'term_of_payment',
                  label: 'term_of_payment'.tr(),
                ),
                body: (supplier) => DataCell(
                  Text(supplier.termOfPayment.toString()),
                ),
              ),
              DTColumn(
                widthFlex: 5,
                head: DTHead(
                  backendColumn: 'created_at',
                  label: 'created_at'.tr(),
                  numeric: true,
                ),
                body: (supplier) => DataCell(
                  Text(supplier.createdAt.yMMMdHm),
                ),
              ),
              DTColumn(
                widthFlex: 5,
                head: DTHead(
                  backendColumn: 'updated_at',
                  label: 'updated_at'.tr(),
                  numeric: true,
                ),
                body: (supplier) => DataCell(
                  Text(
                    supplier.updatedAt.yMMMdHm,
                  ),
                ),
              ),
              DTColumn(
                widthFlex: 6,
                head: DTHead(
                  backendColumn: '',
                  label: 'actions'.tr(),
                ),
                body: (supplier) => DataCell(
                  Row(
                    children: [
                      SupplierUpdateButton(supplier: supplier),
                      SupplierDeleteButton.prepare(
                        id: supplier.id,
                        supplier: supplier,
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
