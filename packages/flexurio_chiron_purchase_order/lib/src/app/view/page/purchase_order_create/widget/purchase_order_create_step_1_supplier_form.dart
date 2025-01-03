import 'package:flexurio_chiron_finance/src/app/bloc/currency_query/currency_query_bloc.dart';
import 'package:flexurio_chiron_purchase_request/src/app/bloc/material_request_detail_query/material_request_detail_query_bloc.dart';
import 'package:flexurio_chiron_purchase_request/src/app/bloc/material_request_query/material_request_query_bloc.dart';
import 'package:flexurio_chiron_finance/src/app/model/currency.dart';
import 'package:flexurio_chiron_purchase_request/src/app/model/material_request_detail.dart';
import 'package:flexurio_chiron_purchase_request/src/app/model/purchase_request.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/currency.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/material_request.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/supplier.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_purchase_order/src/app/bloc/purchase_order/purchase_order_bloc.dart';
import 'package:flexurio_chiron_purchase_order/src/app/model/purchase_order.dart';
import 'package:flexurio_chiron_vendor/flexurio_chiron_vendor.dart';
import 'package:flexurio_chiron_material/flexurio_chiron_material.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/material_group.dart';

class PurchaseOrderCreateSupplierForm extends StatefulWidget {
  const PurchaseOrderCreateSupplierForm._({
    required this.onNext,
    this.purchaseOrder,
  });

  final PurchaseOrder? purchaseOrder;
  final void Function() onNext;

  static Widget prepare({
    required void Function() onNext,
    PurchaseOrder? purchaseOrder,
  }) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PurchaseRequestQueryBloc(),
        ),
        BlocProvider(
          create: (context) => MaterialGroupQueryBloc()
            ..add(MaterialGroupQueryEvent.fetch(
              pageOptions: PageOptions.emptyNoLimit(),
            )),
        ),
        BlocProvider(
          create: (context) =>
              CurrencyQueryBloc()..add(const CurrencyQueryEvent.fetch()),
        ),
        BlocProvider(
          create: (context) => SupplierQueryBloc(),
        ),
      ],
      child: PurchaseOrderCreateSupplierForm._(
        purchaseOrder: purchaseOrder,
        onNext: onNext,
      ),
    );
  }

  @override
  State<PurchaseOrderCreateSupplierForm> createState() =>
      _PurchaseOrderCreateSupplierFormState();
}

class _PurchaseOrderCreateSupplierFormState
    extends State<PurchaseOrderCreateSupplierForm> {
  final _formKey = GlobalKey<FormState>();
  final _quotationNoController = TextEditingController();
  final _deliveryDateController = TextEditingController();

  MaterialRequest? _materialRequest;
  Supplier? _supplier;
  Currency? _currency;
  DateTime? _deliveryDate;
  MaterialGroup? _materialGroup;
  late DataAction _action;

  @override
  void initState() {
    super.initState();
    _action = createOrEdit(widget.purchaseOrder);
    if (_action.isEdit) {
      _materialGroup = widget.purchaseOrder!.materialGroup;
      _materialRequest = widget.purchaseOrder!.materialRequest;
      _supplier = widget.purchaseOrder!.supplier;
      _currency = widget.purchaseOrder!.currency;
      _deliveryDate = widget.purchaseOrder!.deliveryDate;
      _quotationNoController.text = widget.purchaseOrder!.quotationNo;
      _fetchSupplier();
    }
  }

  void _fetchPurchaseRequest() {
    if (_materialGroup == null) return;
    context.read<PurchaseRequestQueryBloc>().add(
          PurchaseRequestQueryEvent.fetch(
            status: PurchaseRequestStatus.inProgress,
            isOrder: true,
            isRequestForm: false,
            pageOptions: PageOptions.emptyNoLimit(),
            materialGroupIdIn: [_materialGroup!],
          ),
        );
    setState(() {});
  }

  void _fetchSupplier() {
    if (_materialRequest != null && _materialGroup != null) {
      if (_materialGroup!.hasVendor && _materialRequest!.vendor != null) {
        context.read<SupplierQueryBloc>().add(
              SupplierQueryEvent.fetchFromMaterialPurchaseRequest(
                purchaseRequestId: _materialRequest!.id,
                vendorId: _materialRequest!.vendor!.id,
              ),
            );
      } else {
        context.read<SupplierQueryBloc>().add(
              SupplierQueryEvent.fetch(
                pageOptions: PageOptions.emptyNoLimit(),
              ),
            );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return FormAction(
      formKey: _formKey,
      actions: [_buildButtonSubmit()],
      children: [
        if (_action.isCreate)
          Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: RowFields(children: [
              _buildFieldMaterialGroup(),
              _buildFieldPurchaseRequest(),
            ]),
          ),
        RowFields(
          children: [
            _buildFieldSupplier(),
            _buildFieldDeliveryDate(),
          ],
        ),
        const Gap(24),
        RowFields(
          children: [
            FDropDownSearchCurrency(
              initialValue: _currency,
              onChanged: (currency) {
                if (currency != null) {
                  _currency = currency;
                }
              },
            ),
            FTextFormField(
              controller: _quotationNoController,
              validator: requiredValidator.call,
              labelText: 'Quotation No.',
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildFieldDeliveryDate() {
    return FieldDatePicker(
      labelText: 'delivery_date'.tr(),
      initialSelectedDate: _deliveryDate,
      controller: _deliveryDateController,
      validator: requiredObjectValidator.call,
      onChanged: (value) => _deliveryDate = value,
      minDate: DateTime.now().add(const Duration(days: 1)),
    );
  }

  Widget _buildFieldSupplier() {
    return FDropDownSearchSupplier(
      key: ValueKey(
          (_materialRequest?.id).toString() + (_materialGroup?.id).toString()),
      initialValue: _supplier,
      onChanged: (supplier) {
        if (supplier != null) {
          _supplier = supplier;
        }
      },
    );
  }

  Widget _buildButtonSubmit() {
    late Widget submitButton;
    if (_action.isEdit) {
      submitButton = BlocListener<PurchaseOrderBloc, PurchaseOrderState>(
        listener: (context, state) {
          state.maybeWhen(
            success: () {
              Toast(context).dataChanged(_action, Entity.purchaseOrder);
            },
            error: (error) => Toast(context).fail(error),
            orElse: () {},
          );
        },
        child: BlocBuilder<PurchaseOrderBloc, PurchaseOrderState>(
          builder: (context, state) {
            return Button(
              permission: null,
              action: DataAction.edit,
              isInProgress: state.maybeWhen(
                orElse: () => false,
                loading: () => true,
              ),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  context.read<PurchaseOrderBloc>().add(
                        PurchaseOrderEvent.editFormSupplier(
                          widget.purchaseOrder!,
                          PurchaseOrderFormSupplier(
                            materialRequest: _materialRequest!,
                            supplier: _supplier!,
                            currency: _currency!,
                            quotationNo: _quotationNoController.text,
                            deliveryDate: _deliveryDate!,
                            revisionNo: widget.purchaseOrder!.revisionNo,
                          ),
                        ),
                      );
                }
              },
            );
          },
        ),
      );
    } else {
      submitButton = Button(
        permission: null,
        action: DataAction.next,
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            context.read<PurchaseOrderBloc>().add(
                  PurchaseOrderEvent.createFormSupplier(
                    PurchaseOrderFormSupplier(
                      materialRequest: _materialRequest!,
                      supplier: _supplier!,
                      currency: _currency!,
                      quotationNo: _quotationNoController.text,
                      deliveryDate: _deliveryDate!,
                      revisionNo: 0,
                    ),
                  ),
                );
            context.read<MaterialRequestDetailQueryBloc>().add(
                  MaterialRequestDetailQueryEvent.fetch(
                    materialRequest: _materialRequest!,
                    status: PurchaseRequestDetailStatus.confirm,
                  ),
                );
            widget.onNext();
          }
        },
      );
    }
    return submitButton;
  }

  Widget _buildFieldMaterialGroup() {
    return FDropDownSearchMaterialGroup(
      onChanged: (materialGroup) {
        if (materialGroup != null) {
          _materialGroup = materialGroup;
          _supplier = null;
          _materialRequest = null;
          _fetchPurchaseRequest();
        }
      },
    );
  }

  Widget _buildFieldPurchaseRequest() {
    return FDropDownSearchMaterialRequest(
      key: ValueKey(_materialGroup?.id),
      onChanged: (materialRequest) {
        if (materialRequest != null) {
          _materialRequest = materialRequest;
          _supplier = null;
          _fetchSupplier();
        }
      },
    );
  }
}
