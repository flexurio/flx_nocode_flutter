import 'package:flexurio_chiron_sales_order/src/app/bloc/sales_order_query/sales_order_query_bloc.dart';
import 'package:flexurio_chiron_customer/flexurio_chiron_customer.dart';
import 'package:flexurio_chiron_sales_order/src/app/model/sales_order.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class SalesOrderFormFilter extends StatefulWidget {
  const SalesOrderFormFilter._({
    required this.queryBloc,
  });

  static Widget prepare({required SalesOrderQueryBloc queryBloc}) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => queryBloc,
        ),
      ],
      child: SalesOrderFormFilter._(queryBloc: queryBloc),
    );
  }

  final SalesOrderQueryBloc queryBloc;

  @override
  State<SalesOrderFormFilter> createState() => _SalesOrderFormFilterState();
}

class _SalesOrderFormFilterState extends State<SalesOrderFormFilter> {
  SalesOrderStatus _status = SalesOrderStatus.empty;
  final _formKey = GlobalKey<FormState>();
  DateTime? _periodStart;
  DateTime? _periodEnd;
  Customer? _customer;

  void _submit() {
    if (_formKey.currentState!.validate()) {
      context.read<SalesOrderQueryBloc>().add(
            SalesOrderQueryEvent.fetch(
              pageOptions: PageOptions.emptyNoLimit(),
              customer: _customer,
              status: _status.label,
              periodStart: _periodStart,
              periodEnd: _periodEnd,
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Filter',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Gap(12),
          BlocBuilder<SalesOrderQueryBloc, SalesOrderQueryState>(
            builder: (context, state) {
              return FDropDownSearch<Customer>(
                labelText: 'Customer',
                items: state.maybeWhen(
                  loaded: (_, customer) => customer,
                  orElse: () => [],
                ),
                onChanged: (value) {
                  if (value != null) {
                    _customer = value;
                  }
                },
                itemAsString: (customer) => customer.name,
              );
            },
          ),
          const Gap(12),
          FDropDownSearch<SalesOrderStatus>(
            labelText: 'Status',
            items: const [
              SalesOrderStatus.input,
              SalesOrderStatus.confirm,
              SalesOrderStatus.printDeliveryOrder,
              SalesOrderStatus.printInvoice,
            ],
            onChanged: (value) {
              if (value != null) {
                _status = value;
              }
            },
            itemAsString: (status) => status.label,
          ),
          const Gap(12),
          FieldDatePicker(
            onChanged: (value) => _periodStart = value,
            controller: TextEditingController(),
            labelText: 'Period Start',
          ),
          const Gap(12),
          FieldDatePicker(
            onChanged: (value) => _periodEnd = value,
            controller: TextEditingController(),
            labelText: 'Period End',
          ),
          const Gap(12),
          BlocBuilder<SalesOrderQueryBloc, SalesOrderQueryState>(
            builder: (context, state) {
              return Button(
                permission: null,
                onPressed: state.maybeWhen(
                  orElse: () => _submit,
                  loading: (_) => null,
                ),
                action: DataAction.applyFilter,
              );
            },
          ),
        ],
      ),
    );
  }
}
