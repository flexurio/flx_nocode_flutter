import 'package:flexurio_chiron_material_stock/src/app/bloc/material_analysis/material_analysis_bloc.dart';
import 'package:flexurio_chiron_material_stock/src/app/bloc/material_analysis_query/material_analysis_query_bloc.dart';
import 'package:flexurio_chiron_material_stock/src/app/bloc/material_receive_detail_bloc/material_receive_detail_bloc.dart';
import 'package:flexurio_chiron_material_stock/src/app/model/entity.dart';
import 'package:flexurio_chiron_material_stock/src/app/model/material_receive_detail.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_material/src/app/model/material.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flexurio_chiron_company/flexurio_chiron_company.dart';
import 'package:flexurio_erp_employee/flexurio_erp_employee.dart';
import 'package:appointment/src/app/view/widget/sliding_switch.dart';
import 'package:appointment/src/app/view/widget/get_user_name.dart';

class MaterialReceiveDetailAnalysisForm extends StatefulWidget {
  const MaterialReceiveDetailAnalysisForm({
    required this.detail,
    super.key,
  });

  final MaterialReceiveDetail detail;

  static Widget prepare({
    required MaterialReceiveDetail detail,
  }) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => MaterialAnalysisBloc()),
        BlocProvider(
            create: (context) => MaterialReceiveDetailBloc(isExternal: false)),
        BlocProvider(
          create: (context) => DepartmentEmployeeQueryBloc()
            ..add(
              DepartmentEmployeeQueryEvent.get(
                department: Department.empty().copyWith(id: 'QC'),
              ),
            ),
        ),
        BlocProvider(
          create: (context) => MaterialAnalysisQueryBloc()
            ..add(
              MaterialAnalysisQueryEvent.fetch(
                barcodeNo: detail.barcodeNo,
              ),
            ),
        ),
      ],
      child: MaterialReceiveDetailAnalysisForm(detail: detail),
    );
  }

  @override
  State<MaterialReceiveDetailAnalysisForm> createState() =>
      _MaterialReceiveDetailAnalysisFormState();
}

class _MaterialReceiveDetailAnalysisFormState
    extends State<MaterialReceiveDetailAnalysisForm> {
  final _formKey = GlobalKey<FormState>();
  final _materialController = TextEditingController();
  final _naController = TextEditingController();
  final _noTransactionController = TextEditingController();
  final _noBatchController = TextEditingController();
  final _supplierController = TextEditingController();
  final _dateOfArrivalController = TextEditingController();
  final _materialGroupController = TextEditingController();
  final _materialUnitController = TextEditingController();
  final _densityController = TextEditingController();
  final _qtySampleController = TextEditingController();
  final _samplingDateController = TextEditingController();
  final _qtyRetainSampleController = TextEditingController();
  final _retainSamplingDateController = TextEditingController();
  final _qtyPackOpenedController = TextEditingController();
  final _qtyPackTotalController = TextEditingController();
  final _barcodeNoController = TextEditingController();
  final _assayController = TextEditingController();
  final _warehouseController = TextEditingController();
  final _vatNoController = TextEditingController();
  final _vatTotalController = TextEditingController();
  final _microbiologyReleaseDateController = TextEditingController();
  final _materialReceiptDateController = TextEditingController();
  final _retestDateController = TextEditingController();

  DateTime? _samplingDate;
  DateTime? _retainSamplingDate;
  String? _samplingBy;
  String? _retainSamplingBy;
  DateTime? _microbiologyReleaseDate;
  String? _microbiologyReleaseBy;
  DateTime? _materialReceiptDate;
  bool? _coaAvailability = false;

  late Material _material;
  late DataAction action;

  final formatter = NumberFormat.decimalPatternDigits(
    locale: 'en_us',
    decimalDigits: 0,
  );

  String numFormat(num number) {
    return formatter.format(number).replaceAll(',', '.');
  }

  @override
  void initState() {
    _material = widget.detail.material;
    _materialController.text = widget.detail.material.name;
    _naController.text = widget.detail.na;
    _noTransactionController.text = widget.detail.materialReceive.id;
    _noBatchController.text =
        widget.detail.batchNo == '' ? '-' : widget.detail.batchNo;
    _supplierController.text =
        widget.detail.materialReceive.purchaseOrder.supplier.name;
    _dateOfArrivalController.text = DateFormat('dd/MM/yyyy')
        .format(widget.detail.materialReceive.createdAt);
    _materialGroupController.text =
        widget.detail.materialReceive.materialGroup.id == ''
            ? '-'
            : widget.detail.materialReceive.materialGroup.id;
    _materialUnitController.text = widget.detail.materialUnit.id;
    _warehouseController.text = widget.detail.materialReceive.warehouse.id;
    _vatNoController.text = widget.detail.vatNo.toString();
    _vatTotalController.text = widget.detail.vatTotal.toString();
    _barcodeNoController.text = widget.detail.barcodeNo.toString();
    super.initState();
  }

  void _submit(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      var event;
      if (action == DataAction.create) {
        event = MaterialAnalysisEvent.create(
          density: _densityController.text == ''
              ? double.parse('0.0')
              : double.parse(_densityController.text),
          materialReceiveId: _noTransactionController.text,
          supplierId: widget.detail.materialReceive.purchaseOrder.supplier.id,
          materialGroupId: _materialGroupController.text,
          materialId: widget.detail.material.id,
          materialUnitId: _materialUnitController.text,
          batchNo: _noBatchController.text,
          qtySample: double.parse(_qtySampleController.text),
          samplingDate: _samplingDate,
          samplingBy: int.parse(_samplingBy ?? '0'),
          qtyRetainSample: double.parse(_qtyRetainSampleController.text),
          retainSamplingDate: _retainSamplingDate,
          retainSamplingBy: int.parse(_retainSamplingBy ?? '0'),
          qtyPackOpened: int.parse(_qtyPackOpenedController.text),
          qtyPackTotal: int.parse(_qtyPackTotalController.text),
          na: _naController.text,
          assay: _assayController.text == ''
              ? double.parse('0.0')
              : double.parse(_assayController.text),
          warehouse: _warehouseController.text,
          microbiologyReleaseDate: _microbiologyReleaseDate,
          microbiologyReleaseBy: int.parse(_microbiologyReleaseBy ?? '0'),
          coaAvailability: _coaAvailability,
          materialReceiptDate: _materialReceiptDate,
        );
      } else if (action == DataAction.edit) {
        event = MaterialAnalysisEvent.update(
          barcodeNo: widget.detail.barcodeNo,
          qtySample: double.parse(_qtySampleController.text),
          qtyRetainSample: double.parse(_qtyRetainSampleController.text),
          qtyPackOpened: int.parse(_qtyPackOpenedController.text),
          qtyPackTotal: int.parse(_qtyPackTotalController.text),
          assay: double.parse(_assayController.text),
        );
      }

      context.read<MaterialAnalysisBloc>().add(event);
    }
  }

  @override
  Widget build(BuildContext context) {
    action = DataAction.create;
    final entity = EntityMaterialStock.materialAnalysis;
    final isRelease =
        widget.detail.materialStatus == MaterialReceiveDetailStatus.release;

    return MultiBlocListener(
      listeners: [
        BlocListener<MaterialAnalysisBloc, MaterialAnalysisState>(
          listener: (context, state) {
            state.maybeWhen(
              orElse: () {},
              success: () {
                Navigator.pop(context, true);
                Toast(context).dataChanged(action, entity);
              },
              error: (error) => Toast(context).fail(error),
            );
          },
        ),
      ],
      child: BlocBuilder<MaterialAnalysisQueryBloc, MaterialAnalysisQueryState>(
        builder: (context, state) {
          state.maybeWhen(
            orElse: () {},
            loaded: (materialAnalysis) {
              if (materialAnalysis.isNotEmpty) {
                action = DataAction.edit;
                _material = widget.detail.material;
                _materialController.text = widget.detail.material.name;
                _naController.text = widget.detail.na;
                _noTransactionController.text =
                    widget.detail.materialReceive.id;
                _noBatchController.text =
                    widget.detail.batchNo == '' ? '-' : widget.detail.batchNo;
                _supplierController.text =
                    widget.detail.materialReceive.purchaseOrder.supplier.name;
                _dateOfArrivalController.text = DateFormat('dd/MM/yyyy')
                    .format(widget.detail.materialReceive.createdAt);
                _materialGroupController.text =
                    widget.detail.materialReceive.materialGroup.id == ''
                        ? '-'
                        : widget.detail.materialReceive.materialGroup.id;
                _materialUnitController.text = widget.detail.materialUnit.id;
                _warehouseController.text =
                    widget.detail.materialReceive.warehouse.id;
                _vatNoController.text = widget.detail.vatNo.toString();
                _vatTotalController.text = widget.detail.vatTotal.toString();
                _barcodeNoController.text = widget.detail.barcodeNo.toString();
                _qtySampleController.text =
                    materialAnalysis[0].qtySample.toString();
                _qtyPackOpenedController.text =
                    materialAnalysis[0].qtyPackOpened.toString();
                _qtyPackTotalController.text =
                    materialAnalysis[0].qtyPackTotal.toString();
                _qtyRetainSampleController.text =
                    materialAnalysis[0].qtyRetainSample.toString();
                _assayController.text = materialAnalysis[0].assay.toString();
                _densityController.text =
                    materialAnalysis[0].density.toString();
                _samplingDateController.text = DateFormat('MMMM dd, yyyy')
                    .format(materialAnalysis[0].samplingDate);
                _samplingDate = materialAnalysis[0].samplingDate;
                _retainSamplingDateController.text =
                    DateFormat('MMM dd, yyyy HH:mm:ss')
                        .format(materialAnalysis[0].retainSamplingDate);
                _retainSamplingDate = materialAnalysis[0].retainSamplingDate;
                if (materialAnalysis[0].microbiologyReleaseDate != null) {
                  _microbiologyReleaseDateController.text =
                      DateFormat('MMM dd, yyyy HH:mm:ss')
                          .format(materialAnalysis[0].microbiologyReleaseDate!);
                  _microbiologyReleaseDate =
                      materialAnalysis[0].microbiologyReleaseDate;
                }
                _materialReceiptDateController.text =
                    DateFormat('MMM dd, yyyy HH:mm:ss')
                        .format(materialAnalysis[0].materialReceiptDate);
                _materialReceiptDate = materialAnalysis[0].materialReceiptDate;
                _coaAvailability = materialAnalysis[0].coaAvailability;
                _samplingBy = materialAnalysis[0].samplingBy.toString();
                _microbiologyReleaseBy =
                    materialAnalysis[0].microbiologyReleaseBy.toString();
                _retainSamplingBy =
                    materialAnalysis[0].retainSamplingBy.toString();
              } else {
                action = DataAction.create;
                _material = widget.detail.material;
                _materialController.text = widget.detail.material.name;
                _naController.text = widget.detail.na;
                _noTransactionController.text =
                    widget.detail.materialReceive.id;
                _noBatchController.text =
                    widget.detail.batchNo == '' ? '-' : widget.detail.batchNo;
                _supplierController.text =
                    widget.detail.materialReceive.purchaseOrder.supplier.name;
                _dateOfArrivalController.text = DateFormat('dd/MM/yyyy')
                    .format(widget.detail.materialReceive.createdAt);
                _materialGroupController.text =
                    widget.detail.materialReceive.materialGroup.id == ''
                        ? '-'
                        : widget.detail.materialReceive.materialGroup.id;
                _materialUnitController.text = widget.detail.materialUnit.id;
                _warehouseController.text =
                    widget.detail.materialReceive.warehouse.id;
                _vatNoController.text = widget.detail.vatNo.toString();
                _vatTotalController.text = widget.detail.vatTotal.toString();
                _barcodeNoController.text = widget.detail.barcodeNo.toString();
              }
            },
          );
          return SingleFormPanel(
            formKey: _formKey,
            action: action,
            entity: entity,
            actions: [
              BlocBuilder<MaterialAnalysisBloc, MaterialAnalysisState>(
                builder: (context, state) {
                  final isProgress = state.maybeWhen(
                    orElse: () => false,
                    loading: () => true,
                  );
                  return Button(
                    isInProgress: isProgress,
                    action: action,
                    permission: null,
                    onPressed: () => _submit(context),
                  );
                },
              ),
            ],
            children: _buildCreateFields(context, isRelease, action),
          );
        },
      ),
    );
  }

  List<Widget> _buildCreateFields(
      BuildContext context, bool isRelease, DataAction action) {
    return [
      RowFields(
        children: [
          FTextFormField(
            enabled: false,
            labelText: 'Material',
            controller: _materialController,
          ),
          FTextFormField(
            enabled: false,
            labelText: 'NA',
            controller: _naController,
          ),
        ],
      ),
      const SizedBox(height: 24),
      RowFields(
        children: [
          FTextFormField(
            enabled: false,
            labelText: 'Nomor Transaksi',
            controller: _noTransactionController,
          ),
          FTextFormField(
            enabled: false,
            labelText: 'Nomor Batch',
            controller: _noBatchController,
          ),
        ],
      ),
      const SizedBox(height: 24),
      RowFields(
        children: [
          FTextFormField(
            enabled: false,
            labelText: 'Supplier',
            controller: _supplierController,
          ),
          FTextFormField(
            enabled: false,
            labelText: 'Tgl. Datang',
            controller: _dateOfArrivalController,
          ),
        ],
      ),
      const SizedBox(height: 24),
      RowFields(children: [
        FTextFormField(
          enabled: false,
          labelText: 'Material Group',
          controller: _materialGroupController,
        ),
        FTextFormField(
          enabled: false,
          labelText: 'Material Unit',
          controller: _materialUnitController,
        ),
      ]),
      const SizedBox(height: 24),
      RowFields(
        children: [
          FTextFormField(
            enabled: action == DataAction.create ? true : false,
            labelText: 'Density',
            controller: _densityController,
            inputFormatters: [DecimalInputFormatter()],
          ),
          FTextFormField(
            labelText: 'Qty Sample',
            controller: _qtySampleController,
            validator: requiredValidator.call,
            inputFormatters: [DecimalInputFormatter()],
          ),
        ],
      ),
      const SizedBox(height: 24),
      RowFields(
        children: [
          FieldDatePicker(
            enabled: action == DataAction.create ? true : false,
            initialSelectedDate: _samplingDate,
            onChanged: (date) => _samplingDate = date,
            controller: _samplingDateController,
            validator: action == DataAction.create
                ? requiredObjectValidator.call
                : null,
            labelText: 'Sampling Date',
          ),
          UsersBuilder(
            builder: (users) {
              Employee? employee;
              if (users.isNotEmpty) {
                final found = users.where((x) => x.nip == _samplingBy).toList();
                if (found.isNotEmpty) {
                  employee = found.first;
                }
              }
              return BlocBuilder<DepartmentEmployeeQueryBloc,
                  DepartmentEmployeeQueryState>(
                builder: (context, state) {
                  return FDropDownSearch<Employee>(
                    enabled: action == DataAction.create ? true : false,
                    initialValue: employee,
                    validator: requiredObjectValidator.call,
                    labelText: 'Sampling By',
                    itemAsString: (employee) => employee.name,
                    items: state.maybeWhen(
                      orElse: () => [],
                      loaded: (employees, nip) {
                        var matchedEmployees = employees
                            .where((employee) => nip.contains(employee.nip))
                            .toList();
                        return matchedEmployees;
                      },
                    ),
                    status: state.maybeWhen(
                      error: (_) => Status.error,
                      loading: () => Status.progress,
                      orElse: () => Status.loaded,
                    ),
                    onChanged: (employee) {
                      if (employee != null) {
                        _samplingBy = employee.nip;
                      }
                    },
                  );
                },
              );
            },
          ),
        ],
      ),
      const SizedBox(height: 24),
      RowFields(
        children: [
          FTextFormField(
            labelText: 'Qty Retain Sample',
            controller: _qtyRetainSampleController,
            validator: requiredValidator.call,
            inputFormatters: [DecimalInputFormatter()],
          ),
          FieldTimePicker(
            enabled: action == DataAction.create ? true : false,
            initialSelectedTime: _retainSamplingDate,
            labelText: 'Retain Sampling Date',
            controller: _retainSamplingDateController,
            onChanged: (value) => _retainSamplingDate = value,
            validator: action == DataAction.create
                ? requiredObjectValidator.call
                : null,
          ),
        ],
      ),
      const SizedBox(height: 24),
      RowFields(
        children: [
          UsersBuilder(builder: (users) {
            Employee? employee;
            if (users.isNotEmpty) {
              final found =
                  users.where((x) => x.nip == _retainSamplingBy).toList();
              if (found.isNotEmpty) {
                employee = found.first;
              }
            }
            return BlocBuilder<DepartmentEmployeeQueryBloc,
                DepartmentEmployeeQueryState>(
              builder: (context, state) {
                return FDropDownSearch<Employee>(
                  enabled: action == DataAction.create ? true : false,
                  initialValue: employee,
                  validator: requiredObjectValidator.call,
                  labelText: 'Retain Sampling By',
                  itemAsString: (employee) => employee.name,
                  items: state.maybeWhen(
                    orElse: () => [],
                    loaded: (employees, nip) {
                      var matchedEmployees = employees
                          .where((employee) => nip.contains(employee.nip))
                          .toList();
                      return matchedEmployees;
                    },
                  ),
                  status: state.maybeWhen(
                    error: (_) => Status.error,
                    loading: () => Status.progress,
                    orElse: () => Status.loaded,
                  ),
                  onChanged: (employee) {
                    if (employee != null) {
                      _retainSamplingBy = employee.nip;
                    }
                  },
                );
              },
            );
          }),
          FTextFormField(
            labelText: 'Qty Pack Opened',
            controller: _qtyPackOpenedController,
            validator: requiredValidator.call,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          ),
        ],
      ),
      const SizedBox(height: 24),
      RowFields(
        children: [
          FTextFormField(
            labelText: 'Qty Pack Total',
            controller: _qtyPackTotalController,
            validator: requiredValidator.call,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          ),
          FTextFormField(
            labelText: 'Barcode No',
            controller: _barcodeNoController,
            validator: requiredValidator.call,
            enabled: false,
          ),
        ],
      ),
      const SizedBox(height: 24),
      RowFields(
        children: [
          FTextFormField(
            labelText: 'Assay',
            controller: _assayController,
            inputFormatters: [DecimalInputFormatter()],
          ),
          FTextFormField(
            enabled: false,
            labelText: 'Warehouse',
            controller: _warehouseController,
          ),
        ],
      ),
      const SizedBox(height: 24),
      RowFields(
        children: [
          UsersBuilder(builder: (users) {
            Employee? employee;
            if (users.isNotEmpty) {
              final found =
                  users.where((x) => x.nip == _microbiologyReleaseBy).toList();
              if (found.isNotEmpty) {
                employee = found.first;
              }
            }
            return BlocBuilder<DepartmentEmployeeQueryBloc,
                DepartmentEmployeeQueryState>(
              builder: (context, state) {
                return FDropDownSearch<Employee>(
                  enabled: action == DataAction.create ? true : false,
                  labelText: 'Microbiology Release By',
                  itemAsString: (employee) => employee.name,
                  initialValue: employee,
                  items: state.maybeWhen(
                    orElse: () => [],
                    loaded: (employees, nip) {
                      var matchedEmployees = employees
                          .where((employee) => nip.contains(employee.nip))
                          .toList();
                      return matchedEmployees;
                    },
                  ),
                  status: state.maybeWhen(
                    error: (_) => Status.error,
                    loading: () => Status.progress,
                    orElse: () => Status.loaded,
                  ),
                  onChanged: (employee) {
                    if (employee != null) {
                      _microbiologyReleaseBy = employee.nip;
                    }
                  },
                );
              },
            );
          }),
          FieldTimePicker(
            enabled: action == DataAction.create ? true : false,
            initialSelectedTime: _microbiologyReleaseDate,
            labelText: 'Microbiology Release Date',
            controller: _microbiologyReleaseDateController,
            onChanged: (value) => _microbiologyReleaseDate = value,
          ),
        ],
      ),
      const SizedBox(height: 24),
      RowFields(
        children: [
          FieldTimePicker(
            enabled: action == DataAction.create ? true : false,
            initialSelectedTime: _materialReceiptDate,
            labelText: 'Material Receipt Date',
            controller: _materialReceiptDateController,
            onChanged: (value) => _materialReceiptDate = value,
            validator: action == DataAction.create
                ? requiredObjectValidator.call
                : null,
          ),
          RowFields(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Coa Availability'),
              SlidingSwitch<String>(
                value: _coaAvailability != null
                    ? _coaAvailability == true
                        ? 'Ada'
                        : 'Tidak'
                    : 'Tidak',
                onToggle: (status) {
                  status == 'Ada'
                      ? _coaAvailability = true
                      : _coaAvailability = false;
                },
                options: const ['Ada', 'Tidak'],
                getLabel: (status) => status,
              ),
            ],
          )
        ],
      ),
    ];
  }
}
