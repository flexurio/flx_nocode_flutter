import 'package:flexurio_chiron_accounting/src/app/model/entity.dart';
import 'package:flexurio_chiron_accounting/src/app/bloc/payment/payment_bloc.dart';
import 'package:appointment/src/app/util/picker_file.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:file_picker/file_picker.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class PaymentSalaryUploadPage extends StatefulWidget {
  const PaymentSalaryUploadPage._();

  static Widget prepare() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => PaymentBloc()),
      ],
      child: const PaymentSalaryUploadPage._(),
    );
  }

  @override
  State<PaymentSalaryUploadPage> createState() =>
      _PaymentSalaryUploadPageState();
}

class _PaymentSalaryUploadPageState extends State<PaymentSalaryUploadPage> {
  final _formKey = GlobalKey<FormState>();
  final _registerNoController = TextEditingController();
  final _dateController = TextEditingController();
  DateTime? _date;
  late PlatformFile _file;

  @override
  void initState() {
    super.initState();
  }

  void _clearForm() {
    _registerNoController.text = '';
    setState(() {});
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      context.read<PaymentBloc>().add(
            PaymentEvent.uploadSalaries(
              file: _file,
              registerNo: _registerNoController.text,
              date: _date!,
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    const action = DataAction.upload;
    final entity = EntityAccounting.paymentSalary;

    return BlocListener<PaymentBloc, PaymentState>(
      listener: (context, state) {
        state.maybeWhen(
          success: (_) {
            Toast(context).dataChanged(action, entity);
            _clearForm();
          },
          error: (error) => Toast(context).fail(error),
          orElse: () {},
        );
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            TitlePage(entity: entity),
            const Gap(12),
            SingleFormPanel(
              visibleBackButton: false,
              formKey: _formKey,
              action: action,
              entity: entity,
              actions: [
                BlocBuilder<PaymentBloc, PaymentState>(
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
                FTextFormField(
                  labelText: 'Register No',
                  controller: _registerNoController,
                  validator: requiredValidator.call,
                  maxLength: 30,
                ),
                const Gap(12),
                FieldDatePicker(
                  onChanged: (value) => _date = value,
                  controller: _dateController,
                  initialSelectedDate: _date,
                  validator: requiredObjectValidator.call,
                  labelText: 'date'.tr(),
                ),
                const Gap(12),
                ChooseFileFormField(
                  key: UniqueKey(),
                  type: const ['csv'],
                  validator: requiredObjectValidator.call,
                  onChange: (file) => _file = file.first,
                  onPickFile: pickFile,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
