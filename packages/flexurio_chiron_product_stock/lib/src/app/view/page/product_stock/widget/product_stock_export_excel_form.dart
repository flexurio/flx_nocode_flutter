import 'package:appointment/src/app/util/picker_file.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/product.dart';
import 'package:appointment/src/app/view/widget/select_field_chip.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_product/flexurio_chiron_product.dart';
import 'package:flexurio_chiron_product_stock/src/app/bloc/product_stock_query/product_stock_query_bloc.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/product_stock.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/recap_product_expenditure.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class ProductStockWarehouseExportExcelForm extends StatefulWidget {
  const ProductStockWarehouseExportExcelForm._();

  static Widget prepare() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductStockQueryBloc(),
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
      child: const ProductStockWarehouseExportExcelForm._(),
    );
  }

  @override
  State<ProductStockWarehouseExportExcelForm> createState() =>
      _ProductStockWarehouseExportExcelFormState();
}

class _ProductStockWarehouseExportExcelFormState
    extends State<ProductStockWarehouseExportExcelForm> {
  final _formKey = GlobalKey<FormState>();
  Product? _product;
  final TextEditingController _divisionController = TextEditingController();
  Division? _division;

  void _submit(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.read<ProductStockQueryBloc>().add(
            ProductStockQueryEvent.fetch(
              productId: _product?.id,
              period: DateTime.now(),
              endingBalance: 0,
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    const action = DataAction.exportExcel;
    final entity = Entity.productReturn;

    return BlocListener<ProductStockQueryBloc, ProductStockQueryState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          loaded: (data) {
            final bytes = simpleExcel<ProductStock>(
              context: context,
              data: data,
              columns: [
                TColumn(
                  title: 'batch_no_id'.tr(),
                  builder: (data, index) => data.batch.id,
                ),
                TColumn(
                  title: 'product_name'.tr(),
                  builder: (data, index) => data.product.name,
                ),
                TColumn(
                  title: 'expired_date'.tr(),
                  builder: (data, index) => data.expiredDate.yMMMd,
                ),
                TColumn(
                  title: 'quantity_in'.tr(),
                  builder: (data, index) => data.qtyIn.toString(),
                ),
                TColumn(
                  title: 'quantity_out'.tr(),
                  builder: (data, index) => data.qtyOut.toString(),
                ),
                TColumn(
                  title: 'quantity_out_marketing'.tr(),
                  builder: (data, index) => data.qtyOutMarketing.toString(),
                ),
                TColumn(
                  title: 'warehouse'.tr(),
                  builder: (data, index) => data.warehouse ?? '',
                ),
              ],
            );
            saveFile(bytes, 'Product-Stock-Warehouse-$_division.xlsx');
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
          BlocBuilder<ProductStockQueryBloc, ProductStockQueryState>(
            builder: (context, state) {
              return Button(
                permission: null,
                isInProgress: state.maybeWhen(
                  orElse: () => false,
                  loading: () => true,
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
              FDropDownSearchProduct(
                isRequired: false,
                onChanged: (product) {
                  if (product != null) {
                    _product = product;
                  }
                },
              ),
              const Gap(12),
              SelectChipField<Division>(
                label: 'division'.tr(),
                getLabel: (ppn) => ppn.label,
                controller: _divisionController,
                validator: requiredValidator.call,
                options: Division.list,
                onChanged: (value) {
                  _division = value;
                  _divisionController.text = value.label;
                  // setState(() {});
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
