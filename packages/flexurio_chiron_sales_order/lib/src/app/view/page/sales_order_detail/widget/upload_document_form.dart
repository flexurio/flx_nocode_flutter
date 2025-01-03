import 'package:easy_localization/easy_localization.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flexurio_chiron_sales_order/flexurio_chiron_sales_order.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class SalesOrderUploadDocumentForm extends StatefulWidget {
  const SalesOrderUploadDocumentForm._({
    required this.salesOrder,
    required this.onPickFile,
  });

  static Widget prepare({
    required SalesOrder salesOrder,
    required OnPickFile onPickFile,
  }) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => SalesOrderBloc())],
      child: SalesOrderUploadDocumentForm._(
        salesOrder: salesOrder,
        onPickFile: onPickFile,
      ),
    );
  }

  final SalesOrder salesOrder;
  final OnPickFile onPickFile;

  @override
  State<SalesOrderUploadDocumentForm> createState() =>
      _MaterialRequestDetailCreateState();
}

class _MaterialRequestDetailCreateState
    extends State<SalesOrderUploadDocumentForm> {
  final _formKey = GlobalKey<FormState>();
  final _descriptionController = TextEditingController();
  late PlatformFile _file;

  void _submit(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      final event = SalesOrderEvent.uploadDataSalesOrder(
        widget.salesOrder,
        _descriptionController.text,
        _file,
      );
      context.read<SalesOrderBloc>().add(event);
    }
  }

  @override
  Widget build(BuildContext context) {
    const action = DataAction.add;
    final entity = Entity.salesOrderDocument;

    return BlocListener<SalesOrderBloc, SalesOrderState>(
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
          BlocBuilder<SalesOrderBloc, SalesOrderState>(
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
            onChange: (file) => _file = file.first,
            type: const ['pdf'],
            onPickFile: widget.onPickFile,
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
