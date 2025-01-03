import 'package:flexurio_chiron_customer/flexurio_chiron_customer.dart';
import 'package:appointment/src/app/util/picker_file.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_product_stock/src/app/bloc/delivery_date_recap_query/delivery_date_recap_query_bloc.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/delivery_date_recap.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductIssueRecapDeliveryReportExportExcelButton extends StatefulWidget {
  const ProductIssueRecapDeliveryReportExportExcelButton({super.key});

  static Widget prepare() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => DeliveryDateRecapQueryBloc(),
        ),
        BlocProvider(
          create: (context) => CustomerQueryBloc()
            ..add(
              CustomerQueryEvent.fetch(
                pageOptions: PageOptions.emptyNoLimit(),
              ),
            ),
        ),
      ],
      child: const ProductIssueRecapDeliveryReportExportExcelButton(),
    );
  }

  @override
  State<ProductIssueRecapDeliveryReportExportExcelButton> createState() =>
      _ProductIssueRecapDeliveryReportExportExcelButtonState();
}

class _ProductIssueRecapDeliveryReportExportExcelButtonState
    extends State<ProductIssueRecapDeliveryReportExportExcelButton> {
  DateTime? _deliveryOrderDateGte;
  DateTime? _deliveryOrderDateLte;
  Customer? _customer;

  final _deliveryOrderDateGteController = TextEditingController();
  final _deliveryOrderDateLteController = TextEditingController();

  @override
  void initState() {
    _deliveryOrderDateGteController.text =
        _deliveryOrderDateGte?.yyyyMMdd ?? '';
    _deliveryOrderDateLteController.text =
        _deliveryOrderDateLte?.yyyyMMdd ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final queryBloc = context.read<DeliveryDateRecapQueryBloc>();
    final customerQueryBloc = context.read<CustomerQueryBloc>();

    return LightButtonSmall(
      action: DataAction.exportExcel,
      title: 'Laporan Pengiriman',
      permission: null,
      onPressed: () async {
        await _showPeriod(context, queryBloc, customerQueryBloc);
      },
    );
  }

  Future<void> _showPeriod(
    BuildContext context,
    DeliveryDateRecapQueryBloc queryBloc,
    CustomerQueryBloc customerQueryBloc,
  ) async {
    await showDialog<bool?>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return CardForm(
          popup: true,
          title: 'Select Period',
          icon: Icons.calendar_month_rounded,
          actions: [
            Button(
              action: DataAction.cancel,
              permission: null,
              isSecondary: true,
              onPressed: () => Navigator.pop(context),
            ),
            const SizedBox(width: 12),
            BlocListener<DeliveryDateRecapQueryBloc,
                DeliveryDateRecapQueryState>(
              bloc: queryBloc,
              listener: (context, state) {
                state.maybeWhen(
                  orElse: () {},
                  error: (error) => Toast(context).fail(error),
                  loaded: (recapDeliveryDate) {
                    final bytes = simpleExcel<DeliveryDateRecap>(
                      context: context,
                      data: recapDeliveryDate,
                      columns: [
                        TColumn(
                          title: 'year'.tr(),
                          builder: (data, index) {
                            return DateFormat('yyyy').format(
                              data.deliveryOrderDate,
                            );
                          },
                        ),
                        TColumn(
                          title: 'period'.tr(),
                          builder: (data, index) {
                            return DateFormat('yyyyMM').format(
                              data.deliveryOrderDate,
                            );
                          },
                        ),
                        TColumn(
                          title: 'division'.tr(),
                          builder: (data, index) => 'PT. METISKA FARMA',
                        ),
                        TColumn(
                          title: 'delivery_order_id'.tr(),
                          builder: (data, index) => data.deliveryOrderId,
                        ),
                        TColumn(
                          title: 'delivery_order_date'.tr(),
                          builder: (data, index) {
                            return DateFormat('yyyy-MM-dd HH:mm:ss').format(
                              data.deliveryOrderDate,
                            );
                          },
                        ),
                        TColumn(
                          title: 'invoice_no'.tr(),
                          builder: (data, index) => data.invoiceId,
                        ),
                        TColumn(
                          title: 'invoice_date'.tr(),
                          builder: (data, index) {
                            return DateFormat('yyyy-MM-dd HH:mm:ss').format(
                              data.invoiceDate,
                            );
                          },
                        ),
                        TColumn(
                          title: 'customer_id'.tr(),
                          builder: (data, index) =>
                              '${data.customerId ?? '-'}-${data.customerName ?? '-'}-${data.customerCity ?? '-'}',
                        ),
                        TColumn(
                          title: 'expedition'.tr(),
                          builder: (data, index) => data.expedition ?? '-',
                        ),
                        TColumn(
                          title: 'delivery_date'.tr(),
                          builder: (data, index) {
                            return DateFormat('yyyy-MM-dd HH:mm:ss').format(
                              data.deliveryDate,
                            );
                          },
                        ),
                        TColumn(
                          title: 'product_name'.tr(),
                          builder: (data, index) => data.productName,
                        ),
                        TColumn(
                          title: 'qty'.tr(),
                          numeric: true,
                          builder: (data, index) => data.qty.toString(),
                        ),
                        TColumn(
                          title: 'batch_no'.tr(),
                          builder: (data, index) => data.batchNoId,
                        ),
                        TColumn(
                          title: 'expired_date'.tr(),
                          builder: (data, index) {
                            return DateFormat('yyyy-MM-dd HH:mm:ss').format(
                              data.expirationDate,
                            );
                          },
                        ),
                        TColumn(
                          title: 'status'.tr(),
                          builder: (data, index) {
                            final deliveryOrderDate = data.deliveryOrderDate;
                            final deliveryOrderReceived =
                                data.deliveryOrderReceived;

                            if (deliveryOrderReceived != null) {
                              final differenceInMinutes = deliveryOrderReceived
                                  .difference(deliveryOrderDate)
                                  .inMinutes;
                              return differenceInMinutes <= 480
                                  ? 'OK'
                                  : 'NOT OK';
                            } else {
                              return '-'; // Placeholder for missing data
                            }
                          },
                        ),
                      ],
                    );
                    saveFile(bytes, 'laporan_pengiriman.xlsx');
                  },
                );
              },
              child: BlocBuilder<DeliveryDateRecapQueryBloc,
                  DeliveryDateRecapQueryState>(
                bloc: queryBloc,
                builder: (context, state) {
                  return LightButtonSmall(
                    action: DataAction.exportExcel,
                    permission: null,
                    // status: state.maybeWhen(
                    //   loading: (_) => Status.progress,
                    //   orElse: () => null,
                    // ),
                    onPressed: () async {
                      if (_deliveryOrderDateGte != null &&
                          _deliveryOrderDateLte != null) {
                        // if (_deliveryOrderDateGte != null && _deliveryOrderDateLte != null && _customer != null) {
                        queryBloc.add(
                          DeliveryDateRecapQueryEvent.fetch(
                            customer: _customer,
                            deliveryOrderDateGte: _deliveryOrderDateGte,
                            deliveryOrderDateLte: _deliveryOrderDateLte,
                          ),
                        );
                      } else {
                        Toast(context)
                            .fail('You must insert the Date & Customer');
                      }
                    },
                  );
                },
              ),
            ),
          ],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FieldDatePicker(
                labelText: 'Period Start',
                controller: _deliveryOrderDateGteController,
                onChanged: (value) => _deliveryOrderDateGte = value,
              ),
              const SizedBox(height: 12),
              FieldDatePicker(
                labelText: 'Period End',
                controller: _deliveryOrderDateLteController,
                onChanged: (value) => _deliveryOrderDateLte = value,
              ),
              const SizedBox(height: 12),
              BlocBuilder<CustomerQueryBloc, CustomerQueryState>(
                bloc: customerQueryBloc,
                builder: (context, state) {
                  return FDropDownSearch<Customer>(
                    labelText: 'customer'.tr(),
                    itemAsString: (customer) {
                      return '${customer.id}-${customer.name}-${customer.cityName}';
                    },
                    items: state.maybeWhen(
                      orElse: () => [],
                      loaded: (pageOptions) => pageOptions.data,
                    ),
                    status: state.maybeWhen(
                      orElse: () => Status.error,
                      loading: (_) => Status.progress,
                      loaded: (_) => Status.loaded,
                    ),
                    onChanged: (customer) async {
                      if (customer != null) {
                        _customer = customer;
                      }
                    },
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
