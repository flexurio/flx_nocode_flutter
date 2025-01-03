import 'package:flexurio_chiron_customer/flexurio_chiron_customer.dart';
import 'package:appointment/src/app/view/widget/get_user_name.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomerDataTable extends StatelessWidget {
  const CustomerDataTable._();

  static Widget prepare() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              CustomerQueryBloc()..add(const CustomerQueryEvent.fetch()),
        ),
      ],
      child: const CustomerDataTable._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomerQueryBloc, CustomerQueryState>(
      builder: (context, state) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: DataTableBackend<Customer>(
            freezeFirstColumn: true,
            freezeLastColumn: true,
            key: ValueKey(state.hashCode),
            status: state.maybeWhen(
              loading: (_) => Status.progress,
              loaded: (_) => Status.loaded,
              orElse: () => Status.error,
            ),
            onRefresh: () => context
                .read<CustomerQueryBloc>()
                .add(const CustomerQueryEvent.fetch()),
            pageOptions: state.maybeWhen(
              loaded: (data) => data,
              loading: (data) => data,
              orElse: PageOptions.empty,
            ),
            actionRight: (refreshButton) => [
              const CustomerExportPdfButton(),
              refreshButton,
              const CustomerCreateButton(),
            ],
            onChanged: (pageOptions) {
              context.read<CustomerQueryBloc>().add(
                    CustomerQueryEvent.fetch(
                      pageOptions: pageOptions,
                    ),
                  );
            },
            columns: [
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'code'.tr(),
                  backendColumn: 'id',
                ),
                body: (customer) => DataCell(
                  Text(customer.id),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'name'.tr(),
                  backendColumn: 'name',
                ),
                body: (customer) => DataCell(
                  Text(customer.name),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'address'.tr(),
                  backendColumn: 'address',
                ),
                body: (customer) => DataCell(
                  Text(customer.address),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'discount'.tr(),
                  backendColumn: 'discount',
                ),
                body: (customer) => DataCell(
                  Text(
                    customer.discount.toString(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'term_of_payment'.tr(),
                  backendColumn: 'term_of_payment',
                ),
                body: (customer) => DataCell(
                  SizedText(customer.termOfPayment.toString()),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: const DTHead(
                  label: 'NPWP',
                  backendColumn: 'npwp',
                ),
                body: (customer) => DataCell(
                  SizedText(customer.npwp),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'customer_category'.tr(),
                  backendColumn: 'customer_category',
                ),
                body: (customer) => DataCell(
                  ChipType(customer.customerCategory),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'created_by'.tr(),
                  backendColumn: 'created_by_id',
                ),
                body: (customer) => DataCell(
                  GetNameUser(userId: customer.createdById),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'created_at'.tr(),
                  backendColumn: 'created_at',
                ),
                body: (customer) => DataCell(
                  Text(customer.createdAt.yMMMdHm),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: const DTHead(
                  label: 'Updated By',
                  backendColumn: 'updated_by_id',
                ),
                body: (customer) => DataCell(
                  GetNameUser(userId: customer.createdById),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'updated_at'.tr(),
                  backendColumn: 'updated_at',
                ),
                body: (customer) => DataCell(
                  Text(customer.updatedAt.yMMMdHm),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'actions'.tr(),
                  backendColumn: null,
                ),
                body: (customer) => DataCell(
                  Row(
                    children: [
                      CustomerDiscountButton(customer: customer),
                      CustomerUpdateButton(customer: customer),
                      CustomerDeleteButton.prepare(customer: customer),
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
