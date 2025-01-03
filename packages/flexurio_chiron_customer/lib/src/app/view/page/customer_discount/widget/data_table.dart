import 'package:flexurio_chiron_customer/flexurio_chiron_customer.dart';
import 'package:appointment/src/app/view/widget/get_user_name.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomerDiscountDataTable extends StatefulWidget {
  const CustomerDiscountDataTable({required this.customer, super.key});

  final Customer customer;

  @override
  State<CustomerDiscountDataTable> createState() =>
      _CustomerDiscountDataTableState();
}

class _CustomerDiscountDataTableState extends State<CustomerDiscountDataTable> {
  @override
  Widget build(BuildContext context) {
    final queryBloc = context.read<CustomerDiscountQueryBloc>();
    return BlocBuilder<CustomerDiscountQueryBloc, CustomerDiscountQueryState>(
      builder: (context, state) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: DataTableBackend<CustomerDiscount>(
            freezeFirstColumn: true,
            freezeLastColumn: true,
            onRefresh: () =>
                queryBloc.add(const CustomerDiscountQueryEvent.fetch()),
            key: ValueKey(state.hashCode),
            status: state.maybeWhen(
              loading: (_) => Status.progress,
              loaded: (_) => Status.loaded,
              orElse: () => Status.error,
            ),
            onChanged: (pageOptions) {
              context.read<CustomerDiscountQueryBloc>().add(
                    CustomerDiscountQueryEvent.fetch(pageOptions: pageOptions),
                  );
            },
            pageOptions: state.maybeWhen(
              loaded: (data) => data,
              loading: (data) => data,
              orElse: PageOptions.empty,
            ),
            actionRight: (refreshButton) => [
              refreshButton,
              CustomerDiscountCreateButton(customer: widget.customer),
            ],
            columns: [
              DTColumn(
                widthFlex: 6,
                head: const DTHead(
                  label: 'Start Date',
                  backendColumn: 'start_date',
                ),
                body: (customerDiscount) =>
                    DataCell(Text(customerDiscount.startDate.yMMMd)),
              ),
              DTColumn(
                widthFlex: 6,
                head: const DTHead(
                  label: 'End Date',
                  backendColumn: 'end_date',
                ),
                body: (customerDiscount) =>
                    DataCell(Text(customerDiscount.endDate?.yMMMd ?? '')),
              ),
              DTColumn(
                widthFlex: 3,
                head: DTHead(
                  label: 'discount'.tr(),
                  backendColumn: 'realization_amount',
                  numeric: true,
                ),
                body: (customerDiscount) =>
                    DataCell(Text(customerDiscount.discount.format())),
              ),
              DTColumn(
                widthFlex: 6,
                head: DTHead(
                  label: 'created_by'.tr(),
                  backendColumn: 'created_by_id',
                ),
                body: (customerDiscount) => DataCell(
                  GetNameUser(userId: customerDiscount.createdById),
                ),
              ),
              DTColumn(
                widthFlex: 6,
                head: DTHead(
                  label: 'created_at'.tr(),
                  backendColumn: 'created_at',
                ),
                body: (customerDiscount) =>
                    DataCell(Text(customerDiscount.createdAt.yMMMdHm)),
              ),
              DTColumn(
                widthFlex: 6,
                head: const DTHead(
                  label: 'Updated By',
                  backendColumn: 'updated_by_id',
                ),
                body: (customerDiscount) => DataCell(
                  GetNameUser(userId: customerDiscount.updatedById),
                ),
              ),
              DTColumn(
                widthFlex: 6,
                head: const DTHead(
                  label: 'Updated At',
                  backendColumn: 'updated_at',
                ),
                body: (customerDiscount) =>
                    DataCell(Text(customerDiscount.updatedAt.yMMMdHm)),
              ),
              DTColumn(
                widthFlex: 10,
                head: const DTHead(label: 'Actions', backendColumn: ''),
                body: (customerDiscount) => DataCell(
                  Row(
                    children: [
                      CustomerDiscountDeleteButton.prepare(
                        customerDiscount: customerDiscount,
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
