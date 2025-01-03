import 'package:flexurio_chiron_tax/src/app/bloc/tax_invoice_number_query/tax_invoice_number_query_bloc.dart';
import 'package:flexurio_chiron_tax/src/app/model/tax_invoice_number.dart'
    as model;
import 'package:flexurio_chiron_tax/src/app/view/page/tax_invoice_number/widget/create_button.dart';
import 'package:flexurio_chiron_tax/src/app/view/page/tax_invoice_number/widget/delete_button.dart';

import 'package:appointment/src/app/view/widget/data_table_set_2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaxInvoiceNumberDataTable extends StatelessWidget {
  const TaxInvoiceNumberDataTable({super.key});

  static Widget prepare() {
    final yearNow = DateTime.now().year;
    return BlocProvider(
      create: (_) => TaxInvoiceNumberQueryBloc()
        ..add(
          TaxInvoiceNumberQueryEvent.fetch(
            year: [
              DateTime.now().copyWith(year: yearNow - 1),
              DateTime.now(),
            ],
          ),
        ),
      child: const TaxInvoiceNumberDataTable(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final yearNow = DateTime.now().year;
    return BlocBuilder<TaxInvoiceNumberQueryBloc, TaxInvoiceNumberQueryState>(
      builder: (context, state) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: DataTableSet2<model.TaxInvoiceNumber>(
            key: ValueKey(state.hashCode),
            title: Entity.taxInvoiceNumber.title,
            actionRight: (refreshButton) => [
              refreshButton,
              const TaxInvoiceNumberCreateButton(),
            ],
            status: state.maybeWhen(
              orElse: () => Status.error,
              loading: () => Status.progress,
              loaded: (_) => Status.loaded,
            ),
            data: state.maybeWhen(
              orElse: () => [],
              loaded: (taxInvoiceNumbers) {
                return taxInvoiceNumbers;
              },
            ),
            onRefresh: () => context.read<TaxInvoiceNumberQueryBloc>().add(
                  TaxInvoiceNumberQueryEvent.fetch(
                    year: [
                      DateTime.now().copyWith(year: yearNow - 1),
                      DateTime.now(),
                    ],
                  ),
                ),
            columns: [
              DTColumnXX(
                head: DTHeadXX(
                  label: Text('year'.tr()),
                  sortString: (taxInvoiceNumber) => taxInvoiceNumber.year,
                ),
                body: (taxInvoiceNumber) => DataCell(
                  Text(taxInvoiceNumber.year),
                ),
              ),
              DTColumnXX(
                head: DTHeadXX(
                  label: Text('prefix'.tr()),
                  sortString: (taxInvoiceNumber) => taxInvoiceNumber.prefix,
                ),
                body: (taxInvoiceNumber) => DataCell(
                  Text(taxInvoiceNumber.prefix),
                ),
              ),
              DTColumnXX(
                head: DTHeadXX(
                  label: Text('minimum_value'.tr()),
                  numeric: true,
                  sortNum: (taxInvoiceNumber) => taxInvoiceNumber.minValue,
                ),
                body: (taxInvoiceNumber) => DataCell(
                  Text(taxInvoiceNumber.minValue.toString()),
                ),
              ),
              DTColumnXX(
                head: DTHeadXX(
                  label: Text('maximum_value'.tr()),
                  numeric: true,
                  sortNum: (taxInvoiceNumber) => taxInvoiceNumber.maxValue,
                ),
                body: (taxInvoiceNumber) => DataCell(
                  Text(taxInvoiceNumber.maxValue.toString()),
                ),
              ),
              DTColumnXX(
                head: DTHeadXX(
                  label: Text('sequence'.tr()),
                  numeric: true,
                  sortNum: (taxInvoiceNumber) => taxInvoiceNumber.sequence,
                ),
                body: (taxInvoiceNumber) => DataCell(
                  Text(taxInvoiceNumber.sequence.toString()),
                ),
              ),
              DTColumnXX(
                head: DTHeadXX(
                  label: Text('remaining_invoice'.tr()),
                  numeric: true,
                  sortNum: (taxInvoiceNumber) =>
                      taxInvoiceNumber.remainingInvoice,
                ),
                body: (taxInvoiceNumber) {
                  return DataCell(
                    Text(taxInvoiceNumber.remainingInvoice.toString()),
                  );
                },
              ),
              DTColumnXX(
                head: DTHeadXX(
                  label: Text('active'.tr()),
                ),
                body: (taxInvoiceNumber) => DataCell(
                  BoolIcon(taxInvoiceNumber.isActive),
                ),
              ),
              DTColumnXX(
                head: DTHeadXX(
                  label: Text('actions'.tr()),
                ),
                body: (taxInvoiceNumber) => DataCell(
                  Row(
                    children: [
                      if (taxInvoiceNumber.isActive == false)
                        TaxInvoiceNumberDeleteButton.prepare(
                          taxInvoiceNumber: taxInvoiceNumber,
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
