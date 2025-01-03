import 'package:flexurio_chiron_company/flexurio_chiron_company.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_product_stock/src/app/bloc/product_receive/product_receive_bloc.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/product_receive_detail.dart';
import 'package:flexurio_chiron_vendor/flexurio_chiron_vendor.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductReceiveEditForm extends StatefulWidget {
  const ProductReceiveEditForm({
    required this.onNext,
    required this.onPrevious,
    required this.productReceiveDetail,
    super.key,
  });

  final void Function() onNext;
  final void Function() onPrevious;
  final ProductReceiveDetail productReceiveDetail;

  static Widget prepare({
    required void Function() onNext,
    required void Function() onPrevious,
    required ProductReceiveDetail productReceiveDetail,
  }) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => DepartmentQueryBloc()
            ..add(
              DepartmentQueryEvent.fetch(
                pageOptions: PageOptions.emptyNoLimit(),
              ),
            ),
        ),
        BlocProvider(
          create: (context) => SupplierQueryBloc()
            ..add(
              SupplierQueryEvent.fetch(
                pageOptions: PageOptions.emptyNoLimit(),
              ),
            ),
        ),
      ],
      child: ProductReceiveEditForm(
        onPrevious: onPrevious,
        onNext: onNext,
        productReceiveDetail: productReceiveDetail,
      ),
    );
  }

  @override
  State<ProductReceiveEditForm> createState() => _ProductReceiveEditFormState();
}

class _ProductReceiveEditFormState extends State<ProductReceiveEditForm> {
  final _formKey = GlobalKey<FormState>();
  final _deliveryOrderDateController = TextEditingController();
  final _deliveryOrderIdController = TextEditingController();

  final DataAction _action = DataAction.edit;
  DateTime? _deliveryOrderDate;

  @override
  void initState() {
    super.initState();
    _deliveryOrderIdController.text =
        widget.productReceiveDetail.productReceive.deliveryOrderId.toString();
    _deliveryOrderDate =
        widget.productReceiveDetail.productReceive.deliveryOrderDate;
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      // context.read<ProductReceiveBloc>().add(
      //   ProductReceiveEvent.productReceiveHeaderEdit(
      //     productReceiveId: widget.productReceiveDetail.productReceive.id,
      //     deliveryOrderId: _deliveryOrderIdController.text,
      //     deliveryOrderDate: _deliveryOrderDate,
      //   ),
      // );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductReceiveBloc, ProductReceiveState>(
      builder: (context, state) {
        return state.maybeWhen(
          initial: (materialReceiveDetail, createFormMaterialReceive) {
            return FormAction(
              formKey: _formKey,
              actions: [
                Button(
                  permission: null,
                  isSecondary: true,
                  action: DataAction.back,
                  onPressed: () => widget.onPrevious(),
                ),
                const SizedBox(width: 12),
                _buildEditButton(),
              ],
              children: _buildEditFields,
            );
          },
          orElse: Container.new,
        );
      },
    );
  }

  Widget _buildEditButton() {
    return BlocListener<ProductReceiveBloc, ProductReceiveState>(
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
            isInProgress: state.maybeWhen(
              orElse: () => false,
              loading: () => true,
            ),
            action: DataAction.edit,
            onPressed: _submit,
          );
        },
      ),
    );
  }

  List<Widget> get _buildEditFields {
    return [
      RowFields(
        children: [
          FTextFormField(
            enabled: _action.isCreate,
            labelText: 'delivery_order'.tr(),
            controller: _deliveryOrderIdController,
            validator: requiredValidator.call,
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
    ];
  }
}
