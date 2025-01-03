import 'package:appointment/src/app/util/picker_file.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flexurio_chiron_finance/src/app/bloc/invoice_receive/invoice_receive_bloc.dart';
import 'package:flexurio_chiron_finance/src/app/model/invoice_receive.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class UploadDocumentForm extends StatefulWidget {
  const UploadDocumentForm._({
    required this.invoiceReceive,
  });

  static Widget prepare({
    required InvoiceReceive invoiceReceive,
  }) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => InvoiceReceiveBloc())],
      child: UploadDocumentForm._(invoiceReceive: invoiceReceive),
    );
  }

  final InvoiceReceive invoiceReceive;

  @override
  State<UploadDocumentForm> createState() =>
      _MaterialRequestDetailCreateState();
}

class _MaterialRequestDetailCreateState extends State<UploadDocumentForm> {
  final _formKey = GlobalKey<FormState>();
  final _descriptionController = TextEditingController();
  final _nameController = TextEditingController();
  late PlatformFile _file;

  void _submit(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      final event = InvoiceReceiveEvent.uploadDocument(
        invoiceReceive: widget.invoiceReceive,
        description: _descriptionController.text,
        file: _file,
        name: _nameController.text,
      );
      context.read<InvoiceReceiveBloc>().add(event);
    }
  }

  @override
  Widget build(BuildContext context) {
    const action = DataAction.add;
    final entity = Entity.invoiceReceiveDocument;

    return BlocListener<InvoiceReceiveBloc, InvoiceReceiveState>(
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
      child: SingleFormPanel(
        actions: [
          BlocBuilder<InvoiceReceiveBloc, InvoiceReceiveState>(
            builder: (context, state) {
              return Button(
                permission: null,
                isInProgress: state.maybeWhen(
                  orElse: () => false,
                  loading: () => true,
                ),
                onPressed: () => _submit(context),
                action: action,
              );
            },
          ),
        ],
        formKey: _formKey,
        action: action,
        entity: entity,
        children: [
          ChooseFile(
            onChange: (files) => _file = files.first,
            type: const ['pdf'],
            onPickFile: pickFile,
          ),
          const Gap(12),
          FTextFormField(
            labelText: 'name'.tr(),
            controller: _nameController,
            validator: requiredValidator.call,
            maxLength: 50,
          ),
          const Gap(12),
          FTextFormField(
            labelText: 'description'.tr(),
            controller: _descriptionController,
            validator: requiredValidator.call,
            maxLength: 50,
          ),
        ],
      ),
    );
  }
}
