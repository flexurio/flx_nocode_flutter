import 'package:flexurio_chiron_product_stock/src/app/model/warehouse.dart';
import 'package:appointment/src/app/util/picker_file.dart';
import 'package:appointment/src/app/view/widget/get_user_name.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_product/flexurio_chiron_product.dart';
import 'package:flexurio_chiron_product_stock/src/app/bloc/product_receive_detail_query/product_receive_detail_query_bloc.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/product_receive_detail.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductReceiveExportExcelButton extends StatefulWidget {
  const ProductReceiveExportExcelButton({super.key});

  static Widget prepare({
    required bool isExternal,
  }) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              ProductReceiveDetailQueryBloc(isExternal: isExternal),
        ),
        BlocProvider(
          create: (context) => ProductQueryBloc(
            isExternal: isExternal,
          )..add(
              ProductQueryEvent.fetch(
                pageOptions: PageOptions.emptyNoLimit(),
              ),
            ),
        ),
      ],
      child: const ProductReceiveExportExcelButton(),
    );
  }

  @override
  State<ProductReceiveExportExcelButton> createState() =>
      _ProductReceiveExportExcelButtonState();
}

class _ProductReceiveExportExcelButtonState
    extends State<ProductReceiveExportExcelButton> {
  final _requiredObjectValidator = RequiredObjectValidator<dynamic>(
    errorText: pleaseFillOutThisField.tr(),
  );
  DateTime? _startDate;
  DateTime? _endDate;
  Product? _product;
  List<Warehouse> _listWarehouse = [];

  final _startDateController = TextEditingController();
  final _endDateController = TextEditingController();
  // final userDepartment = UserRepositoryApp.instance.department;
  // final printedBy = UserRepositoryApp.instance.userApp?.name ?? '';

  @override
  void initState() {
    _startDateController.text = _startDate?.yyyyMMdd ?? '';
    _endDateController.text = _endDate?.yyyyMMdd ?? '';
    // _warehouse = _warehouse;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final queryBloc = context.read<ProductReceiveDetailQueryBloc>();
    final productBloc = context.read<ProductQueryBloc>();

    return LightButtonSmall(
      action: DataAction.exportExcel,
      title: 'Product Receive',
      permission: null,
      onPressed: () async {
        await _showPeriod(
          context,
          queryBloc,
          productBloc,
        );
      },
    );
  }

  Future<void> _showPeriod(
    BuildContext context,
    ProductReceiveDetailQueryBloc queryBloc,
    ProductQueryBloc productBloc,
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
            UsersBuilder(
              builder: (users) {
                return BlocListener<ProductReceiveDetailQueryBloc,
                    ProductReceiveDetailQueryState>(
                  bloc: queryBloc,
                  listener: (context, state) {
                    state.maybeWhen(
                      orElse: () {},
                      error: (error) => Toast(context).fail(error),
                      loaded: (materialRequest) {
                        final bytes = simpleExcel<ProductReceiveDetail>(
                          context: context,
                          data: materialRequest.data,
                          columns: [
                            TColumn(
                              title: 'product_receive_id'.tr(),
                              builder: (data, index) => data.productReceive.id,
                            ),
                            TColumn(
                              title: 'product_receive_date'.tr(),
                              builder: (data, index) {
                                return data.productReceive.createdAt.yyyyMMdd;
                              },
                            ),
                            TColumn(
                              title: 'product_receive_period'.tr(),
                              builder: (data, index) =>
                                  DateFormat('yyyyMM').format(
                                data.productReceive.createdAt,
                              ),
                            ),
                            TColumn(
                              title: 'release_by_id'.tr(),
                              builder: (data, index) {
                                return data.releaseById != null
                                    ? users
                                            .find(data.releaseById.toString())
                                            ?.name ??
                                        ''
                                    : '-';
                              },
                            ),
                            TColumn(
                              title: 'release_date'.tr(),
                              builder: (data, index) => data.releaseAt != null
                                  ? data.releaseAt!.yyyyMMdd
                                  : '-',
                            ),
                            TColumn(
                              title: 'release_period'.tr(),
                              builder: (data, index) => data.releaseAt != null
                                  ? data.releaseAt!.yyyyMMdd
                                  : '-',
                            ),
                            TColumn(
                              title: 'product_id'.tr(),
                              builder: (data, index) => data.product.id,
                            ),
                            TColumn(
                              title: 'product_name'.tr(),
                              builder: (data, index) => data.product.name,
                            ),
                            TColumn(
                              title: 'production_order'.tr(),
                              builder: (data, index) => data.productionOrder.id,
                            ),
                            TColumn(
                              title: 'production_order_period'.tr(),
                              builder: (data, index) {
                                return data.productionOrder.createdAt.yyyyMMdd;
                              },
                            ),
                            TColumn(
                              title: 'quantity'.tr(),
                              builder: (data, index) =>
                                  data.quantity.toString(),
                              numeric: true,
                            ),
                            TColumn(
                              title: 'unit'.tr(),
                              builder: (data, index) => data.unit.id,
                            ),
                            TColumn(
                              title: 'expired_date'.tr(),
                              builder: (data, index) =>
                                  data.expiredDate.yyyyMMdd,
                            ),
                            TColumn(
                              title: 'purchase_order_id'.tr(),
                              builder: (data, index) {
                                return data.productReceive.purchaseOrder.id !=
                                        ''
                                    ? data.productReceive.purchaseOrder.id
                                    : '-';
                              },
                            ),
                            TColumn(
                              title: 'transaksi_type_id'.tr(),
                              builder: (data, index) {
                                return data.productReceive.transactionType.id !=
                                        ''
                                    ? data.productReceive.transactionType.id
                                    : '-';
                              },
                            ),
                          ],
                        );
                        saveFile(bytes, 'report_product_receive.xlsx');
                      },
                    );
                  },
                  child: BlocBuilder<ProductReceiveDetailQueryBloc,
                      ProductReceiveDetailQueryState>(
                    bloc: queryBloc,
                    builder: (context, state) {
                      return LightButtonSmall(
                        action: DataAction.exportExcel,
                        permission: null,
                        status: state.maybeWhen(
                          loading: (_) => Status.progress,
                          orElse: () => null,
                        ),
                        onPressed: () async {
                          if (_startDate != null &&
                              _endDate != null &&
                              _product != null &&
                              _listWarehouse.isNotEmpty) {
                            queryBloc.add(
                              ProductReceiveDetailQueryEvent.print(
                                pageOptions: PageOptions.emptyNoLimit(),
                                warehouseIn: _listWarehouse,
                                product: _product,
                                createdAtGte: _startDate,
                                createdAtLte: _endDate,
                              ),
                            );
                          } else {
                            Toast(context).fail(
                              'You must insert the Date, Product & Warehouse',
                            );
                          }
                        },
                      );
                    },
                  ),
                );
              },
            ),
          ],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FieldDatePicker(
                labelText: 'Period Start',
                controller: _startDateController,
                onChanged: (value) {
                  _startDate = value;
                },
              ),
              const SizedBox(height: 12),
              FieldDatePicker(
                labelText: 'Period End',
                controller: _endDateController,
                onChanged: (value) {
                  _endDate = value;
                },
              ),
              const SizedBox(height: 12),
              FDropDownSearchMultiple<Warehouse>(
                validator: _requiredObjectValidator.call,
                labelText: 'warehouse'.tr(),
                onChanged: (listWarehouse) => _listWarehouse = listWarehouse,
                itemAsString: (warehouse) => warehouse.id,
                selectedItems: _listWarehouse,
                dropdownBuilder: (context, selectedItems) {
                  final theme = Theme.of(context);
                  return Wrap(
                    spacing: 10,
                    children: selectedItems.map((e) {
                      return Container(
                        decoration: BoxDecoration(
                          color: theme.colorScheme.primary.lighten(.33),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        margin: const EdgeInsets.only(top: 8),
                        padding: const EdgeInsets.only(left: 12),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              e.id,
                              style: TextStyle(
                                color: theme.colorScheme.primary,
                              ),
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.close,
                                color: theme.colorScheme.primary,
                              ),
                              onPressed: () {
                                setState(() {
                                  selectedItems.remove(e);
                                  _listWarehouse.remove(e);
                                });
                              },
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  );
                },
                status: Status.loaded,
                items: Warehouse.products,
              ),
              const SizedBox(height: 12),
              BlocBuilder<ProductQueryBloc, ProductQueryState>(
                bloc: productBloc,
                builder: (context, state) {
                  return FDropDownSearch<Product>(
                    labelText: 'product'.tr(),
                    itemAsString: (product) => product.name,
                    items: state.maybeWhen(
                      orElse: () => [],
                      loaded: (pageOptions) => pageOptions.data,
                    ),
                    status: state.maybeWhen(
                      orElse: () => Status.error,
                      loading: (_) => Status.progress,
                      loaded: (_) => Status.loaded,
                    ),
                    onChanged: (product) async {
                      if (product != null) {
                        _product = product;
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
