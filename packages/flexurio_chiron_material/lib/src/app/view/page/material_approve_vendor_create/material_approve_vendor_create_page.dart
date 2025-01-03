import 'package:flexurio_chiron_vendor/src/app/bloc/material_approve_vendor/material_approve_vendor_bloc.dart';
import 'package:flexurio_chiron_material/src/app/bloc/sertificate_documents_query/sertificate_documents_query_bloc.dart';
import 'package:flexurio_chiron_vendor/src/app/model/material_approved_vendor.dart';
import 'package:flexurio_chiron_material/src/app/model/sertificate_documents.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/supplier.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/vendor.dart';
import 'package:appointment/src/app/view/widget/select_field_chip.dart';
import 'package:flexurio_chiron_material/src/app/model/material.dart' as model;
import 'package:flexurio_chiron_vendor/flexurio_chiron_vendor.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:page_transition/page_transition.dart';
import 'package:easy_localization/easy_localization.dart';

class MaterialVendorCreatePage extends StatefulWidget {
  const MaterialVendorCreatePage._({
    required this.materialApproved,
    required this.material,
  });

  final MaterialApprovedVendor? materialApproved;
  final model.Material material;

  static Route<bool?> route({
    required model.Material material,
    MaterialApprovedVendor? materialApproved,
  }) {
    return PageTransition(
      opaque: true,
      type: PageTransitionType.rightToLeft,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => MaterialApproveVendorBloc()),
          BlocProvider(
            create: (context) => VendorQueryBloc(pagination: false)
              ..add(
                VendorQueryEvent.fetch(
                  pageOptions: PageOptions.emptyNoLimit(),
                ),
              ),
          ),
          BlocProvider(
            create: (context) => SupplierQueryBloc(pagination: false)
              ..add(
                SupplierQueryEvent.fetch(
                  pageOptions: PageOptions.emptyNoLimit(),
                ),
              ),
          ),
          BlocProvider(
            create: (context) => SertificateDocumentsQueryBloc()
              ..add(
                SertificateDocumentsQueryEvent.get(
                  pageOptions: PageOptions.emptyNoLimit(),
                ),
              ),
          ),
        ],
        child: MaterialVendorCreatePage._(
          material: material,
          materialApproved: materialApproved,
        ),
      ),
    );
  }

  @override
  State<MaterialVendorCreatePage> createState() => _MaterialVendorCreatePage();
}

class _MaterialVendorCreatePage extends State<MaterialVendorCreatePage> {
  late DataAction _action;

  final _formKey = GlobalKey<FormState>();
  final _vendorController = TextEditingController();
  final _supplierController = TextEditingController();
  final _halalCertificateExpiredController = TextEditingController();
  final _halalInstitutionController = TextEditingController();
  final _halalNoCertificateController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _storageProcedureController = TextEditingController();
  final _categoryController = TextEditingController();
  final _typeController = TextEditingController();
  final _requiredObjectValidator = RequiredObjectValidator<dynamic>(
    errorText: pleaseFillOutThisField.tr(),
  );
  List<SertificateDocuments> _selectedDocuments = [];
  final List<String> _selectedDocumentsString = [];

  late MaterialApprovedVendorCategory _category;
  late MaterialApprovedVendorType _type;
  DateTime? _halalCertificateExpired;

  @override
  void initState() {
    super.initState();

    _action = createOrEdit(widget.materialApproved);

    if (_action.isEdit) {
      _category = widget.materialApproved!.category;
      _type = widget.materialApproved!.type;
      _selectedDocumentsString
          .addAll(widget.materialApproved!.sertificateDocument.split(','));
      _descriptionController.text = widget.materialApproved?.description ?? '-';
      _halalNoCertificateController.text =
          widget.materialApproved!.halalNoCertificate;
      _halalInstitutionController.text =
          widget.materialApproved!.halalInstitution;
      _halalCertificateExpired =
          widget.materialApproved!.halalCertificateExpired;
      _categoryController.text = widget.materialApproved!.category.status;
      _typeController.text = widget.materialApproved!.type.status;
      _vendorController.text = widget.materialApproved!.vendor.id;
      _storageProcedureController.text =
          widget.materialApproved!.storageProcedure;
      _supplierController.text = widget.materialApproved!.supplier.id;
    }
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      late MaterialApproveVendorEvent event;
      final selectedDocument =
          _selectedDocuments.map((document) => document.id).join(',');

      if (_action.isEdit) {
        event = MaterialApproveVendorEvent.update(
          id: widget.materialApproved!.id,
          materialId: widget.material.id,
          vendorId: _vendorController.text,
          supplierId: _supplierController.text,
          description: _descriptionController.text.isEmpty
              ? ''
              : _descriptionController.text,
          storageProcedure: _storageProcedureController.text,
          category: _category.status,
          type: _type.status,
          certificateDocumentId: selectedDocument,
        );
      } else {
        event = MaterialApproveVendorEvent.create(
          materialId: widget.material.id,
          vendorId: _vendorController.text,
          supplierId: _supplierController.text,
          halalInstitution: _halalInstitutionController.text.isEmpty
              ? ''
              : _halalInstitutionController.text,
          description: _descriptionController.text.isEmpty
              ? ''
              : _descriptionController.text,
          storageProcedure: _storageProcedureController.text,
          category: _category.status,
          type: _type.status,
          certificateDocumentId: selectedDocument,
          halalCertificateExpired: _halalCertificateExpired,
          halalNoCertifikate: _halalNoCertificateController.text.isEmpty
              ? ''
              : _halalNoCertificateController.text,
        );
      }
      context.read<MaterialApproveVendorBloc>().add(event);
    }
  }

  @override
  Widget build(BuildContext context) {
    final action = createOrEdit(widget.materialApproved);
    return BlocListener<MaterialApproveVendorBloc, MaterialApproveVendorState>(
      listener: (context, state) {
        state.maybeWhen(
          success: () {
            Toast(context).dataChanged(_action, Entity.materialApproveVendor);
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
          entity: Entity.materialApproveVendor,
          actions: const [],
          children: [
            BlocBuilder<MaterialApproveVendorBloc, MaterialApproveVendorState>(
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FDropDownSearchVendor(
                      initialValue: widget.materialApproved?.vendor,
                      onChanged: (vendor) {
                        _vendorController.text = vendor?.id ?? '';
                      },
                    ),
                    const Gap(24),
                    FDropDownSearchSupplier(
                      initialValue: widget.materialApproved?.supplier,
                      onChanged: (supplier) {
                        _supplierController.text = supplier?.id ?? '';
                      },
                    ),
                    const Gap(24),
                    FTextFormField(
                      labelText: 'Storage Procedure',
                      controller: _storageProcedureController,
                      validator: requiredValidator.call,
                      maxLength: 255,
                    ),
                    const Gap(24),
                    SelectChipField<MaterialApprovedVendorCategory>(
                      label: 'Category',
                      getLabel: (category) => category.status,
                      controller: _categoryController,
                      validator: requiredValidator.call,
                      options: const [
                        MaterialApprovedVendorCategory.herbs,
                        MaterialApprovedVendorCategory.cosmetics,
                        MaterialApprovedVendorCategory.drug,
                        MaterialApprovedVendorCategory.supplement,
                        MaterialApprovedVendorCategory.auxiliaryMaterial,
                        MaterialApprovedVendorCategory.kemasan,
                      ],
                      onChanged: (category) {
                        _category = category;
                      },
                    ),
                    const Gap(24),
                    FTextFormField(
                      labelText: 'Description',
                      controller: _descriptionController,
                      maxLines: 4,
                      maxLength: 500,
                    ),
                    const Gap(24),
                    SelectChipField<MaterialApprovedVendorType>(
                      label: 'Type',
                      getLabel: (type) => type.status,
                      controller: _typeController,
                      validator: requiredValidator.call,
                      options: const [
                        MaterialApprovedVendorType.aslBahanPengemas,
                        MaterialApprovedVendorType.aslBahanAwal,
                        MaterialApprovedVendorType.aslBahanPenolong,
                      ],
                      onChanged: (type) {
                        _type = type;
                      },
                    ),
                    const SizedBox(height: 45),
                    Text(
                      'Halal Certificate',
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Gap(24),
                    BlocBuilder<SertificateDocumentsQueryBloc,
                        SertificateDocumentsQueryState>(
                      builder: (context, state) {
                        final dataSertificateDocuments = state.maybeWhen(
                          orElse: () => <SertificateDocuments>[],
                          loaded: (document) => document.data,
                        );
                        final sertificateDocuments = <SertificateDocuments>[];
                        for (final sertificateDocument
                            in dataSertificateDocuments) {
                          if (_selectedDocumentsString
                              .contains(sertificateDocument.id)) {
                            sertificateDocuments.add(sertificateDocument);
                          }
                        }
                        _selectedDocuments = sertificateDocuments;
                        return FDropDownSearchMultiple<SertificateDocuments>(
                          validator: _requiredObjectValidator.call,
                          status: state.maybeWhen(
                            error: (_) => Status.error,
                            loading: (_) => Status.progress,
                            orElse: () => Status.loaded,
                          ),
                          labelText: 'Certificate Document',
                          items: state.maybeWhen(
                            orElse: () => [],
                            loaded: (document) => document.data,
                          ),
                          onChanged: (document) {
                            _selectedDocuments = document;
                          },
                          dropdownBuilder: (context, selectedItems) {
                            final theme = Theme.of(context);
                            return Wrap(
                              spacing: 10, // adjust as needed
                              children: selectedItems.map((e) {
                                return Container(
                                  decoration: BoxDecoration(
                                    color:
                                        theme.colorScheme.primary.lighten(.33),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                  margin: const EdgeInsets.only(top: 8),
                                  padding: const EdgeInsets.only(left: 12),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        e.id,
                                        style: TextStyle(
                                          color: theme.colorScheme.primary,
                                        ),
                                      ),
                                      IconButton(
                                        icon: Icon(
                                          Icons.close,
                                          color: theme.colorScheme.primary,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            selectedItems.remove(e);
                                            _selectedDocuments.remove(e);
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              }).toList(),
                            );
                          },
                          selectedItems: _selectedDocuments,
                          itemAsString: (document) => document.id,
                        );
                      },
                    ),
                    if (action.isCreate)
                      Column(
                        children: [
                          const Gap(24),
                          FTextFormField(
                            labelText: 'Halal No. Certificate',
                            controller: _halalNoCertificateController,
                            maxLength: 50,
                          ),
                          const Gap(24),
                          FTextFormField(
                            labelText: 'Halal Institution',
                            controller: _halalInstitutionController,
                            maxLength: 50,
                          ),
                          const Gap(24),
                          FieldDatePicker(
                            onChanged: (value) =>
                                _halalCertificateExpired = value,
                            labelText: 'Halal Certificate Expired',
                            controller: _halalCertificateExpiredController,
                            minDate: DateTime.now(),
                            initialSelectedDate: widget
                                .materialApproved?.halalCertificateExpired,
                          ),
                        ],
                      ),
                    const Gap(24),
                    Button(
                      permission: null,
                      onPressed: state.maybeWhen(
                        loading: () => null,
                        orElse: () => _submit,
                      ),
                      action: action,
                    ),
                    const Gap(24),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
