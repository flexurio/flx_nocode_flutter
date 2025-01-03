import 'package:appointment/constant/type_product.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_material/src/app/bloc/material_unit_query/material_unit_query_bloc.dart';
import 'package:flexurio_chiron_product/src/app/bloc/product/product_bloc.dart';
import 'package:flexurio_chiron_product/src/app/bloc/product_group_query/product_group_query_bloc.dart';
import 'package:flexurio_chiron_material/src/app/model/material_unit.dart';
import 'package:flexurio_chiron_product/src/app/model/product.dart';
import 'package:flexurio_chiron_product/src/app/model/product_group.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/material_unit.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/product_group.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:page_transition/page_transition.dart';
import 'package:appointment/src/app/model/config.dart';

class ProductCreatePage extends StatefulWidget {
  const ProductCreatePage._({
    required this.product,
    required this.isExternal,
  });

  final Product? product;
  final bool isExternal;

  static Route<bool?> route({Product? product, required bool isExternal}) {
    return PageTransition(
      opaque: true,
      type: PageTransitionType.rightToLeft,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => ProductBloc(isExternal: isExternal)),
          BlocProvider(
            create: (context) => ProductGroupQueryBloc()
              ..add(const ProductGroupQueryEvent.fetch()),
          ),
          BlocProvider(
            create: (context) => MaterialUnitQueryBloc()
              ..add(MaterialUnitQueryEvent.fetch(
                pageOptions: PageOptions.emptyNoLimit(),
              )),
          ),
        ],
        child: ProductCreatePage._(product: product, isExternal: isExternal),
      ),
    );
  }

  @override
  State<ProductCreatePage> createState() => _ProductCreatePageState();
}

class _ProductCreatePageState extends State<ProductCreatePage> {
  late DataAction _action;
  bool _tollOut = false;

  final _formKey = GlobalKey<FormState>();
  final _idController = TextEditingController();
  final _noController = TextEditingController();
  final _nameController = TextEditingController();
  final _typeController = TextEditingController();
  final _expiryPeriodController = TextEditingController();
  final _quantityTabletController = TextEditingController();
  final _quantityStripController = TextEditingController();
  final _quantityBatchController = TextEditingController();
  final _quantityPackController = TextEditingController();

  late MaterialUnit _unitOrder;
  late MaterialUnit _unitSmallest;
  late MaterialUnit _unitPacking;
  late MaterialUnit _unitSecondary;
  late ProductGroup _productGroup;
  late DivisionType _divisionType;
  String? _companyId;

  @override
  void initState() {
    super.initState();

    _action = createOrEdit(widget.product);

    if (!widget.isExternal) {
      _companyId = (flavorConfig.applicationConfig as AppConfig).companyId;
    }

    if (_action.isEdit) {
      final product = widget.product!;
      _companyId = widget.product!.company;
      _unitOrder = product.unitOrder;
      _unitSmallest = product.unitSmallest;
      _unitPacking = product.unitPacking;
      _unitSecondary = product.unitSecondary;
      _productGroup = product.productGroup;
      _idController.text = product.id;
      _noController.text = product.productNo;
      _nameController.text = product.name;
      _typeController.text = product.productType.productType;
      _tollOut = product.tollOut;
      _expiryPeriodController.text = product.expiryPeriod.toString();
      _quantityTabletController.text = product.quantityTablet.toString();
      _quantityStripController.text = product.quantityStrip.toString();
      _quantityBatchController.text = product.quantityBatch.toString();
      _quantityPackController.text = product.quantityPack.toString();
      _divisionType = product.division;
    }
  }

  @override
  void dispose() {
    _idController.dispose();
    _noController.dispose();
    _nameController.dispose();
    _typeController.dispose();
    _expiryPeriodController.dispose();
    _quantityTabletController.dispose();
    _quantityStripController.dispose();
    _quantityBatchController.dispose();
    _quantityPackController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      late ProductEvent event;
      if (_action.isEdit) {
        event = ProductEvent.update(
          id: _idController.text,
          no: _noController.text,
          name: _nameController.text,
          type: _typeController.text,
          productGroup: _productGroup,
          unitPacking: _unitPacking,
          unitSmallest: _unitSmallest,
          unitOrder: _unitOrder,
          unitSecondary: _unitSecondary,
          expiryPeriod: int.parse(_expiryPeriodController.text),
          tollOut: _tollOut,
          quantityTablet: int.parse(_quantityTabletController.text),
          quantityStrip: int.parse(_quantityStripController.text),
          quantityBatch: int.parse(_quantityBatchController.text),
          quantityPack: int.parse(_quantityPackController.text),
          divisionType: _divisionType,
        );
      } else {
        event = ProductEvent.create(
          id: _idController.text,
          no: _noController.text,
          name: _nameController.text,
          type: _typeController.text,
          productGroup: _productGroup,
          unitPacking: _unitPacking,
          unitSmallest: _unitSmallest,
          unitOrder: _unitOrder,
          unitSecondary: _unitSecondary,
          divisionType: _divisionType,
          expiryPeriod: int.parse(_expiryPeriodController.text),
          tollOut: _tollOut,
          quantityTablet: int.parse(_quantityTabletController.text),
          quantityStrip: int.parse(_quantityStripController.text),
          quantityBatch: int.parse(_quantityBatchController.text),
          quantityPack: int.parse(_quantityPackController.text),
          companyId: _companyId!,
        );
      }

      context.read<ProductBloc>().add(event);
    }
  }

  @override
  Widget build(BuildContext context) {
    final entity = Entity.product;

    return BlocListener<ProductBloc, ProductState>(
      listener: (context, state) {
        state.maybeWhen(
          success: () {
            Toast(context).dataChanged(_action, entity);
            Navigator.pop(context, true);
          },
          error: (error) => Toast(context).fail(error),
          orElse: () {},
        );
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleFormPanel(
          formKey: _formKey,
          action: _action,
          entity: entity,
          actions: [
            BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {
                return Button(
                  permission: null,
                  isInProgress: state.maybeWhen(
                    loading: () => true,
                    orElse: () => false,
                  ),
                  onPressed: _submit,
                  action: _action,
                );
              },
            ),
          ],
          children: [
            Column(
              children: [
                RowFields(
                  children: [
                    FTextFormField(
                      enabled: _action.isCreate,
                      labelText: 'ID',
                      controller: _idController,
                      validator: requiredValidator.call,
                      maxLength: 20,
                    ),
                    FTextFormField(
                      enabled: _action.isCreate,
                      labelText: 'Code Product',
                      controller: _noController,
                      maxLength: 5,
                    ),
                  ],
                ),
                const Gap(24),
                FTextFormField(
                  labelText: 'Name',
                  controller: _nameController,
                  validator: requiredValidator.call,
                  maxLength: 100,
                ),
                const Gap(24),
                RowFields(
                  children: [
                    FDropDownSearch<String>(
                      validator: requiredObjectValidator.call,
                      labelText: 'Type',
                      items: typeProduct,
                      onChanged: (listType) {
                        _typeController.text = listType.toString();
                      },
                      initialValue: widget.product?.productType.productType,
                      itemAsString: (listType) => listType,
                    ),
                    FDropDownSearchProductGroup(
                      label: 'Group',
                      initialValue: widget.product?.productGroup,
                      onChanged: (value) {
                        if (value != null) {
                          _productGroup = value;
                        }
                      },
                    ),
                  ],
                ),
                const Gap(24),
                RowFields(
                  children: [
                    FDropDownSearchMaterialUnit(
                      label: 'Unit Packing',
                      initialValue: widget.product?.unitPacking,
                      onChanged: (value) {
                        if (value != null) {
                          _unitPacking = value;
                        }
                      },
                    ),
                    FDropDownSearchMaterialUnit(
                      label: 'Unit Smallest',
                      initialValue: widget.product?.unitSmallest,
                      onChanged: (value) {
                        if (value != null) {
                          _unitSmallest = value;
                        }
                      },
                    ),
                  ],
                ),
                const Gap(24),
                RowFields(
                  children: [
                    FDropDownSearchMaterialUnit(
                      label: 'Unit Order',
                      initialValue: widget.product?.unitOrder,
                      onChanged: (value) {
                        if (value != null) {
                          _unitOrder = value;
                        }
                      },
                    ),
                    FDropDownSearchMaterialUnit(
                      label: 'Unit Secondary',
                      initialValue: widget.product?.unitSecondary,
                      onChanged: (value) {
                        if (value != null) {
                          _unitSecondary = value;
                        }
                      },
                    ),
                  ],
                ),
                const Gap(24),
                RowFields(
                  children: [
                    FDropDownSearch(
                      labelText: 'Division',
                      itemAsString: (divisionType) => divisionType.label,
                      items: const [
                        DivisionType.ethical,
                        DivisionType.otc,
                        DivisionType.alkes,
                        DivisionType.dvd,
                        DivisionType.distributor,
                        DivisionType.empty,
                      ],
                      initialValue: widget.product?.division,
                      onChanged: (value) {
                        if (value != null) {
                          _divisionType = value;
                        }
                      },
                    ),
                    FTextFormField(
                      suffixIcon: Container(
                        margin: const EdgeInsets.only(top: 6),
                        width: 70,
                        color: Colors.transparent,
                        child: const Text(
                          'Month',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      labelText: 'Expiry Period',
                      controller: _expiryPeriodController,
                      validator: requiredValidator.call,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      maxLength: 50,
                    ),
                  ],
                ),
                const Gap(24),
                RowFields(
                  children: [
                    FTextFormField(
                      labelText: 'Quantity Tablet',
                      controller: _quantityTabletController,
                      validator: requiredValidator.call,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      maxLength: 50,
                    ),
                    FTextFormField(
                      labelText: 'Quantity Strip',
                      controller: _quantityStripController,
                      validator: requiredValidator.call,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      maxLength: 50,
                    ),
                  ],
                ),
                const Gap(24),
                RowFields(
                  children: [
                    FTextFormField(
                      labelText: 'Quantity Batch',
                      controller: _quantityBatchController,
                      validator: requiredValidator.call,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      maxLength: 50,
                    ),
                    FTextFormField(
                      labelText: 'Quantity Pack',
                      controller: _quantityPackController,
                      validator: requiredValidator.call,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      maxLength: 50,
                    ),
                  ],
                ),
                const Gap(24),
                CheckboxWithText(
                  initialValue: _tollOut,
                  text: 'Toll out',
                  onChanged: (value) {
                    setState(() {
                      _tollOut = value;
                    });
                  },
                ),
                const Gap(12),
                FDropDownSearch<String>(
                  enabled: _action.isCreate && widget.isExternal,
                  initialValue: _companyId,
                  labelText: 'company'.tr(),
                  items: (flavorConfig.applicationConfig as AppConfig)
                      .companyExternals,
                  itemAsString: (value) => value,
                  onChanged: (value) {
                    if (value != null) {
                      _companyId = value;
                    }
                  },
                  validator: requiredObjectValidator.call,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
