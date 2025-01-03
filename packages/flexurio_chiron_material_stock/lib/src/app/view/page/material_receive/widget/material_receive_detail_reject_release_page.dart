import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_material_stock/src/app/bloc/material_analysis/material_analysis_bloc.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';
import 'package:appointment/src/app/view/widget/sliding_switch.dart';
import 'package:flexurio_chiron_material_stock/flexurio_chiron_material_stock.dart';
import 'package:flexurio_chiron_company/flexurio_chiron_company.dart';
import 'package:flexurio_erp_employee/flexurio_erp_employee.dart';

class MaterialReceiveDetailRejectReleasePage extends StatefulWidget {
  const MaterialReceiveDetailRejectReleasePage({
    required this.detail,
    required this.isRelease,
    required this.bloc,
  });

  final MaterialReceiveDetail detail;
  final bool isRelease;
  final MaterialReceiveDetailBloc bloc;

  static Route<bool?> route({
    required MaterialReceiveDetail detail,
    required bool isRelease,
    required MaterialReceiveDetailBloc bloc,
    required bool isExternal,
  }) {
    return PageTransition(
      opaque: true,
      type: PageTransitionType.rightToLeft,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => MaterialAnalysisBloc()),
          BlocProvider(
            create: (context) =>
                MaterialReceiveDetailBloc(isExternal: isExternal),
          ),
          BlocProvider(
            create: (context) => DepartmentEmployeeQueryBloc()
              ..add(
                DepartmentEmployeeQueryEvent.get(
                  department: Department.empty().copyWith(id: 'QC'),
                ),
              ),
          ),
        ],
        child: MaterialReceiveDetailRejectReleasePage(
            detail: detail, isRelease: isRelease, bloc: bloc),
      ),
    );
  }

  @override
  State<MaterialReceiveDetailRejectReleasePage> createState() =>
      _MaterialReceiveDetailRejectReleasePageState();
}

class _MaterialReceiveDetailRejectReleasePageState
    extends State<MaterialReceiveDetailRejectReleasePage> {
  final _formKey = GlobalKey<FormState>();

  final _materialController = TextEditingController();
  final _naController = TextEditingController();
  final _noTransactionController = TextEditingController();
  final _noBatchController = TextEditingController();
  final _supplierController = TextEditingController();
  final _dateOfArrivalController = TextEditingController();
  final _materialGroupController = TextEditingController();
  final _materialUnitController = TextEditingController();
  final _qtyController = TextEditingController();
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
  DateTime? _retestDate;

  @override
  void initState() {
    super.initState();
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
    _warehouseController.text = widget.detail.materialReceive.warehouse.id == ''
        ? '-'
        : widget.detail.materialReceive.warehouse.id;
    _vatNoController.text = widget.detail.vatNo.toString();
    _vatTotalController.text = widget.detail.vatTotal.toString();
    _barcodeNoController.text = widget.detail.barcodeNo.toString();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      final event = MaterialAnalysisEvent.create(
        density: 0,
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
        assay: double.parse(_assayController.text),
        warehouse: _warehouseController.text,
        microbiologyReleaseDate: _microbiologyReleaseDate,
        microbiologyReleaseBy: int.parse(_microbiologyReleaseBy ?? '0'),
        coaAvailability: _coaAvailability,
        materialReceiptDate: _materialReceiptDate,
      );
      context.read<MaterialAnalysisBloc>().add(event);
    }
  }

  @override
  Widget build(BuildContext context) {
    final action = widget.isRelease ? DataAction.release : DataAction.reject;
    final entity = Entity.materialAnalysis;

    return BlocListener<MaterialAnalysisBloc, MaterialAnalysisState>(
      listener: (context, state) {
        state.maybeWhen(
          success: () {
            widget.isRelease
                ? widget.bloc.add(
                    MaterialReceiveDetailEvent.release(
                      materialReceiveDetail: widget.detail,
                    ),
                  )
                : widget.bloc.add(
                    MaterialReceiveDetailEvent.reject(
                      materialReceiveDetail: widget.detail,
                    ),
                  );

            Toast(context).dataChanged(action, entity);
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
          action: action,
          entity: entity,
          actions: [
            BlocBuilder<MaterialAnalysisBloc, MaterialAnalysisState>(
              builder: (context, state) {
                return Button(
                  permission: null,
                  isInProgress: state.maybeWhen(
                    loading: () => true,
                    orElse: () => false,
                  ),
                  onPressed: _submit,
                  action: action,
                );
              },
            ),
          ],
          children: [
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
                  labelText: 'Qty',
                  controller: _qtyController,
                  validator: requiredValidator.call,
                ),
                FTextFormField(
                  labelText: 'Qty Sample',
                  controller: _qtySampleController,
                  validator: requiredValidator.call,
                ),
              ],
            ),
            const SizedBox(height: 24),
            RowFields(
              children: [
                FieldDatePicker(
                  onChanged: (date) => _samplingDate = date,
                  controller: _samplingDateController,
                  validator: requiredObjectValidator.call,
                  labelText: 'Sampling Date',
                ),
                BlocBuilder<DepartmentEmployeeQueryBloc,
                    DepartmentEmployeeQueryState>(
                  builder: (context, state) {
                    return FDropDownSearch<Employee>(
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
                ),
                // BlocBuilder<DriverQueryBloc, DriverQueryState>(
                //   builder: (context, state) {
                //     return FDropDownSearch<String>(
                //       validator: requiredObjectValidator.call,
                //       labelText: 'Sampling By',
                //       items: state.maybeWhen(
                //         loaded: (employees) => employees,
                //         orElse: () => [],
                //       ),
                //       onChanged: (employee) {
                //         if (employee != null) {
                //           _samplingBy = employee;
                //         }
                //       },
                //       itemAsString: (employee) => employee,
                //     );
                //   },
                // ),
              ],
            ),
            const SizedBox(height: 24),
            RowFields(
              children: [
                FTextFormField(
                  labelText: 'Qty Retain Sample',
                  controller: _qtyRetainSampleController,
                  validator: requiredValidator.call,
                ),
                // FieldDatePicker(
                //   onChanged: (date) => _retainSamplingDate = date,
                //   controller: _retainSamplingDateController,
                //   validator: requiredObjectValidator.call,
                //   labelText: 'Retain Sampling Date',
                // ),
                FieldTimePicker(
                  labelText: 'Retain Sampling Date',
                  controller: _retainSamplingDateController,
                  onChanged: (value) => _retainSamplingDate = value,
                  validator: requiredObjectValidator.call,
                ),
              ],
            ),
            const SizedBox(height: 24),
            RowFields(
              children: [
                BlocBuilder<DepartmentEmployeeQueryBloc,
                    DepartmentEmployeeQueryState>(
                  builder: (context, state) {
                    return FDropDownSearch<Employee>(
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
                ),
                FTextFormField(
                  labelText: 'Qty Pack Opened',
                  controller: _qtyPackOpenedController,
                  validator: requiredValidator.call,
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
                  validator: requiredValidator.call,
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
                BlocBuilder<DepartmentEmployeeQueryBloc,
                    DepartmentEmployeeQueryState>(
                  builder: (context, state) {
                    return FDropDownSearch<Employee>(
                      // validator: requiredObjectValidator.call,
                      labelText: 'Microbiology Release By',
                      itemAsString: (employee) => employee.name,
                      // items: state.maybeWhen(
                      //   orElse: () => [],
                      //   loaded: (employees, nip) => employees
                      //       .where((element) => nip.contains(element))
                      //       .toList(),
                      // ),
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
                ),

                // FieldDatePicker(
                //   onChanged: (date) => _microbiologyReleaseDate = date,
                //   controller: _microbiologyReleaseDateController,
                //   validator: requiredObjectValidator.call,
                //   labelText: 'Microbiology Release Date',
                // ),
                FieldTimePicker(
                  labelText: 'Microbiology Release Date',
                  controller: _microbiologyReleaseDateController,
                  onChanged: (value) => _microbiologyReleaseDate = value,
                ),
              ],
            ),
            const SizedBox(height: 24),
            RowFields(
              // mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // FieldDatePicker(
                //   onChanged: (date) => _materialReceiptDate = date,
                //   controller: _materialReceiptDateController,
                //   validator: requiredObjectValidator.call,
                //   labelText: 'Material Receipt Date',
                // ),
                FieldTimePicker(
                  labelText: 'Material Receipt Date',
                  controller: _materialReceiptDateController,
                  onChanged: (value) => _materialReceiptDate = value,
                  validator: requiredObjectValidator.call,
                ),
                // Expanded(
                //   child:
                // ),
                // SizedBox(width: 5),
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
                // Expanded(
                //   child: Column(
                //     mainAxisAlignment: MainAxisAlignment.start,
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       Container(
                //         margin: EdgeInsets.only(bottom: 10, left: 5),
                //         child: Text('Coa Availability'),
                //       ),
                //       Container(
                //         margin: EdgeInsets.only(top: 6, left: 5),
                //         child:

                //       ),
                //     ],
                //   ),
                // ),
              ],
            ),
            const SizedBox(height: 25),
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 24),
              child: Text('Material Status'),
            ),
            RowFields(
              children: [
                FTextFormField(
                  labelText: 'Vat No',
                  controller: _vatNoController,
                  enabled: false,
                ),
                FTextFormField(
                  labelText: 'Vat Total',
                  controller: _vatTotalController,
                  enabled: false,
                ),
              ],
            ),
            const SizedBox(height: 24),
            RowFields(
              children: [
                // FieldDatePicker(
                //   onChanged: (date) => _retestDate = date,
                //   controller: _retestDateController,
                //   validator: requiredObjectValidator.call,
                //   labelText: 'Retest Date',
                // ),
                FieldTimePicker(
                  labelText: 'Retest Date',
                  controller: _retestDateController,
                  onChanged: (value) => _retestDate = value,
                ),
                SizedBox(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
