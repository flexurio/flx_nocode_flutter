import 'package:appointment/src/app/util/picker_file.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/product.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_product/flexurio_chiron_product.dart';
import 'package:flexurio_chiron_product_stock/src/app/bloc/product_return_recap_disposition_query/product_return_disposition_query_bloc.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/product_return_check.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/product_return_recep_disposition.dart';
import 'package:flexurio_chiron_product_stock/src/app/view/widget/drop_down_items/product_return_check_status.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class RecapDispositionExportExcelForm extends StatefulWidget {
  const RecapDispositionExportExcelForm._();

  static Widget prepare() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductReturnRecapDispositionQueryBloc(),
        ),
        BlocProvider(
          create: (context) => ProductQueryBloc(isExternal: false)
            ..add(
              ProductQueryEvent.fetch(
                pageOptions: PageOptions.emptyNoLimit(),
              ),
            ),
        ),
      ],
      child: const RecapDispositionExportExcelForm._(),
    );
  }

  @override
  State<RecapDispositionExportExcelForm> createState() =>
      _RecapDispositionExportExcelFormState();
}

class _RecapDispositionExportExcelFormState
    extends State<RecapDispositionExportExcelForm> {
  final _formKey = GlobalKey<FormState>();
  Product? _product;
  ProductReturnCheckStatus? _status;
  DateTime? _startDate;
  DateTime? _endDate;

  final _startDateController = TextEditingController();
  final _endDateController = TextEditingController();

  void _submit(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.read<ProductReturnRecapDispositionQueryBloc>().add(
            ProductReturnRecapDispositionQueryEvent.fetch(
              pageOptions: PageOptions.emptyNoLimit(),
              productId: _product?.id,
              status: _status,
              createdAtStart: _startDate,
              createdAtEnd: _endDate,
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    const action = DataAction.exportExcel;
    final entity = Entity.productReturn;

    return BlocListener<ProductReturnRecapDispositionQueryBloc,
        ProductReturnRecapDispositionQueryState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          loaded: (pageOptions) {
            final bytes = simpleExcel<ProductReturnRecapDisposition>(
              context: context,
              data: pageOptions.data,
              columns: [
                TColumn(
                  title: 'id'.tr(),
                  builder: (data, index) => data.id.toString(),
                ),
                TColumn(
                  title: 'delivery_order'.tr(),
                  builder: (data, index) => data.deliveryOrderId,
                ),
                TColumn(
                  title: 'period'.tr(),
                  builder: (data, index) => data.createdAt.yMMMM,
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
                  numeric: true,
                  title: 'quantity'.tr(),
                  builder: (data, index) => data.quantity.toString(),
                ),
                TColumn(
                  title: 'status'.tr(),
                  builder: (data, index) => data.status,
                ),
                TColumn(
                  title: 'quality_assurance_checked_at'.tr(),
                  builder: (data, index) =>
                      data.qualityAssuranceCheckDate.yMMMdHm,
                ),
                TColumn(
                  title: 'created_at'.tr(),
                  builder: (data, index) => data.createdAt.yMMMdHm,
                ),
              ],
            );
            saveFile(
              bytes,
              'Product-Return-Recap-Disposition-${flavorConfig.companyName}.xlsx',
            );
            Navigator.pop(context);
          },
        );
      },
      child: CardForm(
        popup: true,
        title: '${action.title} ${entity.title}',
        icon: action.icon,
        actions: [
          Button(
            permission: null,
            isSecondary: true,
            onPressed: () => Navigator.pop(context),
            action: DataAction.cancel,
          ),
          const Gap(12),
          BlocBuilder<ProductReturnRecapDispositionQueryBloc,
              ProductReturnRecapDispositionQueryState>(
            builder: (context, state) {
              return Button(
                permission: null,
                isInProgress: state.maybeWhen(
                  orElse: () => false,
                  loading: (_) => true,
                ),
                onPressed: () => _submit(context),
                action: action,
              );
            },
          ),
        ],
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RowFields(
                children: [
                  FieldDatePicker(
                    validator: requiredObjectValidator.call,
                    labelText: 'start_date'.tr(),
                    onChanged: (value) {
                      _startDate = value;
                    },
                    initialSelectedDate: _startDate,
                    controller: _startDateController,
                  ),
                  FieldDatePicker(
                    validator: requiredObjectValidator.call,
                    labelText: 'end_date'.tr(),
                    onChanged: (value) {
                      _endDate = value;
                    },
                    initialSelectedDate: _endDate,
                    controller: _endDateController,
                  ),
                ],
              ),
              const Gap(24),
              FDropDownSearchProduct(
                isRequired: false,
                onChanged: (product) {
                  if (product != null) {
                    _product = product;
                  }
                },
              ),
              const Gap(24),
              FDropDownSearchProductReturnCheckStatus(
                isRequired: false,
                onChanged: (status) {
                  _status = status;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
