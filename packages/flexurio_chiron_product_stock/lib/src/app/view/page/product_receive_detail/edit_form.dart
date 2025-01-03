import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_product_stock/src/app/bloc/product_receive/product_receive_bloc.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/product_receive_detail.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class ProductReceiveHeaderEditPageX extends StatefulWidget {
  const ProductReceiveHeaderEditPageX({
    required this.productReceiveDetail,
    super.key,
    required this.isExternal,
  });
  final bool isExternal;

  static Widget prepare({
    required ProductReceiveDetail productReceiveDetail,
    required bool isExternal,
  }) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductReceiveBloc(isExternal: isExternal)
            ..add(
              ProductReceiveEvent.initialize(
                productReceiveDetail.productReceive,
              ),
            ),
        ),
      ],
      child: ProductReceiveHeaderEditPageX(
        productReceiveDetail: productReceiveDetail,
        isExternal: isExternal,
      ),
    );
  }

  final ProductReceiveDetail productReceiveDetail;

  @override
  State<ProductReceiveHeaderEditPageX> createState() =>
      _ProductReceiveDetailCreateState();
}

class _ProductReceiveDetailCreateState
    extends State<ProductReceiveHeaderEditPageX> {
  final _formKey = GlobalKey<FormState>();
  final _deliveryOrderDateController = TextEditingController();
  final _deliveryOrderIdController = TextEditingController();
  final _descriptionController = TextEditingController();

  final _action = DataAction.edit;
  DateTime? _deliveryOrderDate;

  @override
  void initState() {
    super.initState();
    if (widget.productReceiveDetail.productReceive.deliveryOrderId != null) {
      _deliveryOrderIdController.text =
          widget.productReceiveDetail.productReceive.deliveryOrderId!;
    }
    if (widget.productReceiveDetail.productReceive.deliveryOrderDate != null) {
      _deliveryOrderDateController.text = widget
          .productReceiveDetail.productReceive.deliveryOrderDate!.ddMMyyyy;
      _deliveryOrderDate =
          widget.productReceiveDetail.productReceive.deliveryOrderDate;
    }
    _descriptionController.text =
        widget.productReceiveDetail.productReceive.description;
  }

  void _submit(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.read<ProductReceiveBloc>().add(
            ProductReceiveEvent.productReceiveHeaderEdit(
              productReceive: widget.productReceiveDetail.productReceive,
              deliveryOrder: _deliveryOrderIdController.text,
              deliveryOrderDate: _deliveryOrderDate,
              description: _descriptionController.text,
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleFormPanel(
      visibleBackButton: false,
      actions: [
        Button(
          permission: null,
          isSecondary: true,
          action: DataAction.cancel,
          onPressed: () => Navigator.pop(context),
        ),
        const SizedBox(width: 12),
        BlocListener<ProductReceiveBloc, ProductReceiveState>(
          listener: (context, state) {
            state.maybeWhen(
              success: () {
                Toast(context).dataChanged(_action, Entity.productReceive);
                Navigator.pop(context, true);
              },
              error: (error) => Toast(context).fail(error),
              orElse: () {},
            );
          },
          child: BlocBuilder<ProductReceiveBloc, ProductReceiveState>(
            builder: (context, state) {
              return Button(
                permission: null,
                onPressed: () => _submit(context),
                action: _action,
              );
            },
          ),
        ),
      ],
      formKey: _formKey,
      action: _action,
      entity: Entity.productReceive,
      children: [
        RowFields(
          children: [
            FTextFormField(
              labelText: 'delivery_order'.tr(),
              controller: _deliveryOrderIdController,
            ),
            FieldDatePicker(
              labelText: 'delivery_order_date'.tr(),
              initialSelectedDate: _deliveryOrderDate,
              controller: _deliveryOrderDateController,
              validator: requiredObjectValidator.call,
              onChanged: (value) => _deliveryOrderDate = value,
            ),
          ],
        ),
        Gap(24),
        FTextFormField(
          controller: _descriptionController,
          validator: requiredValidator.call,
          labelText: 'description'.tr(),
          maxLines: 4,
        )
      ],
    );
  }
}
