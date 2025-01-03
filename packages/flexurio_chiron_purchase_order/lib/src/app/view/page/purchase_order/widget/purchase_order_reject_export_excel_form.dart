import 'package:appointment/src/app/util/picker_file.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_purchase_order/src/app/bloc/purchase_order_reject_query/purchase_order_reject_query_bloc.dart';
import 'package:flexurio_chiron_purchase_order/src/app/model/purchase_order_reject.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class PurchaseOrderRejectExportExcelForm extends StatefulWidget {
  const PurchaseOrderRejectExportExcelForm._();

  static Widget prepare() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => PurchaseOrderRejectQueryBloc()),
      ],
      child: const PurchaseOrderRejectExportExcelForm._(),
    );
  }

  @override
  State<PurchaseOrderRejectExportExcelForm> createState() =>
      _PurchaseOrderRejectExportExcelFormState();
}

class _PurchaseOrderRejectExportExcelFormState
    extends State<PurchaseOrderRejectExportExcelForm> {
  final _formKey = GlobalKey<FormState>();

  DateTime? _startDate;
  DateTime? _endDate;

  final _startDateController = TextEditingController();
  final _endDateController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  void _submit(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.read<PurchaseOrderRejectQueryBloc>().add(
            PurchaseOrderRejectQueryEvent.fetch(
              pageOptions: PageOptions.emptyNoLimit(),
              startDate: _startDate,
              endDate: _endDate,
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    const action = DataAction.exportExcel;

    return BlocListener<PurchaseOrderRejectQueryBloc,
        PurchaseOrderRejectQueryState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          loaded: (pageOptions) async {
            final bytes = simpleExcel<PurchaseOrderReject>(
              context: context,
              data: pageOptions.data,
              columns: [
                TColumn(
                  title: 'created_at'.tr(),
                  builder: (data, index) => data.createdAt.yMMMdHm,
                ),
                TColumn(
                  title: 'material_request_old'.tr(),
                  builder: (data, index) => data.materialRequestOld,
                ),
                TColumn(
                  title: 'purchase_order_old'.tr(),
                  builder: (data, index) => data.purchaseOrderOld,
                ),
                TColumn(
                  title: 'purchase_order_new'.tr(),
                  builder: (data, index) => data.purchaseOrderNew,
                ),
                TColumn(
                  title: 'date_of_need'.tr(),
                  builder: (data, index) => data.dateOfNeed.yMMMd,
                ),
                TColumn(
                  title: 'material_name'.tr(),
                  builder: (data, index) => data.materialName,
                ),
                TColumn(
                  title: 'product_name'.tr(),
                  builder: (data, index) => data.productName,
                ),
                TColumn(
                  numeric: true,
                  title: 'quantity'.tr(),
                  builder: (data, index) => data.quantity.toString(),
                ),
                TColumn(
                  numeric: true,
                  title: 'price'.tr(),
                  builder: (data, index) => data.price.format(),
                ),
              ],
            );
            saveFile(bytes, 'Purchase-Order-Reject.xlsx');
            Navigator.pop(context);
          },
        );
      },
      child: CardForm(
        popup: true,
        title: '${action.title} ${'purchase_order_reject'.tr()}',
        icon: action.icon,
        actions: [
          Button(
            permission: null,
            isSecondary: true,
            onPressed: () => Navigator.pop(context),
            action: DataAction.cancel,
          ),
          const Gap(12),
          BlocBuilder<PurchaseOrderRejectQueryBloc,
              PurchaseOrderRejectQueryState>(
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
            ],
          ),
        ),
      ),
    );
  }
}
