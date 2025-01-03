import 'package:flexurio_chiron_accounting/src/app/bloc/asset_data/asset_data_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/bloc/asset_location_query/asset_location_query_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/bloc/asset_type_query/asset_type_query_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/bloc/chart_of_account_number_accumulation_query/chart_of_account_number_accumulation_query_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/bloc/chart_of_account_number_invoice_query/chart_of_account_number_invoice_query_bloc.dart';
import 'package:flexurio_chiron_company/flexurio_chiron_company.dart';
import 'package:flexurio_chiron_accounting/src/app/model/asset_data.dart';
import 'package:flexurio_chiron_accounting/src/app/model/asset_location.dart';
import 'package:flexurio_chiron_accounting/src/app/model/asset_type.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/asset_location.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/asset_type.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/department.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/material_unit.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/supplier.dart';
import 'package:appointment/src/app/view/widget/string_to_double.dart';
import 'package:flexurio_chiron_accounting/src/app/model/entity.dart';
import 'package:flexurio_chiron_material/src/app/bloc/material_unit_query/material_unit_query_bloc.dart';
import 'package:flexurio_chiron_material/src/app/model/material_unit.dart';
import 'package:flexurio_chiron_vendor/flexurio_chiron_vendor.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pattern_formatter/numeric_formatter.dart';

class AssetDataCreatePage extends StatefulWidget {
  const AssetDataCreatePage({super.key, this.assetData});

  final AssetData? assetData;

  static Route<bool?> route({AssetData? assetData}) {
    return PageTransition(
      opaque: true,
      type: PageTransitionType.rightToLeft,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AssetDataBloc(),
          ),
          BlocProvider(
            create: (context) => ChartOfAccountNumberAccumulationQueryBloc()
              ..add(
                ChartOfAccountNumberAccumulationQueryEvent.fetch(
                  pageOptions: PageOptions.emptyNoLimit(),
                ),
              ),
          ),
          BlocProvider(
            create: (context) => ChartOfAccountNumberInvoiceQueryBloc()
              ..add(
                ChartOfAccountNumberInvoiceQueryEvent.fetch(
                  pageOptions: PageOptions.emptyNoLimit(),
                ),
              ),
          ),
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
          BlocProvider(
            create: (context) => AssetLocationQueryBloc()
              ..add(
                AssetLocationQueryEvent.fetch(
                  pageOptions: PageOptions.emptyNoLimit(),
                ),
              ),
          ),
          BlocProvider(
            create: (context) => AssetTypeQueryBloc()
              ..add(
                AssetTypeQueryEvent.fetch(
                  pageOptions: PageOptions.emptyNoLimit(),
                ),
              ),
          ),
          BlocProvider(
            create: (context) => MaterialUnitQueryBloc()
              ..add(
                MaterialUnitQueryEvent.fetch(
                  pageOptions: PageOptions.emptyNoLimit(),
                ),
              ),
          ),
        ],
        child: AssetDataCreatePage(
          assetData: assetData,
        ),
      ),
    );
  }

  @override
  State<AssetDataCreatePage> createState() => _AssetDataCreatePageState();
}

class _AssetDataCreatePageState extends State<AssetDataCreatePage> {
  late DataAction _action;
  final _formKey = GlobalKey<FormState>();
  Department? _department;
  Supplier? _supplier;
  MaterialUnit? _materialUnit;
  AssetType? _assetType;
  AssetLocation? _assetLocation;
  AssetLocation? _assetCurrentLocation;
  late DateTime _date;
  final _dateController = TextEditingController();
  final _assetNameController = TextEditingController();
  final _quantityController = TextEditingController();
  final _priceController = TextEditingController();
  final _remarkController = TextEditingController();
  final _picController = TextEditingController();
  final _serialNumberController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _action = createOrEdit(widget.assetData);

    if (_action.isEdit) {
      _department = widget.assetData!.department;
      _supplier = widget.assetData!.supplier;
      _assetType = widget.assetData!.assetType;
      _assetLocation = widget.assetData!.assetLocation;
      _assetCurrentLocation = widget.assetData!.assetLocationCurrent;
      _date = widget.assetData!.date;
      _dateController.text = widget.assetData!.date.yMMMMd;
      _materialUnit = widget.assetData!.unit;
      _assetNameController.text = widget.assetData!.assetName;
      _quantityController.text = widget.assetData!.quantity.toString();
      _priceController.text = widget.assetData!.price.toString();
      _remarkController.text = widget.assetData!.remark;
      _picController.text = widget.assetData!.pic ?? '';
      _serialNumberController.text = widget.assetData!.serialNumber;
    }
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      if (_action.isEdit) {
        context.read<AssetDataBloc>().add(
              AssetDataEvent.update(
                assetData: widget.assetData!,
                department: _department!,
                supplier: _supplier!,
                assetName: _assetNameController.text,
                quantity: int.parse(_quantityController.text),
                materialUnit: _materialUnit!,
                price: stringDecimalToDouble(_priceController.text),
                remark: _remarkController.text,
                pic: _picController.text,
                serialNumber: _serialNumberController.text,
              ),
            );
      } else {
        context.read<AssetDataBloc>().add(
              AssetDataEvent.create(
                department: _department!,
                supplier: _supplier!,
                assetType: _assetType!,
                assetLocation: _assetLocation!,
                assetCurrentLocation: _assetCurrentLocation!,
                date: _date,
                assetName: _assetNameController.text,
                quantity: int.parse(_quantityController.text),
                materialUnit: _materialUnit!,
                price: stringDecimalToDouble(_priceController.text),
                remark: _remarkController.text,
                pic: _picController.text,
                serialNumber: _serialNumberController.text,
              ),
            );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final entity = EntityAccounting.assetData;
    return BlocListener<AssetDataBloc, AssetDataState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          success: () {
            Toast(context).dataChanged(_action, entity);
            Navigator.pop(context, true);
          },
          error: (error) => Toast(context).fail(error),
        );
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleFormPanel(
          formKey: _formKey,
          action: _action,
          entity: entity,
          actions: [
            BlocBuilder<AssetDataBloc, AssetDataState>(
              builder: (context, state) {
                return Button(
                  permission: null,
                  action: _action,
                  onPressed: _submit,
                  isInProgress: state.maybeWhen(
                    orElse: () => false,
                    loading: () => true,
                  ),
                );
              },
            ),
          ],
          children: [
            RowFields(
              children: [
                FDropDownSearchDepartment(
                  initialValue: _department,
                  onChanged: (department) {
                    if (department != null) {
                      _department = department;
                    }
                  },
                ),
                FDropDownSearchSupplier(
                  initialValue: _supplier,
                  onChanged: (supplier) {
                    _supplier = supplier;
                  },
                ),
              ],
            ),
            const Gap(24),
            if (_action.isCreate)
              RowFields(
                children: [
                  FDropDownSearchAssetType(
                    initialValue: _assetType,
                    onChanged: (assetType) {
                      _assetType = assetType;
                    },
                  ),
                  FDropDownSearchAssetLocation(
                    initialValue: _assetLocation,
                    onChanged: (assetLocation) {
                      _assetLocation = assetLocation;
                      _assetCurrentLocation = assetLocation;
                      setState(() {});
                    },
                  ),
                ],
              ),
            if (_action.isEdit)
              RowFields(
                children: [
                  FDropDownSearchAssetType(
                    enabled: false,
                    initialValue: _assetType,
                    onChanged: (assetType) {
                      _assetType = assetType;
                    },
                  ),
                  FDropDownSearchAssetLocation(
                    enabled: false,
                    initialValue: _assetLocation,
                    onChanged: (assetLocation) {
                      _assetLocation = assetLocation;
                    },
                  ),
                ],
              ),
            const Gap(24),
            if (_action.isCreate)
              RowFields(
                children: [
                  FDropDownSearchAssetLocation(
                    label: 'Asset Current Location',
                    initialValue: _assetCurrentLocation,
                    onChanged: (assetCurrentLocation) {
                      _assetCurrentLocation = assetCurrentLocation;
                    },
                  ),
                  FieldDatePicker(
                    onChanged: (value) => _date = value,
                    controller: _dateController,
                    labelText: 'Date',
                    validator: requiredObjectValidator.call,
                  ),
                ],
              ),
            if (_action.isEdit)
              RowFields(
                children: [
                  FDropDownSearchAssetLocation(
                    label: 'Asset Current Location',
                    enabled: false,
                    initialValue: _assetCurrentLocation,
                    onChanged: (assetCurrentLocation) {
                      _assetCurrentLocation = assetCurrentLocation;
                    },
                  ),
                  FieldDatePicker(
                    enabled: false,
                    onChanged: (value) => _date = value,
                    controller: _dateController,
                    labelText: 'Date',
                  ),
                ],
              ),
            const Gap(24),
            FTextFormField(
              labelText: 'Asset Name',
              controller: _assetNameController,
              validator: requiredValidator.call,
            ),
            const Gap(24),
            RowFields(
              children: [
                FTextFormField(
                  labelText: 'Quantity',
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  controller: _quantityController,
                  validator: requiredValidator.call,
                ),
                FDropDownSearchMaterialUnit(
                  label: 'Unit',
                  initialValue: _materialUnit,
                  onChanged: (value) {
                    if (value != null) {
                      _materialUnit = value;
                    }
                  },
                ),
              ],
            ),
            const Gap(24),
            RowFields(
              children: [
                FTextFormField(
                  labelText: 'Price',
                  inputFormatters: [
                    ThousandsFormatter(),
                  ],
                  controller: _priceController,
                  validator: requiredValidator.call,
                ),
                FTextFormField(
                  labelText: 'PIC',
                  controller: _picController,
                ),
              ],
            ),
            const Gap(24),
            FTextFormField(
              labelText: 'Remark',
              controller: _remarkController,
              validator: requiredValidator.call,
            ),
            const Gap(24),
            FTextFormField(
              labelText: 'Serial Number',
              controller: _serialNumberController,
              validator: requiredValidator.call,
            ),
          ],
        ),
      ),
    );
  }
}
