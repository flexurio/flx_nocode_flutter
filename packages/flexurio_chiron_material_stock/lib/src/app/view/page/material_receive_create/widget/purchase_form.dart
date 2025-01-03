import 'package:flexurio_chiron_company/flexurio_chiron_company.dart';
import 'package:flexurio_chiron_material_stock/src/app/bloc/material_receive/material_receive_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/bloc/transaction_type_query/transaction_type_query_bloc.dart';
import 'package:flexurio_chiron_material_stock/src/app/model/entity.dart';
import 'package:flexurio_chiron_material_stock/src/app/model/material_receive.dart';
import 'package:flexurio_chiron_accounting/src/app/model/transaction_type.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/department.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/material_group.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/purchase_order.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/vendor.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_material/src/app/bloc/material_group_query/material_group_query_bloc.dart';
import 'package:flexurio_chiron_material/src/app/model/material_group.dart';
import 'package:flexurio_chiron_purchase_order/flexurio_chiron_purchase_order.dart';
import 'package:flexurio_chiron_vendor/flexurio_chiron_vendor.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class MaterialReceiveCreatePurchaseForm extends StatefulWidget {
  const MaterialReceiveCreatePurchaseForm({
    required this.onNext,
    required this.onPrevious,
    required this.onMaterialGroupSelected,
    required this.type,
    super.key,
    this.materialReceive,
  });

  final void Function() onNext;
  final void Function() onPrevious;
  final MaterialReceive? materialReceive;
  final void Function(bool) onMaterialGroupSelected;
  final MaterialReceiveType type;

  static Widget prepare({
    required void Function() onNext,
    required void Function() onPrevious,
    required void Function(bool) onMaterialGroupSelected,
    required MaterialReceiveType type,
    MaterialReceive? materialReceive,
  }) {
    return MultiBlocProvider(
      key: ValueKey(type),
      providers: [
        BlocProvider(
          create: (context) => TransactionTypeQueryBloc()
            ..add(
              TransactionTypeQueryEvent.fetch(
                pageOptions: PageOptions.emptyNoLimit(),
                value: type == MaterialReceiveType.purchaseOrder
                    ? "MaterialIn"
                    : "MaterialInNonPO",
              ),
            ),
        ),
        BlocProvider(create: (context) => PurchaseOrderQueryBloc()),
        BlocProvider(
          create: (context) => DepartmentQueryBloc()
            ..add(
              DepartmentQueryEvent.fetch(
                pageOptions: PageOptions.emptyNoLimit(),
              ),
            ),
        ),
        BlocProvider(
          create: (context) => VendorQueryBloc()
            ..add(
              VendorQueryEvent.fetch(
                pageOptions: PageOptions.emptyNoLimit(),
              ),
            ),
        ),
        BlocProvider(
          create: (context) => MaterialGroupQueryBloc()
            ..add(MaterialGroupQueryEvent.fetch(
              pageOptions: PageOptions.emptyNoLimit(),
            )),
        ),
      ],
      child: MaterialReceiveCreatePurchaseForm(
        onMaterialGroupSelected: onMaterialGroupSelected,
        onPrevious: onPrevious,
        onNext: onNext,
        materialReceive: materialReceive,
        type: type,
      ),
    );
  }

  @override
  State<MaterialReceiveCreatePurchaseForm> createState() =>
      _MaterialReceiveCreatePurchaseFormState();
}

class _MaterialReceiveCreatePurchaseFormState
    extends State<MaterialReceiveCreatePurchaseForm> {
  final _formKey = GlobalKey<FormState>();
  final _deliveryOrderDateController = TextEditingController();
  final _deliveryOrderIdController = TextEditingController();
  final _descriptionController = TextEditingController();

  late TransactionType _transactionType;
  PurchaseOrder? _purchaseOrder;
  Department? _department;
  Vendor? _vendor;
  MaterialGroup? _materialGroup;
  DateTime? _deliveryOrderDate;
  late DataAction _action;
  late WarehouseMaterialReceive _warehouse;

  @override
  void initState() {
    super.initState();
    _action = createOrEdit(widget.materialReceive);
    if (_action.isEdit) {
      _materialGroup = widget.materialReceive!.materialGroup;
      _transactionType = widget.materialReceive!.transactionType;
      _purchaseOrder = widget.materialReceive!.purchaseOrder;
      _warehouse = widget.materialReceive!.warehouse;
      _deliveryOrderIdController.text = widget.materialReceive!.deliveryOrderId;
      _deliveryOrderDate = widget.materialReceive!.deliveryOrderDate;
      _department = widget.materialReceive!.department;
      _descriptionController.text = widget.materialReceive!.description;
      _vendor = widget.materialReceive!.vendor;
    }
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      final form = MaterialReceiveCreateForm(
        transactionType: _transactionType,
        purchaseOrder: _purchaseOrder,
        warehouse: _warehouse.id,
        materialGroup: _materialGroup,
        deliveryOrderId: _deliveryOrderIdController.text,
        deliveryOrderDate: _deliveryOrderDate,
        description: _descriptionController.text,
        department: _department,
        vendor: _vendor,
      );
      if (_action.isCreate) {
        context.read<MaterialReceiveBloc>().add(
              MaterialReceiveEvent.createForm(form),
            );
      } else {
        context.read<MaterialReceiveBloc>().add(
              MaterialReceiveEvent.editForm(
                materialReceive: widget.materialReceive!,
                description: _descriptionController.text,
                warehouse: _warehouse,
                deliveryOrderNo: _deliveryOrderIdController.text,
                deliveryOrderDate: _deliveryOrderDate,
              ),
            );
      }
    }
  }

  List<DateTime> getLast6WorkingDays({required DateTime poDeliveryDate}) {
    List<DateTime> workingDays = [];
    DateTime currentDate = poDeliveryDate.subtract(Duration(days: 1));

    while (workingDays.length < 6) {
      if (currentDate.weekday >= DateTime.monday &&
          currentDate.weekday <= DateTime.friday) {
        workingDays.add(currentDate);
      }
      currentDate = currentDate.subtract(Duration(days: 1));
    }

    return workingDays;
  }

  @override
  Widget build(BuildContext context) {
    late Widget submitButton;
    if (_action.isCreate) {
      submitButton = BlocBuilder<MaterialReceiveBloc, MaterialReceiveState>(
        builder: (context, state) {
          return Button(
            permission: null,
            isInProgress: state.maybeWhen(
              orElse: () => false,
              loading: () => true,
            ),
            action: _action.isCreate ? DataAction.next : DataAction.edit,
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                final form = MaterialReceiveCreateForm(
                  transactionType: _transactionType,
                  purchaseOrder: _purchaseOrder,
                  warehouse: _warehouse.id,
                  materialGroup: _materialGroup,
                  deliveryOrderId: _deliveryOrderIdController.text,
                  deliveryOrderDate: _deliveryOrderDate,
                  description: _descriptionController.text,
                  department: _department,
                  vendor: _vendor,
                );
                if (_action.isCreate) {
                  context.read<MaterialReceiveBloc>().add(
                        MaterialReceiveEvent.createForm(form),
                      );
                  widget.onNext();
                } else {
                  context.read<MaterialReceiveBloc>().add(
                        MaterialReceiveEvent.editForm(
                          materialReceive: widget.materialReceive!,
                          description: _descriptionController.text,
                          warehouse: _warehouse,
                          deliveryOrderNo: _deliveryOrderIdController.text,
                          deliveryOrderDate: _deliveryOrderDate,
                        ),
                      );
                }
              }
            },
          );
        },
      );
    } else {
      submitButton = _buildEditButton();
    }

    return BlocBuilder<MaterialReceiveBloc, MaterialReceiveState>(
      builder: (context, state) {
        return state.maybeWhen(
          initial:
              (materialReceiveDetail, typeForm, createFormMaterialReceive) {
            if (typeForm == null) {
              return Container();
            }
            return FormAction(
              formKey: _formKey,
              actions: [
                if (_action.isCreate)
                  Button(
                    permission: null,
                    isSecondary: true,
                    action: DataAction.back,
                    onPressed: () => widget.onPrevious(),
                  ),
                const SizedBox(width: 12),
                submitButton,
              ],
              children: _action.isCreate
                  ? typeForm.type == MaterialReceiveType.purchaseOrder
                      ? _buildCreatePO()
                      : _buildCreateNonPO()
                  : _buildEditFields,
            );
          },
          orElse: Container.new,
        );
      },
    );
  }

  Widget _buildEditButton() {
    return BlocListener<MaterialReceiveBloc, MaterialReceiveState>(
      listener: (context, state) {
        state.maybeWhen(
          success: () {
            Toast(context)
                .dataChanged(_action, EntityMaterialStock.materialReceive);
            Navigator.pop(context, true);
          },
          error: (error) => Toast(context).fail(error),
          orElse: () {},
        );
      },
      child: _buildSubmitButton(),
    );
  }

  Widget _buildSubmitButton() {
    return BlocBuilder<MaterialReceiveBloc, MaterialReceiveState>(
      builder: (context, state) {
        return Button(
          permission: null,
          isInProgress: state.maybeWhen(
            orElse: () => false,
            loading: () => true,
          ),
          action: _action.isCreate ? DataAction.next : DataAction.edit,
          onPressed: _submit,
        );
      },
    );
  }

  List<Widget> _buildCreatePO() {
    return [
      RowFields(
        children: [
          BlocBuilder<TransactionTypeQueryBloc, TransactionTypeQueryState>(
            builder: (context, state) {
              return FDropDownSearch<TransactionType>(
                labelText: 'transaction_type'.tr(),
                initialValue: widget.materialReceive?.transactionType,
                itemAsString: (transaction) =>
                    '${transaction.id} - ${transaction.name}',
                items: state.maybeWhen(
                  orElse: () => [],
                  loaded: (transactionTypes) => transactionTypes.data,
                ),
                onChanged: (type) {
                  if (type != null) {
                    _transactionType = type;
                  }
                },
                status: state.maybeWhen(
                  error: (_) => Status.error,
                  loading: (_) => Status.progress,
                  orElse: () => Status.loaded,
                ),
              );
            },
          ),
          FDropDownSearchMaterialGroup(
            initialValue: widget.materialReceive?.materialGroup,
            onChanged: (materialGroup) {
              if (materialGroup != null) {
                _materialGroup = materialGroup;
                widget.onMaterialGroupSelected(
                  _materialGroup?.id == 'KEMASAN',
                );
                context.read<PurchaseOrderQueryBloc>().add(
                      PurchaseOrderQueryEvent.fetch(
                        status: [
                          PurchaseOrderStatus.accountingConfirm,
                          PurchaseOrderStatus.nextShipping,
                        ],
                        pageOptions: PageOptions.emptyNoLimit(),
                        materialGroupId: [
                          materialGroup.id,
                        ],
                      ),
                    );
              }
            },
          ),
        ],
      ),
      const Gap(24),
      RowFields(
        children: [
          FDropDownSearch<WarehouseMaterialReceive>(
            itemAsString: (warehouse) => warehouse.id,
            items: WarehouseMaterialReceive.list,
            initialValue: widget.materialReceive?.warehouse,
            labelText: 'warehouse'.tr(),
            validator: requiredObjectValidator.call,
            onChanged: (warehouse) {
              if (warehouse != null) {
                _warehouse = warehouse;
              }
            },
          ),
          FDropDownSearchPurchaseOrder(
            initialValue: widget.materialReceive?.purchaseOrder,
            isRequired: widget.type == MaterialReceiveType.purchaseOrder,
            validatorX: (PurchaseOrder? po) {
              if (po != null) {
                if (po.materialGroup != null) {
                  if (po.materialGroup!.id == 'BAKU' ||
                      po.materialGroup!.id == 'BANTU' ||
                      po.materialGroup!.id == 'KEMASAN') {
                    DateTime poDeliveryDateFormatted = DateTime(
                      po.deliveryDate.toUtc().year,
                      po.deliveryDate.toUtc().month,
                      po.deliveryDate.toUtc().day,
                      7,
                      7,
                    );
                    // print(poDeliveryDateFormatted);
                    final listGetLast6WorkingDays = getLast6WorkingDays(
                        poDeliveryDate: poDeliveryDateFormatted);
                    final DateTime today = DateTime.now();

                    // Ambil hari kerja ke-6 sebelum delivery date
                    final DateTime last6thWorkingDay =
                        listGetLast6WorkingDays.last;

                    // Cetak tanggal hari ini, delivery date, dan 6 hari kerja sebelumnya
                    // print("Tanggal hari ini: ${today.day}");
                    // print("Tanggal delivery date: ${po.deliveryDate.day}");
                    // print("6 hari kerja sebelumnya: ${listGetLast6WorkingDays.map((d) => d.day).join(', ')}");

                    // Validasi: jika hari ini kurang dari 6 hari kerja sebelum delivery date -> ERROR
                    if (today.isBefore(last6thWorkingDay)) {
                      return 'can_only_insert_material_receive_up_to_7_working_days_before_delivery_date'
                          .tr();
                    }
                  }
                }
              }
              return null; // Jika validasi berhasil, tidak menampilkan error
            },
            onChanged: (purchaseOrder) {
              if (purchaseOrder != null) {
                _purchaseOrder = purchaseOrder;
                context.read<PurchaseOrderDetailQueryBloc>().add(
                      PurchaseOrderDetailQueryEvent.fetch(
                        purchaseOrder: purchaseOrder,
                        materialGroupId: _materialGroup?.id,
                      ),
                    );
                setState(() {});
              }
            },
          ),
        ],
      ),
      Gap(24),
      RowFields(
        children: [
          FTextFormField(
            enabled: _action.isCreate,
            labelText: 'delivery_order_no'.tr(),
            controller: _deliveryOrderIdController,
          ),
          FieldDatePicker(
            labelText: 'delivery_order_date'.tr(),
            controller: _deliveryOrderDateController,
            onChanged: (value) => _deliveryOrderDate = value,
          ),
        ],
      ),
      const Gap(24),
      FTextFormField(
        labelText: 'description'.tr(),
        controller: _descriptionController,
        maxLines: 4,
      ),
    ];
  }

  List<Widget> _buildCreateNonPO() {
    return [
      RowFields(
        children: [
          BlocBuilder<TransactionTypeQueryBloc, TransactionTypeQueryState>(
            builder: (context, state) {
              return FDropDownSearch<TransactionType>(
                labelText: 'transaction_type'.tr(),
                validator: requiredObjectValidator.call,
                initialValue: widget.materialReceive?.transactionType,
                itemAsString: (transaction) =>
                    '${transaction.id} - ${transaction.name}',
                items: state.maybeWhen(
                  orElse: () => [],
                  loaded: (transactionTypes) => transactionTypes.data,
                ),
                onChanged: (type) {
                  if (type != null) {
                    _transactionType = type;
                  }
                },
                status: state.maybeWhen(
                  error: (_) => Status.error,
                  loading: (_) => Status.progress,
                  orElse: () => Status.loaded,
                ),
              );
            },
          ),
          FDropDownSearchMaterialGroup(
            initialValue: widget.materialReceive?.materialGroup,
            onChanged: (materialGroup) {
              if (materialGroup != null) {
                _materialGroup = materialGroup;
                widget.onMaterialGroupSelected(
                  _materialGroup?.id == 'KEMASAN',
                );
                context.read<PurchaseOrderQueryBloc>().add(
                      PurchaseOrderQueryEvent.fetch(
                        status: [
                          PurchaseOrderStatus.accountingConfirm,
                          PurchaseOrderStatus.nextShipping,
                        ],
                        pageOptions: PageOptions.emptyNoLimit(),
                        materialGroupId: [materialGroup.id],
                      ),
                    );
              }
            },
          ),
          FDropDownSearch<WarehouseMaterialReceive>(
            itemAsString: (warehouse) => warehouse.id,
            items: WarehouseMaterialReceive.list,
            initialValue: widget.materialReceive?.warehouse,
            labelText: 'warehouse'.tr(),
            validator: requiredObjectValidator.call,
            onChanged: (warehouse) {
              if (warehouse != null) {
                _warehouse = warehouse;
              }
            },
          ),
        ],
      ),
      const Gap(24),
      RowFields(
        children: [
          FDropDownSearchPurchaseOrder(
            initialValue: widget.materialReceive?.purchaseOrder,
            isRequired: widget.type == MaterialReceiveType.purchaseOrder,
            onChanged: (purchaseOrder) {
              if (purchaseOrder != null) {
                _purchaseOrder = purchaseOrder;
                setState(() {});
              }
            },
          ),
          FDropDownSearchDepartment(
            initialValue: widget.materialReceive?.department,
            label: 'department'.tr(),
            onChanged: (department) {
              if (department != null) {
                _department = department;
              }
            },
          ),
          FDropDownSearchVendor(
            isRequired: false,
            initialValue: widget.materialReceive?.vendor,
            label: 'manufacturer'.tr(),
            onChanged: (vendor) {
              if (vendor != null) {
                _vendor = vendor;
              }
            },
          ),
        ],
      ),
      const Gap(24),
      RowFields(
        children: [
          FTextFormField(
            enabled: _action.isCreate,
            labelText: 'delivery_order_no'.tr(),
            controller: _deliveryOrderIdController,
          ),
          FieldDatePicker(
            labelText: 'delivery_order_date'.tr(),
            controller: _deliveryOrderDateController,
            onChanged: (value) => _deliveryOrderDate = value,
          ),
          FTextFormField(
            labelText: 'description'.tr(),
            controller: _descriptionController,
            maxLines: 4,
          ),
        ],
      ),
    ];
  }

  List<Widget> get _buildEditFields {
    return [
      FDropDownSearch<WarehouseMaterialReceive>(
        itemAsString: (warehouse) => warehouse.id,
        items: WarehouseMaterialReceive.list,
        initialValue: widget.materialReceive?.warehouse,
        labelText: 'warehouse'.tr(),
        validator: requiredObjectValidator.call,
        onChanged: (warehouse) {
          if (warehouse != null) {
            _warehouse = warehouse;
          }
        },
      ),
      const SizedBox(height: 24),
      RowFields(
        children: [
          FTextFormField(
            labelText: 'delivery_order_no'.tr(),
            controller: _deliveryOrderIdController,
          ),
          FieldDatePicker(
            labelText: 'delivery_order_date'.tr(),
            initialSelectedDate: _deliveryOrderDate,
            controller: _deliveryOrderDateController,
            // validator: requiredObjectValidator.call,
            onChanged: (value) => _deliveryOrderDate = value,
          ),
        ],
      ),
      const SizedBox(height: 24),
      FTextFormField(
        labelText: 'description'.tr(),
        controller: _descriptionController,
        maxLines: 4,
      ),
    ];
  }
}
