import 'package:flexurio_chiron_product_stock/src/app/bloc/product_issue/product_issue_bloc.dart';
import 'package:flexurio_chiron_product_stock/src/app/bloc/product_issue_query/product_issue_query_bloc.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/product_issue.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';

class ProductIssueDeliveryPage extends StatefulWidget {
  const ProductIssueDeliveryPage({
    required this.productIssue,
    super.key,
  });

  final ProductIssue productIssue;

  static Route<bool?> route({
    required ProductIssue productIssue,
  }) {
    return PageTransition(
      opaque: true,
      type: PageTransitionType.rightToLeft,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ProductIssueBloc(),
          ),
          BlocProvider(
            create: (context) => ProductIssueQueryBloc()
              ..add(const ProductIssueQueryEvent.fetch()),
          ),
        ],
        child: ProductIssueDeliveryPage(
          productIssue: productIssue,
        ),
      ),
    );
  }

  @override
  State<ProductIssueDeliveryPage> createState() =>
      _ProductIssueDeliveryPageState();
}

class _ProductIssueDeliveryPageState extends State<ProductIssueDeliveryPage> {
  final _formKey = GlobalKey<FormState>();
  final _deliveryIdController = TextEditingController();

  DateTime? _deliveryOrderDate;
  DateTime? _salesOrderReceiveDate;

  late DataAction _action;

  @override
  void initState() {
    super.initState();

    _action = createOrEdit(widget.productIssue);

    if (_action.isEdit) {
      _deliveryIdController.text = widget.productIssue.deliveryOrderId;
      _deliveryOrderDate = widget.productIssue.deliveryOrderDate;
    }
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      context.read<ProductIssueBloc>().add(
            ProductIssueEvent.delivery(
              id: widget.productIssue,
              deliveryOrderDate: _deliveryOrderDate!,
              salesOrderReceiveDate: _salesOrderReceiveDate!,
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    const action = DataAction.delivery;
    final entity = Entity.productIssue;

    return BlocListener<ProductIssueBloc, ProductIssueState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          error: (error) => Toast(context).fail(error),
          success: () {
            Toast(context).dataChanged(action, entity);
            Navigator.pop(context, true);
          },
        );
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleFormPanel(
          formKey: _formKey,
          action: action,
          entity: entity,
          actions: [
            BlocBuilder<ProductIssueBloc, ProductIssueState>(
              builder: (context, state) {
                return Button(
                  permission: null,
                  action: action,
                  isInProgress: state.maybeWhen(
                    loading: () => true,
                    orElse: () => false,
                  ),
                  onPressed: _submit,
                );
              },
            ),
          ],
          children: [
            FTextFormField(
              enabled: _action.isCreate,
              labelText: 'Delivery Order',
              controller: _deliveryIdController,
              validator: requiredValidator.call,
            ),
            const SizedBox(height: 24),
            FieldDatePicker(
              labelText: 'delivery_order_date'.tr(),
              initialSelectedDate: _deliveryOrderDate,
              controller: TextEditingController(),
              onChanged: (value) => _deliveryOrderDate = value,
            ),
            const SizedBox(height: 24),
            FieldDatePicker(
              labelText: 'Sales Order Delivery Date',
              initialSelectedDate: _salesOrderReceiveDate,
              controller: TextEditingController(),
              onChanged: (value) => _salesOrderReceiveDate = value,
            ),
          ],
        ),
      ),
    );
  }
}
