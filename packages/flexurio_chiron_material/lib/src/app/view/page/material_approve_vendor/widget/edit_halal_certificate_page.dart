import 'package:flexurio_chiron_vendor/src/app/bloc/material_approve_vendor/material_approve_vendor_bloc.dart';
import 'package:flexurio_chiron_vendor/src/app/model/material_approved_vendor.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:page_transition/page_transition.dart';

class MaterialApprovedVendorEditHalalCertificatePage extends StatefulWidget {
  const MaterialApprovedVendorEditHalalCertificatePage({
    required this.materialApprovedVendor,
    super.key,
  });

  final MaterialApprovedVendor materialApprovedVendor;

  static Route<bool?> route(MaterialApprovedVendor materialApprovedVendor) {
    return PageTransition(
      opaque: true,
      type: PageTransitionType.rightToLeft,
      child: BlocProvider(
        create: (context) => MaterialApproveVendorBloc(),
        child: MaterialApprovedVendorEditHalalCertificatePage(
          materialApprovedVendor: materialApprovedVendor,
        ),
      ),
    );
  }

  @override
  State<MaterialApprovedVendorEditHalalCertificatePage> createState() =>
      _MaterialApprovedVendorEditHalalCertificatePageState();
}

class _MaterialApprovedVendorEditHalalCertificatePageState
    extends State<MaterialApprovedVendorEditHalalCertificatePage> {
  final _formKey = GlobalKey<FormState>();
  final _halalNoCertificateController = TextEditingController();
  final _halalInstitutionController = TextEditingController();
  late DateTime _halalCertificateExpired;
  final _halalCertificateController = TextEditingController();

  final action = DataAction.edit;
  final entity = Entity.materialApproveVendor;

  @override
  void initState() {
    if (action.isEdit) {
      _halalCertificateExpired =
          widget.materialApprovedVendor.halalCertificateExpired!;
      _halalNoCertificateController.text =
          widget.materialApprovedVendor.halalNoCertificate;
      _halalInstitutionController.text =
          widget.materialApprovedVendor.halalInstitution;
      _halalCertificateController.text =
          widget.materialApprovedVendor.halalCertificateExpired?.yMMMMd ?? '';
    }
    super.initState();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      context.read<MaterialApproveVendorBloc>().add(
            MaterialApproveVendorEvent.editHalalCertificate(
              materialApprovedVendor: widget.materialApprovedVendor,
              halalCertificateExpired: _halalCertificateExpired,
              halalInstitution: _halalInstitutionController.text,
              halalNoCertificate: _halalNoCertificateController.text,
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<MaterialApproveVendorBloc, MaterialApproveVendorState>(
      listener: (context, state) {
        state.maybeWhen(
          success: () {
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
            BlocBuilder<MaterialApproveVendorBloc, MaterialApproveVendorState>(
              builder: (context, state) {
                final isInProgress = state.maybeWhen(
                  orElse: () => false,
                  loading: () => true,
                );
                return Button(
                  action: action,
                  permission: null,
                  onPressed: _submit,
                  isInProgress: isInProgress,
                );
              },
            ),
          ],
          children: [
            FieldDatePicker(
              initialSelectedDate:
                  widget.materialApprovedVendor.halalCertificateExpired,
              labelText: 'halal_certificate_expired'.tr(),
              controller: _halalCertificateController,
              onChanged: (value) => _halalCertificateExpired = value,
              validator: requiredObjectValidator.call,
              minDate: DateTime.now(),
            ),
            const Gap(24),
            FTextFormField(
              labelText: 'halal_institution'.tr(),
              controller: _halalInstitutionController,
              validator: requiredValidator.call,
            ),
            const Gap(24),
            FTextFormField(
              labelText: 'halal_no_certificate'.tr(),
              controller: _halalNoCertificateController,
              validator: requiredValidator.call,
            ),
          ],
        ),
      ),
    );
  }
}
