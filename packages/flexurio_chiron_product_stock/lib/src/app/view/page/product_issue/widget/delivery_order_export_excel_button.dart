import 'package:flexurio_chiron_customer/flexurio_chiron_customer.dart';
import 'package:appointment/src/app/util/picker_file.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_product_stock/src/app/bloc/delivery_date_recap_query/delivery_date_recap_query_bloc.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/delivery_date_recap.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductIssueDeliveryOrderLeadtimeReportExportExcelButton
    extends StatefulWidget {
  const ProductIssueDeliveryOrderLeadtimeReportExportExcelButton({super.key});

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
      child: const ProductIssueDeliveryOrderLeadtimeReportExportExcelButton(),
    );
  }

  @override
  State<ProductIssueDeliveryOrderLeadtimeReportExportExcelButton>
      createState() =>
          _ProductIssueDeliveryOrderLeadtimeReportExportExcelButtonState();
}

class _ProductIssueDeliveryOrderLeadtimeReportExportExcelButtonState
    extends State<ProductIssueDeliveryOrderLeadtimeReportExportExcelButton> {
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
      title: 'Leadtime SJL',
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
                          title: 'division'.tr(),
                          builder: (data, index) => 'PT. METISKA FARMA',
                        ),
                        TColumn(
                          title: 'period'.tr(),
                          builder: (data, index) {
                            return DateFormat('yyyyMM')
                                .format(data.deliveryOrderDate);
                          },
                        ),
                        TColumn(
                          title: 'delivery_order_id'.tr(),
                          builder: (data, index) => data.deliveryOrderId,
                        ),
                        TColumn(
                          title: 'customer_name'.tr(),
                          builder: (data, index) =>
                              '${data.customerId ?? '-'}-${data.customerName ?? '-'}-${data.customerCity ?? '-'}',
                        ),
                        TColumn(
                          title: 'delivery_order_date'.tr(),
                          builder: (data, index) {
                            return DateFormat('yyyy-MM-dd HH:mm:ss')
                                .format(data.deliveryOrderDate);
                          },
                        ),
                        TColumn(
                          title: 'delivery_order_received'.tr(),
                          builder: (data, index) {
                            return data.deliveryOrderReceived != null
                                ? DateFormat('yyyy-MM-dd HH:mm:ss')
                                    .format(data.deliveryOrderReceived!)
                                : '-';
                          },
                        ),
                        TColumn(
                          title: 'adm'.tr(),
                          builder: (data, index) {
                            final soInputDate = data.soInputDate;
                            final poInputDate = data.poInputDate;
                            if (soInputDate != null && poInputDate != null) {
                              final differenceInHours =
                                  poInputDate.difference(soInputDate).inHours;
                              return differenceInHours.toString();
                            } else {
                              return '0';
                            }
                          },
                        ),
                        TColumn(
                          title: 'delivery_date'.tr(),
                          builder: (data, index) {
                            return DateFormat('yyyy-MM-dd HH:mm:ss')
                                .format(data.deliveryDate);
                          },
                        ),
                        TColumn(
                          title: 'goj'.tr(),
                          builder: (data, index) {
                            final poInputDate = data.poInputDate;
                            final deliveryDate = data.deliveryDate;
                            if (poInputDate != null) {
                              final differenceInHours =
                                  deliveryDate.difference(poInputDate).inHours;
                              return differenceInHours.toString();
                            } else {
                              return '0';
                            }
                          },
                        ),
                        TColumn(
                          title: 'end_packing_date'.tr(),
                          builder: (data, index) {
                            return data.endPackingDate != null
                                ? DateFormat('yyyy-MM-dd HH:mm:ss')
                                    .format(data.endPackingDate!)
                                : '-';
                          },
                        ),
                        TColumn(
                          title: 'geks1'.tr(),
                          builder: (data, index) {
                            final deliveryDate = data.deliveryDate;
                            final endPackingDate = data.endPackingDate;
                            if (endPackingDate != null) {
                              final differenceInHours = endPackingDate
                                  .difference(deliveryDate)
                                  .inHours;
                              return differenceInHours.toString();
                            } else {
                              return '0';
                            }
                          },
                        ),
                        TColumn(
                          title: 'sales_order_receive_date'.tr(),
                          builder: (data, index) {
                            return data.soInputDate != null
                                ? DateFormat('yyyy-MM-dd HH:mm:ss')
                                    .format(data.soInputDate!)
                                : '-';
                          },
                        ),
                        TColumn(
                          title: 'geks2'.tr(),
                          builder: (data, index) {
                            final endPackingDate = data.endPackingDate;
                            final deliveryOrderDate = data.deliveryOrderDate;
                            if (endPackingDate != null) {
                              final differenceInHours = deliveryOrderDate
                                  .difference(endPackingDate)
                                  .inHours;
                              return differenceInHours.toString();
                            } else {
                              return '0';
                            }
                          },
                        ),
                        TColumn(
                          title: 'total_leadtime'.tr(),
                          builder: (data, index) {
                            final soInputDate = data.soInputDate;
                            final poInputDate = data.poInputDate;
                            final deliveryDate = data.deliveryDate;
                            final endPackingDate = data.endPackingDate;
                            final deliveryOrderDate = data.deliveryOrderDate;
                            if (soInputDate != null &&
                                poInputDate != null &&
                                endPackingDate != null) {
                              final leadTime1 =
                                  poInputDate.difference(soInputDate).inHours;
                              final leadTime2 =
                                  deliveryDate.difference(poInputDate).inHours;
                              final leadTime3 = endPackingDate
                                  .difference(deliveryDate)
                                  .inHours;
                              final leadTime4 = deliveryOrderDate
                                  .difference(endPackingDate)
                                  .inHours;
                              final totalLeadTime =
                                  leadTime1 + leadTime2 + leadTime3 + leadTime4;
                              return totalLeadTime.toString();
                            } else {
                              return '0';
                            }
                          },
                        ),
                        TColumn(
                          title: 'leadtime'.tr(),
                          builder: (data, index) {
                            final soInputDate = data.soInputDate;
                            final poInputDate = data.poInputDate;
                            final deliveryDate = data.deliveryDate;
                            final endPackingDate = data.endPackingDate;
                            final deliveryOrderDate = data.deliveryOrderDate;
                            if (soInputDate != null &&
                                poInputDate != null &&
                                endPackingDate != null) {
                              final leadTime1 =
                                  poInputDate.difference(soInputDate).inHours;
                              final leadTime2 =
                                  deliveryDate.difference(poInputDate).inHours;
                              final leadTime3 = endPackingDate
                                  .difference(deliveryDate)
                                  .inHours;
                              final leadTime4 = deliveryOrderDate
                                  .difference(endPackingDate)
                                  .inHours;
                              final totalLeadTime =
                                  leadTime1 + leadTime2 + leadTime3 + leadTime4;
                              return totalLeadTime > 240 ? 'NOT OK' : 'OK';
                            } else {
                              return 'NOT OK';
                            }
                          },
                        ),
                      ],
                    );
                    saveFile(bytes, 'leadtime_SJL.xlsx');
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
                      // if (_deliveryOrderDateGte != null && _deliveryOrderDateLte != null && _customer != null) {
                      if (_deliveryOrderDateGte != null &&
                          _deliveryOrderDateLte != null) {
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
